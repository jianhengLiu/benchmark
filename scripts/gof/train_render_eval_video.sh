source=$1
model=$2
eval=$3

if [ "$eval" = true ]; then
    echo "Evaluation on"
    # https://github.com/jianhengLiu/gaussian-splatting -b eval_origin
    command="python /home/jianhengliu/gaussian-opacity-fields/train.py -m $model -s $source --data_device cpu --eval"
    echo "\e[1;32m$command\e[0m"
    $command
    
    command="python /home/jianhengliu/gaussian-opacity-fields/render.py -m $model -s $source --eval"
    echo "\e[1;32m$command\e[0m"
    $command
else
    # https://github.com/jianhengLiu/gaussian-splatting -b eval_origin
    command="python /home/jianhengliu/gaussian-opacity-fields/train.py -m $model -s $source --data_device cpu"
    echo "\e[1;32m$command\e[0m"
    $command
    
    command="python /home/jianhengliu/gaussian-opacity-fields/render.py -m $model -s $source"
    echo "\e[1;32m$command\e[0m"
    $command
fi

command="python /home/jianhengliu/gaussian-opacity-fields/extract_mesh.py -m $model --iteration 30000"
echo "\e[1;32m$command\e[0m"
$command

# # evaluation
# python /home/chrisliu/Projects/rimv2_ws/src/RIM2/neural_mapping/eval/image_metrics/metrics.py -m $model/train/ours_30000
# python /home/chrisliu/Projects/rimv2_ws/src/RIM2/neural_mapping/eval/image_metrics/metrics.py -m $model/test/ours_30000
# python /home/chrisliu/Projects/rimv2_ws/src/RIM2/neural_mapping/eval/image_metrics/metrics.py -m $model/eval/ours_30000

# ffmpeg -framerate 30 -i $model/train/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/train/output.mp4
# ffmpeg -framerate 2 -i $model/test/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/test/output.mp4
# ffmpeg -framerate 2 -i $model/eval/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/eval/output.mp4
