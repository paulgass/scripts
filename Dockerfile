FROM centos:7
RUN yum -y install git
RUN git clone https://github.com/paulgass/scripts.git
RUN cd scripts/
CMD ["bash", "./default.sh"]