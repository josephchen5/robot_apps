
# Apps Project



### Step 0. 


source ~/catkin_ws_qt/devel/setup.bash

### Step 1. open 

```bash
roslaunch turtlebot_bringup minimal.launch 
roslaunch turtlebot_teleop keyboard_teleop.launch
```

### Step 2. open laser
```bash
roslaunch robot_navigation sick_tim_5xx.launch node_name:="sick_tim_5xx" robot_frame_id:="base_footprint" laser_frame_id:="laser" scan_topic:="scan"
roslaunch robot_navigation sick_tim_5xx.launch node_name:="sick_tim_5xx_ekf" robot_frame_id:="base_footprint_ekf" laser_frame_id:="laser_ekf" scan_topic:="scan_ekf"
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
roslaunch robot_navigation zr300_nodelet_rgbd.launch
roslaunch robot_navigation zr300_nodelet_rgbd_rtabmap.launch camera_tf_option:="false"
```

### Step 6. open 

```bash
roslaunch robot_navigation gmapping_demo.launch
roslaunch robot_navigation view_navigation.launch --screen
export YOUR_MAP_FOLDER=~/catkin_ws_qt/src/robot_apps/robot_navigation/maps
rosrun map_server map_saver -f $YOUR_MAP_FOLDER/my_map
ls $YOUR_MAP_FOLDER
```

```bash
export YOUR_MAP_FOLDER=~/catkin_ws_qt/src/robot_apps/robot_navigation/maps
roslaunch robot_navigation amcl_demo.launch map_file:=$YOUR_MAP_FOLDER/my_map.yaml
roslaunch robot_navigation amcl_demo.launch
roslaunch robot_navigation rtabmap_demo3.launch localization:="false" choose_visualization:="rtabmapviz"
roslaunch robot_navigation rtabmap_demo3.launch localization:="true" choose_visualization:="rviz"
roslaunch robot_navigation rtabmap_demo_turtlebot.launch localization:="false" choose_visualization:="rtabmapviz"
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
