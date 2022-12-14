#!/bin/bash
BUILD_JAR=$(ls /home/ubuntu/action/build/libs/deploy-auto-0.0.1-SNAPSHOT.jar)
JAR_NAME=$(basename $BUILD_JAR)

echo "> 현재 시간: $(date)" >> /home/ubuntu/action/deploy.log

echo "> build 파일명: $JAR_NAME" >> /home/ubuntu/action/deploy.log

echo "> build 파일 복사" >> /home/ubuntu/action/deploy.log
DEPLOY_PATH=/home/ubuntu/action/
cp $BUILD_JAR $DEPLOY_PATH

echo "> 현재 실행중인 애플리케이션 pid 확인" >> /home/ubuntu/action/deploy.log
CURRENT_PID=$(pgrep -f java)

if [ -z $CURRENT_PID ]
then
  echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다." >> /home/ubuntu/action/deploy.log
else
  echo "> kill -15 $CURRENT_PID" >> /home/ubuntu/action/deploy.log
  sudo kill -15 $CURRENT_PID
  sleep 5
fi

DEPLOY_JAR=$DEPLOY_PATH$JAR_NAME

echo "> JAR_NAME: $DEPLOY_JAR"
echo "> $DEPLOY_JAR 에 실행권한 추가"
chmod +x $DEPLOY_JAR


echo "> DEPLOY_JAR 배포"    >> /home/ubuntu/action/deploy.log
sudo nohup java -jar \
  $DEPLOY_JAR > $DEPLOY_PATH/nohup.out 2>&1 &
