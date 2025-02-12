source=$1
model=$2
eval=$3

if [ "$eval" = true ]; then
    echo "Evaluation on"
    # https://github.com/jianhengLiu/gaussian-splatting -b eval_origin
    command="python /home/jianhengliu/GS-Pull/gaussian_splatting/train.py -m $model -s $source --data_device cpu --eval --iterations 7000"
    echo "\e[1;32m$command\e[0m"
    $command

    command="python /home/jianhengliu/GS-Pull/train.py -s $source -c $model --output $model"
    echo "\e[1;32m$command\e[0m"
    $command

    command="python /home/jianhengliu/GS-Pull/gaussian_splatting/render.py -m $model -s $source --eval"
    echo "\e[1;32m$command\e[0m"
    $command
    
    command="python /home/jianhengliu/GS-Pull/extract_mesh.py -s $source -g $model -o $model"
    echo "\e[1;32m$command\e[0m"
    $command
else
    command="python /home/jianhengliu/GS-Pull/gaussian_splatting/train.py -m $model -s $source --data_device cpu --iterations 7000"
    echo "\e[1;32m$command\e[0m"
    $command

    command="python /home/jianhengliu/GS-Pull/train.py -s $source -c $model --output $model"
    echo "\e[1;32m$command\e[0m"
    $command

    command="python /home/jianhengliu/GS-Pull/gaussian_splatting/render.py -m $model -s $source"
    echo "\e[1;32m$command\e[0m"
    $command
    
    command="python /home/jianhengliu/GS-Pull/extract_mesh.py -s $source -g $model -o $model"
    echo "\e[1;32m$command\e[0m"
    $command
fi

# # evaluation
# python /home/chrisliu/Projects/rimv2_ws/src/RIM2/neural_mapping/eval/image_metrics/metrics.py -m $model/train/ours_30000
# python /home/chrisliu/Projects/rimv2_ws/src/RIM2/neural_mapping/eval/image_metrics/metrics.py -m $model/test/ours_30000
# python /home/chrisliu/Projects/rimv2_ws/src/RIM2/neural_mapping/eval/image_metrics/metrics.py -m $model/eval/ours_30000

# ffmpeg -framerate 30 -i $model/train/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/train/output.mp4
# ffmpeg -framerate 2 -i $model/test/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/test/output.mp4
# ffmpeg -framerate 2 -i $model/eval/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/eval/output.mp4
