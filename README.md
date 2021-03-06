
# Apps Project



### Step 0.1 


source ~/catkin_ws_qt/devel/setup.bash

### Step 0.2 turtlebot

```bash
sudo apt-get install ros-kinetic-turtlebot-bringup
sudo apt-get install ros-kinetic-turtlebot-teleop 
sudo apt-get install ros-kinetic-turtlebot-navigation
sudo apt-get install ros-kinetic-turtlebot-rviz-launchers
```


### Step 1. open 

```bash
roslaunch turtlebot_bringup minimal.launch 
roslaunch turtlebot_teleop keyboard_teleop.launch
roslaunch robot_navigation ps4.launch
```

### Step 2. open laser
```bash
roslaunch robot_navigation sick_tim_5xx.launch node_name:="sick_tim_5xx" robot_frame_id:="base_footprint" laser_frame_id:="laser" scan_topic:="scan"
roslaunch robot_navigation sick_tim_5xx.launch node_name:="sick_tim_5xx_ekf" robot_frame_id:="base_footprint_ekf" laser_frame_id:="laser_ekf" scan_topic:="scan_ekf"
roslaunch robot_navigation urg_lidar_kobuki.launch
roslaunch robot_navigation urg_lidar.launch
```
### Step 3. open imu
```bash
roslaunch robot_navigation px4_bringup.launch 
roslaunch robot_navigation razor_imu_9dof_bringup.launch 
```
### Step 4. open EKF

```bash
roslaunch robot_navigation ekf_demo.launch 

```

### Step 5. open camera

```bash
roslaunch robot_navigation rs_camera_d435_rtabmap.launch camera_tf_option:="front"
roslaunch robot_navigation rs_camera_d435_rtabmap.launch camera_tf_option:="above"
roslaunch robot_navigation rs_camera_d435_rtabmap_TX2.launch camera_tf_option:="front"

roslaunch robot_navigation zr300_nodelet_rgbd.launch
roslaunch robot_navigation zr300_nodelet_rgbd_rtabmap.launch camera_tf_option:="false"
```

### Step 6. build 2D map

```bash
roslaunch robot_navigation gmapping_demo.launch

export YOUR_MAP_FOLDER=~/catkin_ws/src/robot_apps/robot_navigation/maps
rosrun map_server map_saver -f $YOUR_MAP_FOLDER/my_map
rosrun map_server map_saver map:=map -f my_map
rosrun map_server map_saver map:=map -f room_301_map
rosrun map_server map_saver map:=map -f lab_map
rosrun map_server map_saver map:=map -f ntuhs_map
rosrun map_server map_saver map:=map -f tiros_map
rosrun map_server map_saver map:=/rtabmap/grid_map -f room_301_rtabmap

rosrun map_server map_server room_301_rtabmap.yaml
ls $YOUR_MAP_FOLDER
roslaunch robot_navigation amcl_demo.launch map_file:=$YOUR_MAP_FOLDER/my_map.yaml
roslaunch robot_navigation amcl_demo.launch
```



### Step 6. open 2D navigation 

```bash
roslaunch robot_navigation move_base_demo.launch
roslaunch robot_navigation multi_goals.launch
rostopic echo /clicked_point
roslaunch turtlebot_rviz_launchers view_navigation.launch

roslaunch robot_navigation view_navigation.launch --screen

rosrun rviz rviz -d `rospack find robot_navigation`/rviz/robot_navigation_app0504.rviz

```
### Step   rtabmap D435 only

```bash
sudo apt-get install ros-kinetic-rtabmap-ros
roslaunch robot_navigation d435_rtabmap.launch
roslaunch robot_navigation rtabmap_d435_only.launch localization:="false"
roslaunch robot_navigation rtabmap_d435_only.launch localization:="true"

```
### Step 7. open rtabmap 

