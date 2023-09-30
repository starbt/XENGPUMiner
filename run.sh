cnt=900
if [ -n "$1" ]; then
	cnt=$1
fi
nohup ./xengpuminer -b ${cnt} >xengpuminer.log &
