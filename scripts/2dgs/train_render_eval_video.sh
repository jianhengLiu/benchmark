source=$1
model=$2
eval=$3
depth_trunc=$4

parent_path=$(dirname "$0")

conda init
conda activate surfel_splatting

if [ "$eval" = true ]; then
    command="python /home/jianhengliu/2d-gaussian-splatting/train.py -m $model -s $source --data_device cpu --eval"
    echo "\e[1;32m$command\e[0m"
    $command
    
    command="python /home/jianhengliu/2d-gaussian-splatting/render.py -m $model -s $source --eval --depth_trunc $depth_trunc"
    echo "\e[1;32m$command\e[0m"
    $command
else
    command="python /home/jianhengliu/2d-gaussian-splatting/train.py -m $model -s $source --data_device cpu"
    echo "\e[1;32m$command\e[0m"
    $command

    command="python /home/jianhengliu/2d-gaussian-splatting/render.py -m $model -s $source --depth_trunc $depth_trunc"
    echo "\e[1;32m$command\e[0m"
    $command
fi

# # evaluation
python $parent_path/../../evaluation/image_metrics/metrics.py -m $model/train/ours_30000
python $parent_path/../../evaluation/image_metrics/metrics.py -m $model/test/ours_30000
python $parent_path/../../evaluation/image_metrics/metrics.py -m $model/eval/ours_30000

ffmpeg -framerate 30 -i $model/train/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/train/output.mp4
ffmpeg -framerate 2 -i $model/test/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/test/output.mp4
ffmpeg -framerate 2 -i $model/eval/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/eval/output.mp4
