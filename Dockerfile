FROM centos:latest

User root

Run yum -y install java
Run rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

#https://www.elastic.co/guide/en/logstash/current/installing-logstash.html#package-repositories
Add logstash2.3.repo  /etc/yum.repos.d/ 
Run yum -y install logstash
#https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-repositories.html
Add elasticsearch.repo /etc/yum.repos.d/ 
Run yum install elasticsearch