#!/usr/bin/env python3
#-*- coding:utf-8 -*-

import rospy
from sensor_msgs.msg import CompressedImage
from std_msgs.msg import Float64

from cv_bridge import CvBridge
import cv2
import numpy as np

class Lane_sub:
    def __init__(self) -> None:
        rospy.init_node("lane_sub_node")
        rospy.Subscriber("/image_jpeg/compressed",CompressedImage,self.cam_callback)
        self.pub_steer =rospy.Publisher("/commands/servo/position",Float64,queue_size=1)  #조향 토픽 (0 : 왼쪽) (1 : 오른쪽) -> degree (-19.5,19.5)
        self.pub_velocity =rospy.Publisher("/commands/motor/speed",Float64,queue_size=1)  #속도 토픽 2000인가 3000이 max 값

        self.image_msg = CompressedImage()
        self.bridge = CvBridge()
        self.steer_msg = Float64()
        self.speed_msg = Float64()
        self.cross_flag = 0

    def cam_callback(self,msg):
        img = self.bridge.compressed_imgmsg_to_cv2(msg)
        img_hsv = cv2.cvtColor(img,cv2.COLOR_BGR2HSV)
        # h, s, v = cv2.split(img_hsv)
        y, x,_ =img.shape
        # cv2.imshow("h",h)
        # cv2.imshow("s",s)
        # cv2.imshow("v",v)
        yellow_lower = np.array([15,128,0])
        yellow_upper = np.array([40,255,255])
        yellow_range = cv2.inRange(img_hsv,yellow_lower,yellow_upper)
        white_lower = np.array([0,0,192])
        white_upper = np.array([179,64,255])
        white_range = cv2.inRange(img_hsv,white_lower,white_upper)
        combined_range = cv2.bitwise_or(yellow_range,white_range)
        mask_img = cv2.bitwise_and(img,img,mask=combined_range)
        src_point1 = [0,420]
        src_point2 = [275,260]
        src_point3 = [x - 275,260]
        src_point4 = [x,420]
        src_points = np.float32([src_point1,src_point2,src_point3,src_point4])
        dst_point1 =[x//8,480]
        dst_point2 =[x//8,0]
        dst_point3 =[x//8*7,0]
        dst_point4 =[x//8*7,480]
        dst_points = np.float32([dst_point1,dst_point2,dst_point3,dst_point4])
        matrix = cv2.getPerspectiveTransform(src_points,dst_points)
        warped_img = cv2.warpPerspective(mask_img,matrix,[x,y])
        grayed_img = cv2.cvtColor(warped_img,cv2.COLOR_BGR2GRAY)
        bin_img = np.zeros_like(grayed_img)
        bin_img[grayed_img>50] =1
        histogram = np.sum(bin_img,axis=0) #열이 다 더해짐
        left_hist = histogram[0:x//2]
        right_hist = histogram[x//2:]
        left_indices = np.where(left_hist>20)[0]
        right_indices = np.where(right_hist>20)[0] +320
        indices = np.where(histogram>20)[0]
        try:
            if len(left_indices) !=0 and len(right_indices) !=0:
                center_index = (indices[0]+indices[-1])//2
                print("both line")
            elif len(left_indices) != 0 and len(right_indices) == 0:
                center_index = (left_indices[0] +left_indices[-1])//2
                print("left line")
            elif len(left_indices) == 0 and len(right_indices) != 0:
                center_index = (right_indices[0] +right_indices[-1])//2
                print("right line")
        except:
            center_index =x//2
            print("no line")
       
        canny_img  = cv2.Canny(bin_img,2,2)
        cv2.imshow("canny img",canny_img)
        lines = cv2.HoughLinesP(canny_img,0.01,np.pi/180,90,50,5)    
        try:
            for line in lines:
                x1, y1, x2, y2 =line[0]
                cv2.line(warped_img,(x1,y1),(x2,y2),(0,255,0),5)
                self.cross_flag += 1
                print(self.cross_flag)
        except:
            pass
        print(center_index)
        standard_line = x//2
        degree_per_pixel = 1/x  # 
        steer = (center_index - standard_line) * degree_per_pixel
        steer =0.5 +steer
        self.steer_msg.data =steer
        self.speed_msg.data = 1000
        self.pub_velocity.publish(self.speed_msg)
        self.pub_steer.publish(self.steer_msg)
        print(steer)
        cv2.imshow("bin img",bin_img)
        cv2.imshow("warped img",warped_img)
        # cv2.imshow("mask",mask_img)
        # cv2.imshow("combine",combined_range)
        # cv2.imshow("white",white_range)
        # cv2.imshow("yellow",yellow_range)
        cv2.waitKey(1)
       
def main():
    try:
        subs =Lane_sub()
        while not rospy.is_shutdown():
            rospy.spin()
    except:
        pass

if __name__ == "__main__":
    main()