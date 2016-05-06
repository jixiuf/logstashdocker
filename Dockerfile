FROM centos:latest

#User root

Run yum -y install java

# 本想用 yum 下载 logstash es 的， 耐何 国内这网速 。决定用axel 多线程下载，多少有点提速
# 先装下载工具
# http://pkgs.repoforge.org/axel/
Run rpm -ihv http://dl.fedoraproject.org/pub/epel/7/x86_64/a/axel-2.4-9.el7.x86_64.rpm
# 到这个页面看logstash 最新版
# https://www.elastic.co/guide/en/logstash/current/installing-logstash.html
# 起20个线程下载
# logstash.rpm 依赖logrotate
Run axel -n 20 -a https://download.elastic.co/logstash/logstash/packages/centos/logstash-2.3.2-1.noarch.rpm
Run yum install -y logrotate
Run rpm -ihv logstash-2.3.2-1.noarch.rpm
Run rm logstash-2.3.2-1.noarch.rpm

#https://www.elastic.co/products/elasticsearch
Run axel -n 20 -a https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.3.2/elasticsearch-2.3.2.rpm
Run rpm -ihv elasticsearch-2.3.2.rpm
Run rm elasticsearch-2.3.2.rpm

#https://www.elastic.co/downloads/kibana
Run axel -a -n 20  https://download.elastic.co/kibana/kibana/kibana-4.5.0-1.x86_64.rpm
Run rpm -ihv kibana-4.5.0-1.x86_64.rpm
Run rm kibana-4.5.0-1.x86_64.rpm

# Run rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

# #https://www.elastic.co/guide/en/logstash/current/installing-logstash.html#package-repositories
# Add logstash2.3.repo  /etc/yum.repos.d/ 
# Run yum -y install logstash
# # logstash cmd is in /opt/logstash/bin on centos

ENV PATH $PATH:/opt/logstash/bin:/usr/share/elasticsearch/bin/:/opt/kibana/bin/
# logstash 脚本里用到which 来寻找java 命令
Run yum -y install which 

# #https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-repositories.html
# Add elasticsearch.repo /etc/yum.repos.d/ 
# Run yum install elasticsearch

# do clean up after install

Run yum clean all