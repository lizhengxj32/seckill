#!/usr/bin/env bash
#编译+部署order站点
#需要配置如下参数
# 项目路径, 在Execute Shell中配置项目路径, pwd 就可以获得该项目路径
# export PROJ_PATH=这个jenkins任务在部署机器上的路径
# 输入你的环境上tomcat的全路径
# export TOMCAT_APP_PATH=tomcat在部署机器上的路径
### base 函数

cd $PROJ_PATH/Seckill
mvn clean install
# 停tomcat
killTomcat
# 删除原有工程
rm -f $TOMCAT_APP_PATH/webapps/Seckill.war
# 复制新的工程
cp $PROJ_PATH/Seckill/target/Seckill.war $TOMCAT_APP_PATH/webapps/

