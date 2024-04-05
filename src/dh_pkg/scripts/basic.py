import rospy
import cv2
import numpy as np
import os, rospkg
# from morai_msgs.msg import Ctrlcmd
from std_msgs.msg import Float64
from sensor_msgs.msg import CompressedImage
from cv_bridge import CvBridgeError


class IMGParser:
    def __init__(self):
        rospy.init_node('image_parser', anonymous=True)
        # self.pub = rospy.Publisher("/ctrl_cmd_0", )
        self.image_sub = rospy.Subscriber("/image_jpeg/compressed", CompressedImage, self.callback)
      
        self.steer = 0 #value : 0-1 -> degree : -29.5-29.5
        #value*2 => 0-2, (value*2)-1 => -1~1, ({value*2}-1)*29.5
        #self.steer /29.5 => -1~1, (self.steer/29.5)+1 => 0~2, ((self.steer/29.5)+1)/2 => 0~1 
        self.rate = rospy.Rate(10)    
        
    def callback(self, msg):
        try:
            np_arr = np.fromstring(msg.data, np.uint8)
            img_bgr = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
            
        except CvBridgeError as e:
            print(e)
            
        
        cv2.namedWindow('img', cv2.WINDOW_NORMAL)  
        cv2.imshow("img",img_bgr)

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
