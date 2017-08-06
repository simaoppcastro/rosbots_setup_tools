#export ROSBOTS_HOME=/home/pi
#export ROSBOTS_WS_PATH=/home/pi/ros_catkin_ws
. ${ROSBOTS_WS_PATH}/build/opt/ros/kinetic/setup.sh
. ${ROSBOTS_HOME}/rosbots_catkin_ws/devel/setup.sh

export PYTHONPATH="${ROSBOTS_HOME}/lib/python:${PYTHONPATH}"

echo "Starting rosbots_shutdown script" >> ${ROSBOTS_HOME}/roscore.log


echo "Killing roslaunch" >> ${ROSBOTS_HOME}/roscore.log
killall roslaunch

#killall nodes
for i in $( rosnode list ); do
    echo "Killing node ${i}" >> ${ROSBOTS_HOME}/roscore.log
    rosnode kill $i;
done

#stop roscore
echo "Killing roscore" >> ${ROSBOTS_HOME}/roscore.log
killall roscore
killall rosmaster
echo "Done with shutdown script" >> ${ROSBOTS_HOME}/roscore.log
