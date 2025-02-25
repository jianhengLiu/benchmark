source=$1
model=$2
eval=$3
depth_trunc=$4
voxel_size=$5

parent_path=$(dirname "$0")
# conda init
# conda activate gof

if [ "$eval" = true ]; then
    # echo "Evaluation on"
    # https://github.com/jianhengLiu/gaussian-splatting -b eval_origin
    command="python /home/jianhengliu/PGSR/train.py -m $model -s $source --data_device cpu --eval --max_abs_split_points 0 --opacity_cull_threshold 0.05"
    echo "\e[1;32m$command\e[0m"
    $command
    
    command="python /home/jianhengliu/PGSR/render.py -m $model -s $source --eval --max_depth $depth_trunc --voxel_size $voxel_size"
    echo "\e[1;32m$command\e[0m"
    $command
else
    # https://github.com/jianhengLiu/gaussian-splatting -b eval_origin
    command="python /home/jianhengliu/PGSR/train.py -m $model -s $source --data_device cpu --max_abs_split_points 0 --opacity_cull_threshold 0.05"
    echo "\e[1;32m$command\e[0m"
    $command
    
    command="python /home/jianhengliu/PGSR/render.py -m $model -s $source --max_depth $depth_trunc --voxel_size $voxel_size"
    echo "\e[1;32m$command\e[0m"
    $command
fi

# evaluation
python $parent_path/../../evaluation/image_metrics/metrics2.py --gt_color_dir $model/train/ours_30000/gt --renders_color_dir $model/train/ours_30000/renders
python $parent_path/../../evaluation/image_metrics/metrics2.py --gt_color_dir $model/test/ours_30000/gt --renders_color_dir $model/test/ours_30000/renders
python $parent_path/../../evaluation/image_metrics/metrics2.py --gt_color_dir $model/eval/ours_30000/gt --renders_color_dir $model/eval/ours_30000/renders

ffmpeg -framerate 30 -i $model/train/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/train/output.mp4
ffmpeg -framerate 2 -i $model/test/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/test/output.mp4
ffmpeg -framerate 2 -i $model/eval/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/eval/output.mp4
