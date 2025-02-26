source=$1
data_name=$2
output_path=$3

parent_path=$(dirname "$0")

ns-train instant-ngp --steps-per-eval-image 0 --steps-per-eval-all-images 0 --output-dir $output_path --experiment-name $data_name --timestamp 240530 colmap --data $source/$data_name

ns-render dataset --load-config=$output_path/$data_name/instant-ngp/240530/config.yml --output-path=$output_path/$data_name/instant-ngp/240530/output --split train --rendered-output-names rgb gt-rgb depth
ns-render dataset --load-config=$output_path/$data_name/instant-ngp/240530/config.yml --output-path=$output_path/$data_name/instant-ngp/240530/output --split test --rendered-output-names rgb gt-rgb depth

# # evaluation
python $parent_path/../../../evaluation/image_metrics/metrics2.py --gt_color_dir $output_path/$data_name/instant-ngp/240530/output/train/gt-rgb --renders_color_dir $output_path/$data_name/instant-ngp/240530/output/train/rgb
python $parent_path/../../../evaluation/image_metrics/metrics2.py --gt_color_dir $output_path/$data_name/instant-ngp/240530/output/test/gt-rgb --renders_color_dir $output_path/$data_name/instant-ngp/240530/output/test/rgb
python $parent_path/../../../evaluation/image_metrics/metrics2.py --gt_color_dir $output_path/$data_name/instant-ngp/240530/output/eval/gt-rgb --renders_color_dir $output_path/$data_name/instant-ngp/240530/output/eval/rgb

ffmpeg -framerate 30 -i $output_path/$data_name/instant-ngp/240530/output/train/rgb/%05d.jpg -c:v h264 -pix_fmt yuv420p $output_path/$data_name/instant-ngp/240530/output/train/output.mp4
ffmpeg -framerate 30 -i $output_path/$data_name/instant-ngp/240530/output/test/rgb/%05d.jpg -c:v h264 -pix_fmt yuv420p $output_path/$data_name/instant-ngp/240530/output/test/output.mp4
ffmpeg -framerate 30 -i $output_path/$data_name/instant-ngp/240530/output/eval/rgb/%05d.jpg -c:v h264 -pix_fmt yuv420p $output_path/$data_name/instant-ngp/240530/output/eval/output.mp4
