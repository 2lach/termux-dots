# setup env
apt="/data/data/com.termux/files/usr/bin/apt"
pkg="/data/data/com.termux/files/usr/bin/pkg"
aptget="/data/data/com.termux/files/usr/bin/apt-get"
gem="/data/data/com.termux/files/usr/bin/gem"
date="/data/data/com.termux/files/usr/bin/date"

# run system updates
$apt update
$apt full-upgrade -y

$pkg upgrade -y
$pkg clean
$pkg autoclean

$aptget dist-upgrade -y
$aptget upgrade -y
$aptget autoclean
$aptget purge

$gem update
$gem cleanup

echo "system updated" >>/data/data/com.termux/files/home/z-stuff/system_updated.txt
$date >>/data/data/com.termux/files/home/z-stuff/system_updated.txt
