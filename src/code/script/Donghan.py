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
        
        self.cnt = 0
        self.f_time = 0
        self.prev_miss = 0
        self.miss = 0
        
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
    

    def warp_image2(self,img):
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
        y1,x1 = img.shape[:2] 
        w_img = img.copy()
        gray_img = cv2.cvtColor(w_img,cv2.COLOR_BGR2GRAY)
       

        bin_img = np.zeros_like(gray_img)
        bin_img2 = np.zeros_like(gray_img)
        bin_img[gray_img>50] = 1

        bin_img2[gray_img>50] = 255
        # xx= bin_img[y1//2:]
        

        curve_indices = np.sum(bin_img[:y1//2,x1//2:])
        print("histogrma:",curve_indices)
        

        # print(bin_img.shape)
        histogram = np.sum(bin_img[y1//2:], axis=0)
        left_hist = histogram[:x1//2]
        right_hist = histogram[x1//2:]

        indices = np.where(histogram>20)[0]
        left_indices =np.where(left_hist>20)[0]
        right_indices = np.where(right_hist>20)[0]+320
        
        
        return indices, left_indices, right_indices, bin_img2, curve_indices

    # def miss1_histogram_idx(self, img) :

    def find_stop_line(self, img) :
        y1 ,x1 = img.shape[:2] 
        w_img = img.copy()
        gray_img = cv2.cvtColor(w_img,cv2.COLOR_BGR2GRAY)
       

        bin_img = np.zeros_like(gray_img)
        bin_img[gray_img>50] = 1
        
        # xx= bin_img[y1//2:]
       
        
        histogram_y = np.sum(bin_img[y1//2:], axis=1)
        # print(f"len: {len(histogram[histogram>450])}")
        cross_indices = np.where(histogram_y>400)[0]+240
        try :
            print(cross_indices[-1]-cross_indices[0])
            if (cross_indices[-1]-cross_indices[0]) >20 :
                self.cnt+=1
        except :
            pass
        # left_hist = histogram[:x1//2]
        # right_hist = histogram[x1//2:]
        # print(f"{self.miss}_cnt : {self.cnt}")
        # indices = np.where(histogram>10)[0]
        # left_indices =np.where(left_hist>10)[0]
        # right_indices = np.where(right_hist>10)[0]+320
        
        return 1
    
    # def control_steer(self, c,s,d) :
    #     if self.miss == 1 :
    #         steer = (c-s)*(d)
    #         steer+=0.5
    #     elif self.miss ==2 :
    #         steer = (c-s)*(d)
    #         steer+=0.5
    #     elif self.miss ==3 :
    #         steer = (c-s)*(d)
    #         steer+=0.5
    #     else :
    #         steer = (c-s)*(d)
    #         steer+=0.5


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
        self.f_time+=1
        if (self.miss != self.prev_miss) :
            self.f_time=0
            self.prev_miss = self.miss
        if self.f_time <10 :
            self.cnt=0

        if self.cnt >= 10 and self.prev_miss==0 and self.f_time >80:
            self.miss=1
            self.cnt=0
            print("miss1")
        elif self.cnt >= 10 and self.prev_miss==1 and self.f_time >80:
            self.miss=2
            self.cnt=0
            print("miss2")
        elif self.cnt >= 10 and self.miss==2 and self.f_time >80:
            self.miss=3
            self.cnt=0
            print("miss3")
        elif self.cnt >= 10 and self.miss==3 and self.f_time >80:
            self.miss=4
            self.cnt=0
            print("miss4")
        elif self.cnt >= 10 and self.miss==4 and self.f_time >20:
            self.miss=5
            self.cnt=0
            print("miss5")
        
    

        print(f"time : {self.f_time}")

        is_flag =False

        try :
            if len(left_indices)!=0 and len(right_indices)!=0 :
                center_index= (indices[0]+indices[-1])//2
                print("both_line")
            elif len(left_indices)!=0 and len(right_indices)==0 :
                center_index= (left_indices[0]+left_indices[-1])//2
                print("left_line")

            elif len(left_indices)==0 and len(right_indices)!=0 :
                
                center_index= (right_indices[0]+right_indices[-1])//2
                # if self.miss == 1 or self.miss==2 or self.miss==3:
                #     center_index=320 
                #     print(f"center : {center_index} right_indices: {right_indices[-1]}")
                is_flag= True
                
                print("right_line ")
            else:
                center_index = x1//2
                print("no_line")
            
        except :
            center_index = x1//2
            print("no_line")
        
        
        
        
    
        standard_index = x1//2
        degree_per_pixel = 1/x1    
        steer = (center_index-standard_index)*(degree_per_pixel)*0.1
        steer+=0.5
         
        if is_flag==True :    #미션 1이후 control
            if (right_indices[0]-standard_index)>180 and (right_indices[0]-standard_index)<190 :
                steer=0.5
            elif (right_indices[0]-standard_index)<180 :
                steer=0.47
            elif (right_indices[0]-standard_index)>190 :
                steer=0.53
            else:
                steer = 0.5    

        if curve == 0:
            steer = 0.10
        
       
        
        # print(f"center : {center_index}, steer : {steer}")
        # print(f"{center_index} , {steer}")
        #좌측으로 붙으면 센터값이 중앙값보다 커지고,
        #우측으로 틀려면 조향각이 + 
        # cv2.line(warp_img,(center_index,0),(center_index,y1),[255,0,0],6)
                
        cv2.line(warp_img,(standard_index,0),(standard_index,y1),[0,255,255],6)
        cv2.line(warp_img,(0,y1//2),(x1,y1//2),[0,0,255],6)

        self.steer_msg.data = steer
        self.speed_msg.data = 3000
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