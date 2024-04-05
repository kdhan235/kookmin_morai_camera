#!/usr/bin/env python3
#-*- coding:utf-8 -*-

import rospy
from sensor_msgs.msg import LaserScan
from math import *
import os

class sub:
    def __init__(self) -> None:
        rospy.init_node("lidar_node")
        rospy.Subscriber("/lidar2D",LaserScan,self.lidar_callback)
        self.scan_msg = LaserScan()
        self.i = 0

    def lidar_callback(self,msg):
        os.system("clear")
        self.scan_msg = msg
        degree_min = self.scan_msg.angle_min * 180/pi
        degree_max = self.scan_msg.angle_max * 180/pi
        degree_angle_increment = self.scan_msg.angle_increment * 180/pi
        degrees = [degree_min + degree_angle_increment * index for index, value in enumerate(self.scan_msg.ranges)]
        # print(degrees)
        
        for index,value in enumerate(self.scan_msg.ranges):
            if (90 < degrees[index] < 180 or -180<degrees[index] < -90) and 0 < value < 1:
                self.i = self.i+1
                print("전방 1미터 이내에 장애물이 있다!",self.i)
        # print(f"최소 각도 : {degree_min}")
        # print(f"최대 각도 : {degree_max}")
        # print(f"인크리 각도 : {degree_angle_increment}")
        # print(len(self.scan_msg.ranges))
        
def main():
    try:
        subs =sub()
        while not rospy.is_shutdown():
            rospy.spin()
    except:
        pass

if __name__ == "__main__":
    main()