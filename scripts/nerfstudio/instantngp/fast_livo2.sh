echo "Running RIM2 on Replica"

parent_path=$(dirname "$0")
source_path=/home/jianhengliu/Datasets/FAST_LIVO2
output_path=/home/jianhengliu/output/InstatNGP/fast_livo2
# conda activate nerfstudio

# default is 30k steps

# campus
data_name=campus
sh $parent_path/train_render_eval_video.sh $source_path $data_name $output_path

# # culture01
data_name=culture01
sh $parent_path/train_render_eval_video.sh $source_path $data_name $output_path

# red_bird2
data_name=sculture
sh $parent_path/train_render_eval_video.sh $source_path $data_name $output_path

# corridor
data_name=corridor
sh $parent_path/train_render_eval_video.sh $source_path $data_name $output_path

# drive
data_name=drive
sh $parent_path/train_render_eval_video.sh $source_path $data_name $output_path

# station
data_name=station
sh $parent_path/train_render_eval_video.sh $source_path $data_name $output_path

# sysu
data_name=sysu_bin
sh $parent_path/train_render_eval_video.sh $source_path $data_name $output_path

# cbd
data_name=cbd_bin
sh $parent_path/train_render_eval_video.sh $source_path $data_name $output_path
