#!/usr/bin/env bash
#M-gM-<M-^VM-hM-/M-^Q+M-iM-^CM-(M-gM-=M-2orderM-gM-+M-^YM-gM-^BM-9
#M-iM-^\M-^@M-hM-&M-^AM-iM-^EM-^MM-gM-=M-.M-eM-&M-^BM-dM-8M-^KM-eM-^OM-^BM-fM-^UM-0
# M-iM-!M-9M-gM-^[M-.M-hM-7M-/M-eM->M-^D, M-eM-^\M-(Execute ShellM-dM-8M--M-iM-^EM-^MM-gM-=M-.M-iM-!M-9M-gM-^[M-.M-hM-7M-/M-eM->M-^D, pwd M-eM-0M-1M-eM-^OM-/M-dM-;M-%M-hM-^NM-7M-eM->M-^WM-hM-/M-%M-iM-!M-9M-gM-^[M-.M-hM-7M-/M-eM->M-^D
# export PROJ_PATH=M-hM-?M-^YM-dM-8M-*jenkinsM-dM-;M-;M-eM-^JM-!M-eM-^\M-(M-iM-^CM-(M-gM-=M-2M-fM-^\M-:M-eM-^YM-(M-dM-8M-^JM-gM-^ZM-^DM-hM-7M-/M-eM->M-^D
# M-hM->M-^SM-eM-^EM-%M-dM-=M- M-gM-^ZM-^DM-gM-^NM-/M-eM-"M-^CM-dM-8M-^JtomcatM-gM-^ZM-^DM-eM-^EM-(M-hM-7M-/M-eM->M-^D
# export TOMCAT_APP_PATH=tomcatM-eM-^\M-(M-iM-^CM-(M-gM-=M-2M-fM-^\M-:M-eM-^YM-(M-dM-8M-^JM-gM-^ZM-^DM-hM-7M-/M-eM->M-^D
### base M-eM-^GM-=M-fM-^UM-0
killTomcat()
{
    pid=`ps -ef|grep tomcat|grep java`
    echo "tomcat Id list :$pid"
    if [ "$pid" = "" ]
    then
      echo "no tomcat pid alive"
   else
      kill -9 $pid
    fi
}
cd $PROJ_PATH/Seckill
mvn clean install
 
# M-eM-^AM-^\tomcat
#killTomcat
 
# M-eM-^HM- M-iM-^YM-$M-eM-^NM-^_M-fM-^\M-^IM-eM-7M-%M-gM-(M-^K
rm -rf $TOMCAT_APP_PATH/webapps/ROOT
rm -f $TOMCAT_APP_PATH/webapps/ROOT.war
rm -f $TOMCAT_APP_PATH/webapps/Seckill.war
 
# M-eM-$M-^MM-eM-^HM-6M-fM-^VM-0M-gM-^ZM-^DM-eM-7M-%M-gM-(M-^K
cp $PROJ_PATH/Seckill/target/Seckill.war $TOMCAT_APP_PATH/webapps/
 
cd $TOMCAT_APP_PATH/webapps/
mv Seckill.war ROOT.war
 
# M-eM-^PM-/M-eM-^JM-(Tomcat
cd $TOMCAT_APP_PATH/
sh bin/startup.sh &