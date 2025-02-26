# find parent_path according to $0
parent_path=$(dirname "$0")

echo "Running 3DGS on Replica"

# OSError: [Errno 24] Too many open files
ulimit -n 10240

# conda activate wisp

command="sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/Replica/Colmap/office0 /home/chrisliu/Projects/rimv2_ws/output/Replica/office0 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/Replica/Colmap/office1 /home/chrisliu/Projects/rimv2_ws/output/Replica/office1 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/Replica/Colmap/office2 /home/chrisliu/Projects/rimv2_ws/output/Replica/office2 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/Replica/Colmap/office3 /home/chrisliu/Projects/rimv2_ws/output/Replica/office3 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/Replica/Colmap/office4 /home/chrisliu/Projects/rimv2_ws/output/Replica/office4 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/Replica/Colmap/room0 /home/chrisliu/Projects/rimv2_ws/output/Replica/room0 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/Replica/Colmap/room1 /home/chrisliu/Projects/rimv2_ws/output/Replica/room1 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/Replica/Colmap/room2 /home/chrisliu/Projects/rimv2_ws/output/Replica/room2 false"
echo "\e[1;32m$command\e[0m"
$command
