root@CVM9491:~# sh shadowsocks-all.sh


################启停#####################

Shadowsocks-Python 版：分别是start启动，stop停止 ，restart重启，status 状态
root@CVM9491:~# /etc/init.d/shadowsocks-python start | stop | restart | status
​
ShadowsocksR 版：
root@CVM9491:~# /etc/init.d/shadowsocks-r start | stop | restart | status
​
Shadowsocks-Go 版：
root@CVM9491:~# /etc/init.d/shadowsocks-go start | stop | restart | status
​
Shadowsocks-libev 版：
root@CVM9491:~# /etc/init.d/shadowsocks-libev start | stop | restart | status



################修改配置信息#####################

Shadowsocks-Python 版：
root@CVM9491:~# vim /etc/shadowsocks-python/config.json
​
ShadowsocksR 版：
root@CVM9491:~# vim /etc/shadowsocks-r/config.json
​
Shadowsocks-Go 版：
root@CVM9491:~# vim /etc/shadowsocks-go/config.json
​
Shadowsocks-libev 版：
root@CVM9491:~# vim /etc/shadowsocks-libev/config.json
