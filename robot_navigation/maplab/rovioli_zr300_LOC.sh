#!/usr/bin/env bash
LOCALIZATION_MAP_INPUT=$1
LOCALIZATION_MAP_OUTPUT=$2
NCAMERA_CALIBRATION="$ROVIO_CONFIG_DIR/ncamera.yaml"
IMU_PARAMETERS_MAPLAB="$ROVIO_CONFIG_DIR/imu-zr300-maplab.yaml"
IMU_PARAMETERS_ROVIO="$ROVIO_CONFIG_DIR/imu-zr300-rovio.yaml"
REST=$@

rosrun rovioli rovioli \
  --alsologtostderr=1 \
  --v=2 \
  --ncamera_calibration=$NCAMERA_CALIBRATION  \
  --imu_parameters_maplab=$IMU_PARAMETERS_MAPLAB \
  --imu_parameters_rovio=$IMU_PARAMETERS_ROVIO \
  --publish_debug_markers  \
  --datasource_type="rostopic" \
  --optimize_map_to_localization_map=false \
  --map_builder_save_image_as_resources=false \
  --rovio_enable_frame_visualization=true \
  --detection_visualize_keypoints=true \
  --feature_tracker_visualize_feature_tracks=true \
  --feature_tracker_visualize_keypoint_matches=true \
  --feature_tracker_visualize_keypoints=true \
  --feature_tracker_visualize_keypoints_individual_frames=true \
  --vio_localization_map_folder=$LOCALIZATION_MAP_INPUT \
  --save_map_folder=$LOCALIZATION_MAP_OUTPUT $REST
  
