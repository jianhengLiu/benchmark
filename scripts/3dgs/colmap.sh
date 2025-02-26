cd /home/chrisliu/Projects/gaussian-splatting_origin
python convert.py -s /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/campus/3dgs_colmap
python convert.py -s /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/culture01/3dgs_colmap
python convert.py -s /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/drive/3dgs_colmap
python convert.py -s /home/chrisliu/Projects/rimv2_ws/src/RIM2/data/FAST_LIVO2_RIM_Datasets/red_bird2/3dgs_colmap

sh /home/chrisliu/Projects/rimv2_ws/src/RIM2/scripts/baseline/3dgs/fast_livo2.sh