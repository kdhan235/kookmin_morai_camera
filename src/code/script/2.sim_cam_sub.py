#!/usr/bin/env python3
#-*- coding:utf-8 -*-

import rospy
from sensor_msgs.msg import CompressedImage
from cv_bridge import CvBridge
import cv2

class sub:
    def __init__(self) -> None:
        rospy.init_node("cam_node")
        rospy.Subscriber("/image_jpeg/compressed",CompressedImage,self.cam_callback)
        self.image_msg = CompressedImage()
        self.bridge = CvBridge()

    def cam_callback(self,msg):
        self.img_msg = msg
        cv_img = self.bridge.compressed_imgmsg_to_cv2(self.img_msg)
        cv2.imshow("cv_img",cv_img)
        cv2.waitKey(1)
def main():
    try:
        subs =sub()
        while not rospy.is_shutdown():
            rospy.spin()
    except:
        pass

if __name__ == "__main__":
    main()