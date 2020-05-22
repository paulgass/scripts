FROM centos:7
RUN useradd pablo
RUN usermod -aG wheel pablo
USER pablo
RUN yum -y install git
RUN git clone https://github.com/paulgass/scripts.git
CMD ["bash", "./scripts/default.sh"]