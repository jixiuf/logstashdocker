FROM centos:latest

User root

Run yum -y install java
Run rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

Add logstash2.3.repo  /etc/yum.repos.d/ 
Run yum -y install logstash