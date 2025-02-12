# find parent_path according to $0
parent_path=$(dirname "$0")

echo "Running 3DGS on FAST_LIVO2"

ulimit -n 10240

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/campus /home/jianhengliu/output/2dgs/fast_livo2/campus true 50

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/culture /home/jianhengliu/output/2dgs/fast_livo2/culture true 110

# # sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets_1280/culture03/3dgs /media/chrisliu/T9/ProjectData/tmp/3dgs_output/culture03 true

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/sculpture /home/jianhengliu/output/2dgs/fast_livo2/sculpture true 100

# sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/corridor/3dgs /media/chrisliu/T9/ProjectData/tmp/3dgs_output/corridor true

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/drive /home/jianhengliu/output/2dgs/fast_livo2/drive true 180

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/station_txt /home/jianhengliu/output/2dgs/fast_livo2/station true 60