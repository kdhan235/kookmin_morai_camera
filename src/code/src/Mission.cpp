#include <ros/ros.h>
#include "std_msgs/Float64.h"
#include "local_pkg/PosPos.h"
#include "local_pkg/VescStateStamped.h"
#include "local_pkg/VescState.h"
#include "Lidar_pkg/pointCloud.h"
#include "Lidar_pkg/pointinfo.h"
#include "dh_pkg/cam_msg.h"
#include "morai_msgs/GetTrafficLightStatus.h"
#include <iostream>
#include <cstdio>
#include <algorithm>
#include <fstream>
#include <string>
#include <memory>
#include <vector>
#include <cmath>

using namespace std;
ifstream path("/home/autonav/km_ws/src/code/map/final_map3.txt");
ros::Subscriber gnss_sub_;
ros::Subscriber lidar_sub_;
ros::Subscriber cam_sub_;
ros::Subscriber traffic_sub_;
ros::Publisher speed_pub_;
ros::Publisher steer_pub_;
std_msgs::Float64 speed_msg_;
std_msgs::Float64 steer_msg_;
local_pkg::PosPos pos_msg_;
morai_msgs::GetTrafficLightStatus traf_msg_;

vector<vector<double>> Map_Data(6677,vector<double>(2,0));
vector<double> My_Current_Point(2,0);
vector<double> My_Current_WayPoint(2,0);

//라이다 콜백 전역 변수
int size;
vector<vector<double>> Lidar_XYd, Lidar_Ymm,Lidar_ENU; 
//--------------

//카메라 콜백 전역 변수
int Misson =0;
bool Is_Stop_Flag = false;
bool Is_Dynamic_Obs = false;
bool Is_Dynamic_Obs_Flag = false;
int Is_Dynamic_Obs_Count = 0;
float Mission_TIme = 0.0;
//---------------

int slam_cnt =0;
bool slam_flag =false;

bool lottari_stop_flag = false;
bool lottari_stop_cnt = 0; 
bool traffic_stop_flag = false;

double borderline = 0.1;  
int local_min_idx = 0;

vector<double> local_Way_point(2,0);  //Way_point
int lidar_cnt = 0;
double My_Current_Heading = 0;
int Min_Idx = 0;
double Delta;
float LD = 1.2;

void Flag_control()
{
    if(My_Current_Point[0] > 8.9 && My_Current_Point[0] < 10.9 && My_Current_Point[1] > 12.2 && My_Current_Point[1] < 18.2)
    {
        slam_flag =true;
    }

    if(Min_Idx >= 3790 && Min_Idx <= 3795)  //교차로
    {
        lottari_stop_flag = true;
    }
}
double dist(int i, vector<vector<double>> &Map_data, vector<double> &My_enu)
{
    return sqrt(pow(Map_data[i][0]-My_enu[0],2)+pow(Map_data[i][1]-My_enu[1],2));
}

