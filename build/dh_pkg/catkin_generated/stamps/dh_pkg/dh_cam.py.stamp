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
from dh_pkg.msg import cam_msg

class IMGParser:
    def __init__(self):
        rospy.init_node('image_parser', anonymous=True)
        self.image_sub = rospy.Subscriber("/image_jpeg/compressed", CompressedImage, self.callback)
        self.cam_pub = rospy.Publisher('/Cam_dectection', cam_msg, queue_size =10)

        self.cam_detect_msg = cam_msg() 

        self.image_msg = CompressedImage()

      
        self.bridge = CvBridge()
        
        self.yelloMin = np.array([15,128,0])
        self.yelloMax = np.array([40,255,255])
        self.whiteMin = np.array([0,0,192])
        self.whiteMax = np.array([179,64,255])

        # self.blueMin = np.array([92,158,45])
        # self.blueMax = np.array([120,250,255])
        self.blueMin = np.array([110,229,0])
        self.blueMax = np.array([117,253,54])
        # self.blueMin = np.array([110,242,0])
        # self.blueMax = np.array([116,255,40])
        
        self.crops = np.array([[[180,280],
                               [180,245],
                               [370,245],
                               [370,280]]])
        
        self.stop_flag = 0
        self.mission = 0
        self.prev_mission = 0

        self.mission_time = 1.0
        

        self.blue_img_roi =[]
        self.is_dynamic_flag=False
        self.stop_line_flag=False

                
    def colorFilter(self, img) :
        img_c = img.copy()
        img_hsv= cv2.cvtColor(img_c,cv2.COLOR_BGR2HSV)
        w = cv2.inRange(img_hsv,self.whiteMin, self.whiteMax)
        y = cv2.inRange(img_hsv,self.yelloMin, self.yelloMax)
        b = cv2.inRange(img_hsv,self.blueMin,self.blueMax)

        img_wy =cv2.bitwise_or(w,y)        
        # xx= bin_img[y1//2:]
        
        
        img_wy = cv2.bitwise_and(img,img,mask=img_wy)
        img_b = cv2.bitwise_and(img,img,mask=b)
        
        return img_wy, img_b

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
      

    def find_stop_line(self, img) :
        y1,x1 = img.shape[:2] 
        w_img = img.copy()
        gray_img = cv2.cvtColor(w_img,cv2.COLOR_BGR2GRAY)
       

        bin_img = np.zeros_like(gray_img)
        bin_img2 = np.zeros_like(gray_img)

        bin_img[gray_img>50] = 1
        
        histogram_y = np.sum(bin_img[y1//4*3:], axis=1)
        # print(f"len: {len(histogram[histogram>450])}")
        cross_indices = np.where(histogram_y>400)[0]
        try :
            if (cross_indices[-1]-cross_indices[0]) >20 :
                if(self.stop_line_flag == False) :
                    self.stop_line_flag =True
                    self.mission+=1
            else :
                self.stop_line_flag=False
        except :
            pass
        
        
        return 1
    
    def callback(self, msg):
        try:
            self.image_msg = msg
            cv_img = self.bridge.compressed_imgmsg_to_cv2(self.image_msg)
            
        except CvBridgeError as e:
            print(e)

        yw_img, b_img =self.colorFilter(cv_img) 
    
        c22 =self.selectRoi(cv_img)
        b_img =self.selectRoi(b_img)
        warp_img,b=self.warp_image(yw_img)
        self.blue_img_roi = b_img
        
        self.find_stop_line(warp_img)

        if (self.mission != self.prev_mission) :
            self.mission_time=0
            self.prev_mission = self.mission

        b_img_g= cv2.cvtColor(b_img,cv2.COLOR_BGR2GRAY)
        bin_img = np.zeros_like(b_img_g)
        
        bin_img[b_img_g>10] = 1
        by = np.sum(bin_img, axis=0)
        self.mission_time+=1
        
        if(len(by[by>3]) >3 ) :
            self.is_dynamic_flag = True
        else :
            if(self.is_dynamic_flag==True) :
                if(len(by[by>3])<1) :
                    self.is_dynamic_flag=False
        print("isBLUE : ",self.is_dynamic_flag)

        self.cam_detect_msg.mission = self.mission
        self.cam_detect_msg.mission_time = self.mission_time
        self.cam_detect_msg.is_dynamic_obs = self.is_dynamic_flag
        self.cam_detect_msg.is_stop_flag = self.stop_line_flag

        self.cam_pub.publish(self.cam_detect_msg)

        # cv2.imshow('iii',warp_img)
        # cv2.imwrite('/home/autonav/Pictures/a.jpg',cv_img)
        # cv2.imshow("class",cv_img)
        # cv2.imshow('ccf',c22)
        # cv2.imshow("img",b_img)
        # cv2.waitKey(1)
        
        # self.rate.sleep()

def main() :
    try :
        image_parser = IMGParser()
        rospy.spin()
    except rospy.ROSInitException :
        pass


if __name__ == '__main__':
    main()