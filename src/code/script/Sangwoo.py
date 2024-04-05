#13sim_cam_lane_detection.py
#!/usr/bin/env python3
#_*_ coding:utf-8 _*_
import rospy
import cv2
from cv_bridge import CvBridge ,CvBridgeError
import numpy as np
# from morai_msgs.msg import Ctrlcmd
from std_msgs.msg import Float64
from sensor_msgs.msg import CompressedImage
import time


class IMGParser:
    def __init__(self):
        rospy.init_node('image_parser', anonymous=True)
        # self.pub = rospy.Publisher("/ctrl_cmd_0", )
        self.image_sub = rospy.Subscriber("/image_jpeg/compressed", CompressedImage, self.callback)
        self.speed_pub= rospy.Publisher('/commands/motor/speed',Float64,queue_size=1)
        self.steer_pub = rospy.Publisher('/commands/servo/position',Float64,queue_size=1)
        self.image_msg = CompressedImage()
    

        self.speed_msg = Float64()
        self.steer_msg=Float64()

        self.bridge = CvBridge()
        
        self.yelloMin = np.array([15,128,0])
        self.yelloMax = np.array([40,255,255])
        self.whiteMin = np.array([0,0,192])
        self.whiteMax = np.array([179,64,255])


        self.crops = np.array([[[0,480],
                               [230,280],
                               [400,280],
                               [640,480]]])
        
        self.stop_count = 0
        self.mission_flag = 0
        self.prev_mission = 0
        self.mission = 0
        self.mission_3_time=0
        self.current_time = 0
        self.start_time = 0
        self.time =[]
        self.current_gradient = 0
        
    def colorFilter(self, img) :
        img2 = img.copy()
        img_hsv= cv2.cvtColor(img2,cv2.COLOR_BGR2HSV)
        w = cv2.inRange(img_hsv,self.whiteMin, self.whiteMax)
        y = cv2.inRange(img_hsv,self.yelloMin, self.yelloMax)
        
        img2 =cv2.bitwise_or(w,y)
        
        img2 = cv2.bitwise_and(img,img,mask=img2)
        
        return img2

    def selectRoi(self, arr) :
        
        arr2 = arr.copy()
        mask = np.zeros_like(arr2, np.uint8)
        if (len(arr2.shape)==3) :
            mask_value = (255,255,255)
        else :
            mask_value = (255)
        cv2.fillPoly(mask,self.crops, mask_value)
        mask = cv2.bitwise_and(mask,arr2)
        return mask


    def warp_image(self,img):
        image_size = (img.shape[1], img.shape[0])
        
        x = img.shape[1]
        y = img.shape[0]
        destination_points = np.float32([
            [x//8,480],
            [x//8,0],
            [x//8*7,0],
            [x//8*7,480]                       
        ])
        
        source_points = np.float32([[0,420],
                               [275,260],
                               [x-275,260],
                               [x,420]])
        perspective_transform = cv2.getPerspectiveTransform(source_points, destination_points)
        minv = cv2.getPerspectiveTransform(destination_points,source_points)
        warped_img = cv2.warpPerspective(img, perspective_transform, image_size, flags=cv2.INTER_LINEAR)
            
        return warped_img, minv
      
    def base_histogram_idx(self, img) :
        y1 , x1 = img.shape[:2] 
        w_img = img.copy()
        gray_img = cv2.cvtColor(w_img,cv2.COLOR_BGR2GRAY)
       

        bin_img = np.zeros_like(gray_img)
        bin_img2 = np.zeros_like(gray_img)
        bin_img[gray_img>50] = 1

        bin_img2[gray_img>50] = 255
        # xx= bin_img[y1//2:]
        

        curve_indices = np.sum(bin_img[:y1//2,x1//2:])
        # print("histogrm:",curve_indices)
        

        # print(bin_img.shape)
        histogram = np.sum(bin_img[y1//2:], axis=0)
        histogram2 = np.sum(bin_img, axis=0)
        histogram_y2 = np.sum(bin_img,axis=1)
        a = histogram2[histogram2>10]
        b = histogram_y2[histogram_y2>10]
        # print(histogram_y2)

        left_hist = histogram[:x1//2]
        right_hist = histogram[x1//2:]
        hist1 = np.where(a<60)[0]
        hist2 = np.where(b<60)[0]
        # self.current_gradient = (len(hist2)-0)/(0-len(hist1))
        try :
            self.current_gradient = (len(hist2)-0)/(0-len(hist1))
            # if abs(self.current_gradient) < 0.7:
                # print("기울기 : ", self.current_gradient)
            print("기울기 : ", self.current_gradient)
        except :
            self.current_gradient =100
        indices = np.where(histogram>20)[0]
        left_indices =np.where(left_hist>20)[0]
        right_indices = np.where(right_hist>20)[0]+320
        
        
        return indices, left_indices, right_indices, bin_img2, curve_indices

    # def miss1_histogram_idx(self, img) :

    def find_stop_line(self, img) :
        y1,x1 = img.shape[:2] 
        w_img = img.copy()
        gray_img = cv2.cvtColor(w_img,cv2.COLOR_BGR2GRAY)
       

        bin_img = np.zeros_like(gray_img)
        bin_img[gray_img>50] = 1
        
        # xx= bin_img[y1//2:]
       
        
        histogram_y = np.sum(bin_img[y1//2:], axis=1)
        # print(f"len: {len(histogram[histogram>450])}")
        cross_indices = np.where(histogram_y>400)[0]+240
        try :
            # print(cross_indices[-1]-cross_indices[0])
            if (cross_indices[-1]-cross_indices[0]) >20 :
                self.stop_count+=1
        except :
            pass
        # left_hist = histogram[:x1//2]
        # right_hist = histogram[x1//2:]
        # print(f"{self.mission}_cnt : {self.stop_count}")
        # indices = np.where(histogram>10)[0]
        # left_indices =np.where(left_hist>10)[0]
        # right_indices = np.where(right_hist>10)[0]+320
        
        return 1
    
    def action_cam(self,x1,y1,left_indices,right_indices,indices,curve):
        standard_index = x1//2
        try :
                if len(left_indices)!=0 and len(right_indices)!=0 :
                    center_index= (indices[0]+indices[-1])//2
                    print("both_line")
                elif len(left_indices)!=0 and len(right_indices)==0 :
                    center_index= (left_indices[0]+left_indices[-1])//2
                    print("left_line")
                elif len(left_indices)==0 and len(right_indices)!=0 :
                    center_index= (right_indices[0]+right_indices[-1])//2

                    print("right_line ")
                else:
                    center_index = x1//2
                    print("no_line")
        except :
            center_index = x1//2
            print("no_line")
        degree_per_pixel = 1/x1    
        steer = (center_index-standard_index)*(degree_per_pixel)
        steer+=0.5
        return steer, standard_index
        

    def action_line(self,x1,y1,left_indices,right_indices,indices,curve):
        standard_index = x1//2
        try:
            if (right_indices[-1]-standard_index)>180 and (right_indices[-1]-standard_index)<200:
                steer=0.5
            elif (right_indices[-1]-standard_index)<=180 :
                steer=0.485
            elif (right_indices[-1]-standard_index)>=200 :
                steer=0.515
            else:
                steer = 0.5 

            # error_pixel = (right_indices[0] - standard_index) - 180 #180보다 크면 0.5보다 크게 180보다 작으면 0.5보다 작게
            # steer = error_pixel * (1/10000) + 0.5 
        except:
            steer =0.5
        if curve == 0 and self.mission ==4:
            steer = 0.012
        return steer, standard_index
    
    def action_m3(self,x1,y1,left_indices,right_indices,indices,curve):
        standard_index = x1 //2
        if self.mission == 3 and abs(self.current_gradient) > 0.7:  
            try :
                    if len(left_indices)!=0 and len(right_indices)!=0 :
                        center_index= (indices[0]+indices[-1])//2
                        print("both_line")
                    elif len(left_indices)!=0 and len(right_indices)==0 :
                        center_index= (left_indices[0]+left_indices[-1])//2
                        print("left_line")
                    elif len(left_indices)==0 and len(right_indices)!=0 :
                        center_index= (right_indices[0]+right_indices[-1])//2

                        print("right_line ")
                    else:
                        center_index = x1//2
                        print("no_line")
            except :
                center_index = x1//2
                print("no_line")
            degree_per_pixel = 1/x1    
            steer = (center_index-standard_index)*(degree_per_pixel)
            steer+=0.5
        else:
            # center_index= (indices[0]+indices[-1])//2
            steer = self.current_gradient* 0.455 +0.5 

        # degree_per_pixel = 1/x1    
        # steer = (center_index-standard_index)*(degree_per_pixel)
        # steer+=0.5
        return steer, standard_index
        # standard_index = x1//2
        # self.current_time = time.time()
        # self.mission_3_time = self.current_time - self.start_time

        # print(self.mission_3_time)
        # # print(self.current_time)
        # # print(self.start_time)

        # if self.mission ==3 and 0 < self.mission_3_time < 0.38:
        #     steer , standard_index = self.action_cam(x1,y1,left_indices,right_indices,indices,curve)
        # elif self.mission ==3 and 0.38 <= self.mission_3_time <2.0:
        #     steer = 0.24
        # elif self.mission ==3 and 2.0 <= self.mission_3_time :
        #     steer , standard_index = self.action_line(x1,y1,left_indices,right_indices,indices,curve)

        # return steer, standard_index

    def callback(self, msg):
        try:
            self.image_msg = msg
            cv_img = self.bridge.compressed_imgmsg_to_cv2(self.image_msg)
            
        except CvBridgeError as e:
            print(e)

        y1,x1 = cv_img.shape[:2]
        s =self.colorFilter(cv_img)
        # s =self.selectRoi(s)
        warp_img,b=self.warp_image(s)

        
        indices, left_indices, right_indices, bin, curve =self.base_histogram_idx(warp_img)
        
        self.find_stop_line(warp_img)
        # print(f"hist : {histogram}")
        self.mission_flag+=1
        if (self.mission != self.prev_mission) :
            self.mission_flag=0
            self.prev_mission = self.mission

        if self.mission_flag < 10:
            self.stop_count=0

        if self.stop_count >= 5 and self.prev_mission==0 and self.mission_flag >20:  #미션 1
            self.mission=1
            self.stop_count=0
            

        elif self.stop_count >= 5 and self.prev_mission==1 and self.mission_flag >20: #미션 2
            self.mission=2
            self.stop_count=0
            
            
        elif self.stop_count >= 5 and self.mission==2 and self.mission_flag >20: #미션 3
            self.mission=3
            self.stop_count=0
            if len(self.time) == 0:
                self.time.append(time.time())
            self.start_time = self.time[0]

        elif self.stop_count >= 5 and self.mission==3 and self.mission_flag >20:  #미션 4
            self.mission=4
            self.stop_count=0
            
        elif self.stop_count >= 5 and self.mission==4 and self.mission_flag >20:  #미션 5
            self.mission=5
            self.stop_count=0
            


        if self.mission == 0:
            steer, standard_index =self.action_line(x1,y1,left_indices,right_indices,indices,curve)
            print("mission 0")
        elif self.mission ==1:
            steer, standard_index =self.action_line(x1,y1,left_indices,right_indices,indices,curve)
            print("mission 1")
        elif self.mission ==2:
            steer, standard_index =self.action_line(x1,y1,left_indices,right_indices,indices,curve)
            print("mission 2")
        elif self.mission ==3:
            steer, standard_index =self.action_m3(x1,y1,left_indices,right_indices,indices,curve)
            print("mission 3")
        elif self.mission ==4:
            steer, standard_index =self.action_line(x1,y1,left_indices,right_indices,indices,curve)
            print("mission 4")
        elif self.mission ==5:
            steer, standard_index =self.action_line(x1,y1,left_indices,right_indices,indices,curve)
            print("mission 5")
        else:
            steer, standard_index =self.action_line(x1,y1,left_indices,right_indices,indices,curve)
            print("mission ?")
        
        # print(f"time : {self.mission_flag}")

         
        
        # print(f"center : {center_index}, steer : {steer}")
        # print(f"{center_index} , {steer}")
        #좌측으로 붙으면 센터값이 중앙값보다 커지고,
        #우측으로 틀려면 조향각이 + 
        # cv2.line(warp_img,(center_index,0),(center_index,y1),[255,0,0],6)
                
        cv2.line(warp_img,(standard_index,0),(standard_index,y1),[0,255,255],6)
        cv2.line(warp_img,(0,y1//2),(x1,y1//2),[0,0,255],6)

        self.steer_msg.data = steer
        self.speed_msg.data = 2000
        self.speed_pub.publish(self.speed_msg)
        self.steer_pub.publish(self.steer_msg)
        

        cv2.imshow('iii',bin)
        cv2.imshow("class",cv_img)
        cv2.imwrite("/home/autonav/Pictures/b1.jpg",warp_img)
        cv2.imshow("img",warp_img)
        cv2.waitKey(1)
        
        # self.rate.sleep()

def main() :
    try :
        image_parser = IMGParser()
        rospy.spin()
    except rospy.ROSInitException :
        pass


if __name__ == '__main__':
    main()