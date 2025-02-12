# find parent_path according to $0
parent_path=$(dirname "$0")

echo "Running 3DGS on Replica"

# OSError: [Errno 24] Too many open files
ulimit -n 10240

# conda activate gspull

command="sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/Replica/office0 /home/jianhengliu/output/gspull/Replica/office0 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/Replica/office1 /home/jianhengliu/output/gspull/Replica/office1 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/Replica/office2 /home/jianhengliu/output/gspull/Replica/office2 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/Replica/office3 /home/jianhengliu/output/gspull/Replica/office3 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/Replica/office4 /home/jianhengliu/output/gspull/Replica/office4 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/Replica/room0 /home/jianhengliu/output/gspull/Replica/room0 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/Replica/room1 /home/jianhengliu/output/gspull/Replica/room1 false"
echo "\e[1;32m$command\e[0m"
$command

command="sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/Replica/room2 /home/jianhengliu/output/gspull/Replica/room2 false"
echo "\e[1;32m$command\e[0m"
$command
