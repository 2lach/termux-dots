#!/data/data/com.termux/files/usr/bin/bash

# folder with mkv files
cd "$1"

# find filesand save them in a file
find . -type f | grep mkv$ >mkv-files.txt

readarray -t files <mkv-files.txt

for file in "${files[@]}"; do
	# replace mime ending
	out=${file%.mkv}.mp4
	# convert mkv to mp4
	ffmpeg -i "$file" -c:v copy -c:a copy "$out"
	# give the system a break
	echo "------------"
	echo "running probe on  $out"
	echo "------------"
	# verify if convertion was success/fail
	ffprobe "$out"
	# log out fileinfo
	echo "------------"
	echo "created $out"
	echo "removing file $file"
	echo "------------"

	sleep 5

	# remove original mkv file
	rm -rf "$file"
done
# remove file list
rm mkv-files.txt

# in you terminal
# $ bash convert-files.sh /folder/with/mkv-files
