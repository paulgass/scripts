FROM centos:7
RUN yum -y install git
RUN git clone https://github.com/paulgass/scripts.git
CMD ["bash", "./scripts/default.sh"]