#!/usr/bin/env python3
#-*- coding:utf-8 -*-

import rospy
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Float64
from math import *
import os

class sub:
    def __init__(self) -> None:
        rospy.init_node("Lidar_estop")
        self.pub = rospy.Publisher("/commands/motor/speed",Float64,queue_size=1)
        rospy.Subscriber("/lidar2D",LaserScan,self.lidar_callback)
        self.scan_msg = LaserScan()
        self.speed_msg = Float64()

    def lidar_callback(self,msg):
        os.system("clear")
        self.scan_msg = msg
        degree_min = self.scan_msg.angle_min * 180/pi
        degree_max = self.scan_msg.angle_max * 180/pi
        degree_angle_increment = self.scan_msg.angle_increment * 180/pi
        degrees = [degree_min + degree_angle_increment * index for index, value in enumerate(self.scan_msg.ranges)]
        # print(degrees)
        obstacle_degrees = []  # 전방 왼쪽부터 0 -> 180 오른쪽 -0 -> -180
        for index,value in enumerate(self.scan_msg.ranges):
            if (90 < degrees[index] < 180 or -180<degrees[index] < -90) and 0 < value < 1.5:

                print("전방 1미터 이내에 장애물이 있다!")
                obstacle_degrees.append(degrees[index])
                
                
            else:
                pass
        print(f"장애물 각도 : {obstacle_degrees} , 각도 개수:{len(obstacle_degrees)}")
        if len(obstacle_degrees)  != 0:
            self.speed_msg.data = 0
        else:
            self.speed_msg.data = 1200

        
        self.pub.publish(self.speed_msg)
def main():
    try:
        subs =sub()
        while not rospy.is_shutdown():
            rospy.spin()
    except:
        pass

if __name__ == "__main__":
    main()