source=$1
model=$2
eval=$3

if [ "$eval" = true ]; then
    echo "Evaluation on"
    # https://github.com/jianhengLiu/gaussian-splatting -b eval_origin
    python /home/jianhengliu/gaussian-splatting/train.py -m $model -s $source --data_device cpu --eval
    python /home/jianhengliu/gaussian-splatting/render.py -m $model -s $source --eval
else
    # https://github.com/jianhengLiu/gaussian-splatting -b eval_origin
    python /home/jianhengliu/gaussian-splatting/train.py -m $model -s $source --data_device cpu
    python /home/jianhengliu/gaussian-splatting/render.py -m $model -s $source
fi

# evaluation
python $parent_path/../../evaluation/image_metrics/metrics2.py --gt_color_dir $model/train/ours_30000/gt --renders_color_dir $model/train/ours_30000/renders
python $parent_path/../../evaluation/image_metrics/metrics2.py --gt_color_dir $model/test/ours_30000/gt --renders_color_dir $model/test/ours_30000/renders
python $parent_path/../../evaluation/image_metrics/metrics2.py --gt_color_dir $model/eval/ours_30000/gt --renders_color_dir $model/eval/ours_30000/renders

ffmpeg -framerate 30 -i $model/train/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/train/output.mp4
ffmpeg -framerate 2 -i $model/test/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/test/output.mp4
ffmpeg -framerate 2 -i $model/eval/ours_30000/renders/%05d.png -c:v h264 -pix_fmt yuv420p $model/eval/output.mp4