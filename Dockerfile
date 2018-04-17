FROM centos:7

ENV container=docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

#Enabled systemd
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

#Install dependencies
RUN yum install -y initscripts wget java-1.8.0-openjdk.x86_64 epel-release; yum clean all 

#Configure java
RUN cp /etc/profile /etc/profile_backup \
    &&  echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | tee -a /etc/profile \
    &&  echo 'export JRE_HOME=/usr/lib/jvm/jre' | tee -a /etc/profile \
    &&  source /etc/profile 

#Install jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo \
    && rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && yum install -y jenkins

COPY bootstrap.sh /bootstrap.sh

RUN chmod +x /bootstrap.sh

ENTRYPOINT ["/usr/sbin/init"]

CMD ["/bootstrap.sh"]






   