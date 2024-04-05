#!/usr/bin/env python3
#-*- coding:utf-8 -*-

import rospy
from morai_msgs.msg import GetTrafficLightStatus
from std_msgs.msg import Float64


class Traffic_control:
    def __init__(self) -> None:
        rospy.init_node("traffic_control_node")
        rospy.Subscriber("/GetTrafficLightStatus",GetTrafficLightStatus,self.traffic_callback)
        self.pub_steer =rospy.Publisher("/commands/servo/position",Float64,queue_size=1)  #조향 토픽 (0 : 왼쪽) (1 : 오른쪽) -> degree (-19.5,19.5)
        self.pub_velocity =rospy.Publisher("/commands/motor/speed",Float64,queue_size=1)  #속도 토픽 2000인가 3000이 max 값
        self.traffic_msg = GetTrafficLightStatus()    
        self.steer_msg = Float64()
        self.speed_msg = Float64()
        self.traffic_flag = 0
        self.prev_signal = 0

    def traffic_callback(self,msg):
        self.traffic_msg =msg
        if self.traffic_msg.trafficLightIndex == "SN000002":
            signal = self.traffic_msg.trafficLightStatus

            if self.prev_signal != signal:
                self.prev_signal = signal
                self.traffic_flag = 0
            self.steer_msg.data =0.5
            self.traffic_flag += 1
            if signal == 1:
                self.speed_msg.data = 0.0
                print(f"red: {self.traffic_flag}")
            elif signal ==4:
                self.speed_msg.data =1000
                print(f"yellow: {self.traffic_flag}")
            elif signal ==16:
                self.speed_msg.data =3000
                print(f"green : : {self.traffic_flag}")
            elif signal ==33:
                self.speed_msg.data =1000
                self.steer_msg.data = 0.4
                print(f"left : : {self.traffic_flag}")
            else:           
                print(f"{signal} : {self.traffic_flag}") 
                self.speed_msg.data = 1000
                self.steer_msg.data = 0.5

            self.pub_velocity.publish(self.speed_msg)
            self.pub_steer.publish(self.steer_msg)  
        #1 = red 4 =yellow 33 =left 5 = green
        else:
            pass
    
def main():
    try:
        subs =Traffic_control()
        while not rospy.is_shutdown():
            rospy.spin()
    except:
        pass

if __name__ == "__main__":
    main()