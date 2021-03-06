#!/data/data/com.termux/files/usr/bin/bash
#-----------------------------------
# Author: Qingxu (RimuruW)
# Description: Termux Tools
# Repository Address: https://github.com/RimuruW/Tovow
# Copyright (c) 2020 Qingxu
#-----------------------------------

if [ ! -d "$HOME/storage/shared/Android" ]; then
	termux-setup-storage
	blue "请回车以确认您已授权 Termux 存储权限"
	Step
	if [ -d "$HOME/storage/shared/Android" ]; then
		green "存储权限获取成功！"
		Step
	else
		red "存储权限获取失败！"
		Step
	fi
else
	red "您已获取存储权限，是否继续操作？[y/n]"
	echo -en "\t\tEnter an option: "
	read STORAGE_SETUP
	case $STORAGE_SETUP in
		y)
			termux-setup-storage
			;;
		n)
			blue "已取消…"
			Step
			;;
		*)
			blue "默认跳过…"
			Step
			;;
	esac
fi
