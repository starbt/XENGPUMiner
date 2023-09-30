#!/bin/bash
now=$(date '+%Y-%m-%d %H:%M:%S') # 定义log的时间格式
grepFlag='xengpuminer'           # 你要监测的程序名
thisLog='./watchlog'             # 该脚本的log日志文件

baseDir="."
sleepTime=60s # 监测间隔

# 检查是否有我们的拉起脚本run.sh
if [ ! -f "$baseDir/run.sh" ]; then
	echo "$baseDir/run.sh missing, check again" >>"$thisLog"
	exit
fi
# 无限循环（0<1）
while [ 0 -lt 1 ]; do
	now=$(date '+%Y-%m-%d %H:%M:%S')
	ret=$(ps aux | grep "$grepFlag" | grep -v grep | wc -l)
	if [ $ret -eq 0 ]; then # 如果ps找不到运行的目标进程就拉起
		echo "$now process not exists ,restart process now... " >>"$thisLog"
		./run.sh
		echo "$now restart done ..... " >>"$thisLog"
	else
		echo "$now process exists , sleep $sleepTime seconds " >>"$thisLog"
	fi
	sleep $sleepTime
done
