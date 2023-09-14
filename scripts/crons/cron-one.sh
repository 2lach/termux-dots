# setup env vars
apt="/data/data/com.termux/files/usr/bin/apt"
pkg="/data/data/com.termux/files/usr/bin/pkg"
aptget="/data/data/com.termux/files/usr/bin/apt-get"
gem="/data/data/com.termux/files/usr/bin/gem"
date="/data/data/com.termux/files/usr/bin/date"
pip="/data/data/com.termux/files/usr/bin/pip3"

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

# cause upgrading pips fucks shit up
# $pip list --outdated --format=freeze | $(which grep) --color -v '^\-e' | $(which cut) -d = -f 1 | $(which xargs) -n1 $pip install -U

$gem update
$gem cleanup

# add entry to logfile
printf "\nAutomated system update completed\n" >>/data/data/com.termux/files/usr/var/log/sys_logs/system_updated.txt
$date >>/data/data/com.termux/files/usr/var/log/sys_logs/system_updated.txt
echo "" >>/data/data/com.termux/files/usr/var/log/sys_logs/system_updated.txt
# show notification
/data/data/com.termux/files/usr/bin/termux-notification -c "SYSTEM UPDATE COMPLETED"
