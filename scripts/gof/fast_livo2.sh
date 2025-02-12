# find parent_path according to $0
parent_path=$(dirname "$0")

echo "Running 3DGS on FAST_LIVO2"

ulimit -n 10240

sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/campus/3dgs /home/chrisliu/Projects/rimv2_ws/output/fast_livo2/campus true

# # sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets_1280/center01/3dgs /home/chrisliu/Projects/rimv2_ws/output/fast_livo2/center01 true

sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/culture01/3dgs /home/chrisliu/Projects/rimv2_ws/output/fast_livo2/culture01 true

# # sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets_1280/culture03/3dgs /media/chrisliu/T9/ProjectData/tmp/3dgs_output/culture03 true

sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/red_bird2/3dgs /home/chrisliu/Projects/rimv2_ws/output/fast_livo2/red_bird2 true

# sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/corridor/3dgs /media/chrisliu/T9/ProjectData/tmp/3dgs_output/corridor true


sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/drive/3dgs /home/chrisliu/Projects/rimv2_ws/output/fast_livo2/drive true