```bash
roslaunch robot_navigation rtabmap_bringup_rgbd_odom_scan.launch localization:=false rtabmapviz:=true rviz:=false
roslaunch robot_navigation rtabmap_bringup_rgbd_odom_scan.launch localization:=false rtabmapviz:=false rviz:=true
roslaunch robot_navigation rtabmap_bringup_rgbd_odom_scan.launch localization:=true rtabmapviz:=true rviz:=false
roslaunch robot_navigation rtabmap_bringup_rgbd_odom_scan.launch localization:=true rtabmapviz:=false rviz:=true
roslaunch robot_navigation rtabmap_bringup_rgbd_odom_scan.launch use_sim_time:=true localization:=false rtabmapviz:=true rviz:=false
roslaunch robot_navigation rtabmap_bringup_rgbd_odom_scan.launch use_sim_time:=false publish_tf:=true  localization:=false rtabmapviz:=true rviz:=false
roslaunch robot_navigation rtabmap_bringup_rgbd_odom_scan.launch use_sim_time:=false publish_tf:=false localization:=true rtabmapviz:=true rviz:=false
roslaunch robot_navigation rtabmap_bringup_rgbd_odom_scan.launch use_sim_time:=false publish_tf:=true  localization:=true rtabmapviz:=true rviz:=false
roslaunch robot_navigation rtabmap_bringup_rgbd_odom_scan.launch use_sim_time:=true publish_tf:=true  localization:=false rtabmapviz:=true rviz:=false


roslaunch robot_navigation rtabmap_demo3.launch localization:="false" choose_visualization:="rtabmapviz"
roslaunch robot_navigation rtabmap_demo3.launch localization:="true" choose_visualization:="rviz"
roslaunch robot_navigation rtabmap_demo_turtlebot.launch localization:="false" choose_visualization:="rtabmapviz"
roslaunch robot_navigation rtabmap_demo_turtlebot.launch localization:="true" choose_visualization:="rviz"

roslaunch zed_nodelet_example zed_nodelet_laserscan.launch
roslaunch robot_navigation rtabmap_demo3_zed.launch localization:="false" choose_visualization:="rtabmapviz"
roslaunch robot_navigation rtabmap_demo3_zed.launch localization:="true" choose_visualization:="rviz" database_path:=$HOME/Documents/RTAB-Map/room_301_rtabmap.db
roslaunch robot_navigation rtabmap_demo3_zed.launch localization:="true" choose_visualization:="rtabmapviz" database_path:=$HOME/Documents/RTAB-Map/room_301_rtabmap.db
roslaunch robot_navigation rtabmap_demo3_zed.launch localization:="true" database_path:=$HOME/Documents/RTAB-Map/room_301_rtabmap.db
roslaunch robot_navigation rtabmap_demo3_zed.launch localization:="true" database_path:=$HOME/Documents/RTAB-Map/NTUH_0508.db
roslaunch robot_navigation rtabmap_display.launch rtabmapviz:=true rviz:=false
roslaunch robot_navigation rtabmap_display.launch rtabmapviz:=false rviz:=true

rtabmap-databaseViewer

```


### Step 7. ros bag 

```bash

export YOUR_DATASET_FOLDER=/media/joseph/SSD500GB/jackal_d435_2dscan_bag_2019-09-11-05-02-32.bag
export YOUR_DATASET_FOLDER=/media/joseph/SSD500GB/jackal_d435_2dscan_bag_2019-09-11-05-11-51.bag
export YOUR_DATASET_FOLDER=/media/joseph/SSD500GB/jackal_d435_2dscan_bag_2019-09-12-00-02-26.bag
export YOUR_DATASET_FOLDER=/media/joseph/SSD500GB/jackal_d435_2dscan_bag_2019-09-12-00-20-34.bag
roslaunch robot_navigation jackal_rtabmap_bag_demo.launch bag_filename:=$YOUR_DATASET_FOLDER

rosbag play --clock rtabmap_bag_2019-09-03-00-54-06.bag
roslaunch robot_navigation rtabmap_bag_record.launch
roslaunch robot_navigation jackal_tf_play.launch

```


### Step 6. bag 

相機向上建天花板地圖

    export YOUR_DATASET_FOLDER=~/bag_data 
    rosbag play $YOUR_DATASET_FOLDER/above_2019-03-29-10-52-44.bag

above

    roslaunch robot_navigation tf_zr300.launch camera_option:="true"


    roslaunch robot_navigation rtabmap_demo3.launch localization:="false"

相機向上定位

    export YOUR_DATASET_FOLDER=~/bag_data 
    rosbag play $YOUR_DATASET_FOLDER/above_2019-03-29-10-57-00.bag



    roslaunch robot_navigation rtabmap_demo3.launch localization:="true"


相機向前建地圖

    export YOUR_DATASET_FOLDER=~/bag_data 
    rosbag play $YOUR_DATASET_FOLDER/front_2019-03-29-10-59-53.bag


    roslaunch robot_navigation tf_zr300.launch camera_option:="false"


    roslaunch robot_navigation rtabmap_demo3.launch localization:="false"

相機向前定位

    export YOUR_DATASET_FOLDER=~/bag_data 
    rosbag play $YOUR_DATASET_FOLDER/front_2019-03-29-11-02-36.bag


    roslaunch robot_navigation tf_zr300.launch camera_option:="false"


    roslaunch robot_navigation rtabmap_demo3.launch localization:="true"

```
