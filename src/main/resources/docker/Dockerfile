FROM ubuntu:14.04
#指定镜像创建者信息
MAINTAINER test xxxx@xxx.com
#创建日期
ENV REFRESHED_AT 2017-2-15
#切换镜像目录，进入/usr目录
WORKDIR /usr
#在/usr/下创建jdk目录,用来存放jdk文件
RUN mkdir jdk
#在/usr/下创建tomcat目录，用来存放tomcat
RUN mkdir tomcat
#切换镜像的目录至/usr/jdk
WORKDIR /usr/jdk/
#将docker的jdk安装目录下的文件拷至镜像的/usr/
ADD lib/jvm/jdk1.8.0_ 144/usr/jdk
#切换镜像的目录至/usr/tomcat
WORKDIR /usr/tomcat
#将docekr的tomcat安装目录下的文件拷至镜像的/usr/tomcat目录下
ADD lib/tomcat/apache-tomcat-7.0.79 /usr/tomcat
#设置环境变量
ENV JAVA_HOME=/usr/jdk
ENV JAVA_BIN=/usr/jdk/bin
ENV PATH=$PATH:$JAVA_HOME/bin
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#切换工作目录到ROOT下
WORKDIR /usr/tomcat/webapps/ROOT
#删除tomcat默认的项目文
#将自己的xxx.war系统添加到docker镜像中tomcat下的ROOT目录下
ADD stu.war /usr/tomcat/webapps/stu.war
#公布tomcat的9999端口
EXPOSE 9999
#启动tomcat
ENTRYPOINT ["../../bin/catalina.sh","run"]