void LIDARCallback(const Lidar_pkg::pointCloud::ConstPtr &msg)
{
    Lidar_XYd.clear();
    Lidar_Ymm.clear();
    size = msg -> size;
    if(Min_Idx > 1100 && Min_Idx < 2700)
    {
        if(size)  
        {
            lidar_cnt = lidar_cnt + 1;
            Lidar_XYd.resize(size,vector<double>(3,0));
            Lidar_Ymm.resize(size,vector<double>(2,0));
            Lidar_ENU.resize(size,vector<double>(2,0));
            for(int i = 0 ; i < size; i++)
            {
                Lidar_XYd[i][0] = msg ->points[i].x;
                Lidar_XYd[i][1] = msg ->points[i].y;
                Lidar_XYd[i][2] = msg ->points[i].dist;
                Lidar_Ymm[i][0] = msg ->points[i].y_Max;
                Lidar_Ymm[i][1] = msg ->points[i].y_Min;
                Lidar_ENU[i][0] = My_Current_Point[0] + cos((90-My_Current_Heading)*M_PI/180) * Lidar_XYd[i][0] - sin((90-My_Current_Heading)*M_PI/180)*Lidar_XYd[i][1]; 
                Lidar_ENU[i][1] = My_Current_Point[1] + sin((90-My_Current_Heading)*M_PI/180) * Lidar_XYd[i][0] + cos((90-My_Current_Heading)*M_PI/180)*Lidar_XYd[i][1];
            }

        }
        else if(size == 0)
        {
            lidar_cnt = 0;
        }

        // if (size && slam_cnt > 19 && lidar_cnt == 1)
        if (lidar_cnt == 1)
        {
            for(int i = 0 ; i < size; i++)
            {
                float min_dist_lidar = int(1e9);
                
                for (int k = 0; k < Map_Data.size(); k++)
                {
                    if (min_dist_lidar > sqrt(pow(Lidar_ENU[i][0] - Map_Data[k][0], 2) + pow(Lidar_ENU[i][1] - Map_Data[k][1], 2)))  
                    {
                        min_dist_lidar = sqrt(pow(Lidar_ENU[i][0] - Map_Data[k][0], 2) + pow(Lidar_ENU[i][1] - Map_Data[k][1], 2)); // 라이다에서 감지된 장애물과 가장 가까운 거리
                    }
                }
                if(borderline > min_dist_lidar)
                {
                    cout<<"mid_dist: "<<min_dist_lidar<<endl;
                    for(int k =0 ; k < 200;k++)
                    {
                        Map_Data[Min_Idx-10+k][0] = Map_Data[Min_Idx-10+k][0]-0.3;  
                    }
                }
            
            }
        }
    }
}

void CAMCallback(const dh_pkg::cam_msg::ConstPtr &msg)
{
    Misson = msg->mission;
    Is_Stop_Flag = msg->is_stop_flag;
    Is_Dynamic_Obs = msg->is_dynamic_obs;
    Mission_TIme = msg->mission_time;
    // cout<<"Flag: "<<Is_Dynamic_Obs_Flag<<endl;

    if(Is_Dynamic_Obs == true)
    {
        Is_Dynamic_Obs_Flag = true;
        
    }
    // cout<<"미션: "<<Misson<<" 정지선 여부:"<<Is_Stop_Flag<<" 동적 여부:"<<Is_Dynamic_Obs<<" 미션 시간:"<<Mission_TIme<<endl;
}
    
void GNSSCallback(const local_pkg::PosPos::ConstPtr &msg)
{   
    My_Current_Point[0] = msg->PosX;
    My_Current_Point[1] = msg->PosY;
    My_Current_Heading = msg->heading;
    My_Current_Heading = -My_Current_Heading ;

}

void TrafficCallback(const morai_msgs::GetTrafficLightStatus::ConstPtr &msg)
{
    string traffic_index = msg -> trafficLightIndex;
    int traffic_status = msg -> trafficLightStatus;
    if(traffic_index == "SN000005" && Min_Idx > 4370 && Min_Idx < 4400)
    {
        if(traffic_status == 33)
        {
            traffic_stop_flag =false;
        }
        else 
        {
            traffic_stop_flag =true;
        }
    }
}

void Find_Delta()
{
    float Min_Dist = int(1e9);
    for (int i = Min_Idx; i < Min_Idx + 100; i++ )
    {
        if (Min_Dist > sqrt(pow(Map_Data[i][0] - My_Current_Point[0], 2) + pow(Map_Data[i][1] - My_Current_Point[1], 2)))
        {
            Min_Dist = sqrt(pow(Map_Data[i][0] - My_Current_Point[0], 2) + pow(Map_Data[i][1] - My_Current_Point[1], 2));
            Min_Idx = i;
            
        }
    }
    for (int i = Min_Idx; i < Map_Data.size(); i++)
    {
        if (LD < sqrt(pow(Map_Data[i][0] - My_Current_Point[0], 2) + pow(Map_Data[i][1] - My_Current_Point[1], 2)))
        {
            My_Current_WayPoint[0] = Map_Data[i][0];
            My_Current_WayPoint[1] = Map_Data[i][1];
            break;
        }
    }

    double alpha = atan2(My_Current_WayPoint[0] - My_Current_Point[0], My_Current_WayPoint[1] - My_Current_Point[1]);
    alpha = alpha - My_Current_Heading / 180.0 * M_PI;
    Delta = atan2(2 * sin(alpha) * 0.38, LD);
    Delta = Delta * 90 /(19.5 * M_PI);
    // cout<<"min idx: "<<Min_Idx<<endl;
}



