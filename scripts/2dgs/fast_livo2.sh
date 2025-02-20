# find parent_path according to $0
parent_path=$(dirname "$0")

echo "Running 3DGS on FAST_LIVO2"

ulimit -n 10240

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/campus /home/jianhengliu/output/2dgs/fast_livo2/campus true 50

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/culture /home/jianhengliu/output/2dgs/fast_livo2/culture true 110

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/sculpture /home/jianhengliu/output/2dgs/fast_livo2/sculpture true 100

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/drive /home/jianhengliu/output/2dgs/fast_livo2/drive true 180

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/station_txt /home/jianhengliu/output/2dgs/fast_livo2/station true 60