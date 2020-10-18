httpconfig_check
echo -e "\n\n"
echo -e "HTTP 服务器安装状态:" $httpconfigstatus
echo -e "\n\n"
echo -e "1 安装 HTTP 服务器\n"
sleep 0.016
echo -e "2 启动 HTTP 服务器\n"
sleep 0.016
echo -e "3 卸载 HTTP 服务器\n"
sleep 0.016
echo -e "0 退出\n"
sleep 0.016
echo -en "\t\tEnter an option: "
read httpserverchoose
case $httpserverchoose in
	1)
		pkg in nodejs-lts -y
		npm install -g http-server
		green "安装结束!" ;;
	2)
		if [ ! -f "/data/data/com.termux/files/usr/lib/node_modules/http-server/bin/http-server" ]; then
			red "请先安装 HTTP 服务器"
			source $PREFIX/etc/tconfig/main/tools/httpconfig.sh
		fi
		http-server
		return 0
		;;
	3)
		if [ ! -f "/data/data/com.termux/files/usr/lib/node_modules/http-server/bin/http-server" ]; then
			red "请先安装 HTTP 服务器"
			source $PREFIX/etc/tconfig/main/tools/httpconfig.sh
		fi
	green "开始卸载..."
		npm uninstall http-server -g
		green "卸载完成!"
		source $ToolPATH/main/tools/menu.sh;;
	0)
		source $ToolPATH/main/tools/menu.sh ;;
	*)
		red "无效输入,请重试"
		source $PREFIX/etc/tconfig/main/tools/httpconfig.sh ;;
esac