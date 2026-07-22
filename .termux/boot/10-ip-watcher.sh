#!/data/data/com.termux/files/usr/bin/bash
# 10-ip-watcher.sh
# Startas automatiskt av Termux:Boot vid telefonstart.
# Placeras i ~/.termux/boot/10-ip-watcher.sh på telefonen.
DEBUG_LOG="$HOME/projects/ip-watcher/debug.log"
# Rotera debug.log: behåll bara senaste 200 rader mellan omstarter
if [[ -f "$DEBUG_LOG" ]]; then
	tail -n 200 "$DEBUG_LOG" >"$DEBUG_LOG.tmp" && mv "$DEBUG_LOG.tmp" "$DEBUG_LOG"
fi
termux-wake-lock
nohup bash "$HOME/projects/ip-watcher/ip-watch.sh" >>"$DEBUG_LOG" 2>&1 &
disown
