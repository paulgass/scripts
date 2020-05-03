AmazonLinux2

python --version
2.X.X

pip --version
pip X.X.X from python 2.X


sudo yum update
sudo yum update
sudo yum install python36 -y

sudo echo "alias python=python3" >> /etc/bashrc
sudo echo "alias pip='python3 -m pip'" >> /etc/bashrc




sudo yum install docker -y

docker --version

sudo usermod -a -G docker ec2-user
newgrp docker
sudo service docker restart

docker images
docker ps
