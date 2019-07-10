#!/usr/bin/env bash
LOCALIZATION_MAP_OUTPUT=$1
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
  --datasource_type="rostopic" \
  --save_map_folder="$LOCALIZATION_MAP_OUTPUT" \
  --map_builder_save_image_as_resources=false \
  --optimize_map_to_localization_map=false $REST
