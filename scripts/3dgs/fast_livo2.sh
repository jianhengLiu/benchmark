# find parent_path according to $0
parent_path=$(dirname "$0")

echo "Running 3DGS on FAST_LIVO2"

ulimit -n 10240

sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/campus/3dgs_colmap /media/chrisliu/T9/ProjectData/tmp/3dgs_colmap_output/campus true

# sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets_1280/center01/3dgs /media/chrisliu/T9/ProjectData/tmp/3dgs_colmap_output/center01 true

sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/culture01/3dgs_colmap /media/chrisliu/T9/ProjectData/tmp/3dgs_colmap_output/culture01 true

# sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets_1280/culture03/3dgs /media/chrisliu/T9/ProjectData/tmp/3dgs_output/culture03 true

sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/red_bird2/3dgs_colmap /media/chrisliu/T9/ProjectData/tmp/3dgs_colmap_output/red_bird2 true

sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/corridor/3dgs /media/chrisliu/T9/ProjectData/tmp/3dgs_output/corridor true

sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/drive/f2nerf_3dgs/colmap /media/chrisliu/T9/ProjectData/tmp/3dgs_colmap_output/drive true

sh $parent_path/train_render_eval_video.sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/drive/f2nerf_3dgs/colmap /media/chrisliu/T9/ProjectData/tmp/3dgs_colmap_output/drive true

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/station_txt /home/jianhengliu/output/3dgs/fast_livo2/station true

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/sysu /home/jianhengliu/output/3dgs/fast_livo2/sysu true

sh $parent_path/train_render_eval_video.sh /home/jianhengliu/Datasets/FAST_LIVO2/cbd /home/jianhengliu/output/3dgs/fast_livo2/cbd true