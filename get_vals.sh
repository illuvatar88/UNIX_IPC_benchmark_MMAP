#! /bin/bash
if [ "$#" -lt 4 ] 
then
    echo "Illegal number of parameters"
    echo "Format : sh get_vals.sh <num_procs> <max_msg_size> <iterations> <rma_type> <directory_path(optional)>"
else
msg_size=8
num_procs="$1"
max_msg_size="$2"
iter="$3"
if [ -n "$4" ]
then
	dir_path="$4"
else
	dir_path="/home/prabhashankar/work/"
fi
rm -f "$dir_path"/vals_raw_"$num_procs"_"$rma_type"
while [ "$msg_size" -le "$max_msg_size" ]
do
	echo "***********************************************************************" >> "$dir_path"/vals_raw_"$num_procs"_"$rma_type"
	echo "Size : $msg_size Bytes" >> "$dir_path"/vals_raw_"$num_procs"
	echo "***********************************************************************" >> "$dir_path"/vals_raw_"$num_procs"_"$rma_type"
	"$dir_path"/launch_benchmark.out "$num_procs" "$msg_size" "$iter" >> "$dir_path"/vals_raw_"$num_procs"_"$rma_type"
	msg_size=$((msg_size*2))
done
fi