#!/bin/bash
mail=email.txt
echo -e "\033[32m \033[1m"
count=`ps -ef |grep $1 |grep -v email |grep -v "grep" |wc -l`
M_IPADDR=ifconfig eth0|grep "inet "|awk -F " " '{print $2}'
DATE='date'
if [ $count -eq 0 ];then
cat >$mail <<EOF
***********************************Server Monitor*******************************
通知类型：故障
服务：$1
主机：$M_IPADDR
状态：警告
时间：$DATE
额外信息：
CRITICAL - $1 Server Connection Refused,Plese Check.
********************************************************************************
EOF
                dos2unix $mail
                echo -e "\033[32mThe Monitor $i Waring,Please check. \033[0m"
                mail -s "$M_IPADDR $1 waring" 774829647@qq.com < $mail >>/dev/null 2>$1
else
	echo "The $i server 200 ok !"
fi
