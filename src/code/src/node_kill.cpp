// #include "ros/ros.h"
// #include <iostream>
// #include "code/min_idx.h"
// #include <cstdlib>
// #include <cstdio>  // 추가한 부분

// ros::Subscriber min_sub_;
// int min_idx = 0;
// int cnt =0;
// void Callback(const code::min_idx::ConstPtr &msg)
// {
//     min_idx = msg->min_idx;
//     if (min_idx >600 && min_idx < 620 && cnt == 0)
//     {
//         int result = std::system("/home/autonav/km_ws/src/code/src/kill_node.sh");
//         cnt++;
//     }
// }

// int main(int argc, char **argv)
// {
//     ros::init(argc, argv, "Kill_Node");
//     ros::NodeHandle nh;
//     min_sub_ = nh.subscribe<code::min_idx>("/nodek", 10, Callback);
//     ros::spin();
//     return 0;
// }