void action()
{
    Find_Delta();
    Flag_control();
    if(slam_flag)
    {
        speed_msg_.data =0;
        speed_pub_.publish(speed_msg_);

        if(slam_cnt ==0)
        {
           int result = std::system("/home/autonav/km_ws/src/code/src/kill_node.sh");
        }
        slam_cnt++;
        if(slam_cnt > 20)
        {
            slam_flag = false;
        }
    }
    if(slam_cnt > 19)
    {
        if (lottari_stop_flag)  //로타리
        {  
            lottari_stop_cnt = lottari_stop_cnt + 1;
            speed_msg_.data = 0;
            if(size ==0)
            {
                lottari_stop_flag =false;
            }
        }
        else if(traffic_stop_flag == true)
        {
            speed_msg_.data =0;
            cout<<"1"<<endl;
        }
        else if(Is_Dynamic_Obs_Flag == true)
        {
            Is_Dynamic_Obs_Count += 1;
            speed_msg_.data = 0;
            cout<<"2"<<endl;
            if(Is_Dynamic_Obs_Count >20)
            {
                Is_Dynamic_Obs_Flag = false;
                Is_Dynamic_Obs_Count = 0;
            }
        }
        else
        {
            // cout<<"usual control"<<endl;
            speed_msg_.data = 1600;
            steer_msg_.data = Delta+0.5;
            cout<<"3"<<endl;
            if(Min_Idx >= 3793 && Min_Idx <= 4200)
            {
                speed_msg_.data = 400;
            }
        }
        speed_pub_.publish(speed_msg_);
        steer_pub_.publish(steer_msg_);
    }
    // if (size > 0 && slam_cnt > 19)
    // {
    //     cout << "min_dist : "<<min_dist_lidar<<endl;

    //     if(borderline > min_dist_lidar)
    //     {
    //         Find_Delta();
    //         speed_msg_.data = 1600;
    //         steer_msg_.data = Delta+0.5;
    //         speed_pub_.publish(speed_msg_);
    //         steer_pub_.publish(steer_msg_);
    //     }
    // }
}


void Load_Map()
{
    for (int i = 0; i < 6677; i++)
    {
        for (int j = 0; j < 2; j++)
        {
            path >> Map_Data[i][j];
        }
    }
}



int main(int argc, char** argv)
{
    Load_Map();
    ros::init(argc, argv, "Control_Node");
    ros::NodeHandle nh;
    gnss_sub_ = nh.subscribe<local_pkg::PosPos>("/PosCal", 10, GNSSCallback);
    lidar_sub_ = nh.subscribe<Lidar_pkg::pointCloud>("/custom_cluster_info", 10, LIDARCallback);
    cam_sub_ = nh.subscribe<dh_pkg::cam_msg>("/Cam_dectection", 10, CAMCallback);
    traffic_sub_ = nh.subscribe<morai_msgs::GetTrafficLightStatus>("/GetTrafficLightStatus", 10, TrafficCallback);
    speed_pub_ = nh.advertise<std_msgs::Float64>("/commands/motor/speed", 10);  
    steer_pub_ = nh.advertise<std_msgs::Float64>("/commands/servo/position", 10); 
    ros::Rate rate1(50);  
    while (ros::ok())
    {
        ros::spinOnce();
        action();
        rate1.sleep();
    }
    return 0;
}
  