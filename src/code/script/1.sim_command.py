#!/usr/bin/env python3
#-*- coding:utf-8 -*-

import rospy
from std_msgs.msg import Float64

class sub:
    def __init__(self) -> None:
        rospy.init_node("justnode")
        self.pub_velocity =rospy.Publisher("/commands/motor/speed",Float64,queue_size=1)  #속도 토픽 2000인가 3000이 max 값
        self.pub_steer =rospy.Publisher("/commands/servo/position",Float64,queue_size=1)  #조향 토픽 (0 : 왼쪽) (1 : 오른쪽) -> degree (-19.5,19.5)
        self.cmd_msg_velocity = Float64()
        self.cmd_msg_steer = Float64()
        self.rate = rospy.Rate(10)
        self.speed = 0
        self.steer = 0.5   #

    def func(self):
        self.speed = 3000 
        self.steer = 0.25
        # if self.steer < 0.4:
        #     self.steer = 0.6
        self.cmd_msg_velocity.data = self.speed
        self.cmd_msg_steer.data = self.steer
        self.pub_velocity.publish(self.cmd_msg_velocity)
        self.pub_steer.publish(self.cmd_msg_steer)
        print(f"speed: {self.cmd_msg_velocity.data}")
        self.rate.sleep()

def main():
    try:
        subs =sub()
        while not rospy.is_shutdown():
            subs.func()
    except:
        pass

if __name__ == "__main__":
    main()