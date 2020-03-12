#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "THIS SCRIPT MUST BE RUN AS 'root' USER"
   exit 1
fi

cd

echo "Python Application Name:"
read appnameuserinput
application=${appnameuserinput,,}
directory="${application}-api"
virtualenvironment="${application}-virtualenv"
project="${application}project"
app="${application}app"
dockerimage="${application}docker"
pyTypeDjangoVirtualenv=false
pyTypeDjangoMongodb=false
pyTypeDjangoPipenv=false
pyTypeFlaskPipenv=false

echo "Select Python Application Type:"

select djangoapp in VIRTUALENV MONGODB PIPENV FLASK
do
case $djangoapp in
"VIRTUALENV")
pyTypeDjangoVirtualenv=true
break
;;
"MONGODB")
pyTypeDjangoVirtualenv=true
pyTypeDjangoMongodb=true
break
;;
"PIPENV")
pyTypeDjangoPipenv=true
break
;;
"FLASK")
pyTypeDjangoPipenv=true
pyTypeFlaskPipenv=true
break
;;
*)
echo "Invalid Entry."
;;
esac
done

cd

if [ $pyTypeDjangoVirtualenv == true ] || [ $pyTypeDjangoMongodb == true ] ; then
	echo "goodbyeworld"
fi

cd

mongo_venvlibs="""snappy
python-snappy
requests-kerberos
pywinrm
pymongo[snappy,gssapi,srv,tls,zstd]"""

cd

mongo_urls_path="""path('api/v1/mongoDB/<path:mDB_cluster_ConnectionStringOnly>/<str:mDB_cluster_database>/<str:mDB_cluster_database_collection>/<str:mDB_cluster_database_collection_item_id>/<str:mDB_cluster_database_collection_item_name>', views.MongoDB.as_view(), name='mongodbdjango')"""

cd

mongo_views_import="""import pymongo"""

cd

read -r -d "" mongo_views_function << EOF94
class MongoDB(GenericAPIView):
	serializer_class = TestSerializer
	def post(self, request, mDB_cluster_ConnectionStringOnly, mDB_cluster_database, mDB_cluster_database_collection, mDB_cluster_database_collection_item_id, mDB_cluster_database_collection_item_name, format=None):
		cluster = pymongo.MongoClient(mDB_cluster_ConnectionStringOnly)
		db = cluster[mDB_cluster_database]
		collection = db[mDB_cluster_database_collection]
		post1 = {"_id":mDB_cluster_database_collection_item_id,"name":mDB_cluster_database_collection_item_name}
		collection.insert_one(post1)
		return HttpResponse("mongoDB Cloud @ https://cloud.mongodb.com/", status=200)
EOF94

cd

if [ $pyTypeDjangoPipenv == true ] || [ $pyTypeFlaskPipenv == true ] ; then
	mongo_venvlibs=""
	mongo_urls_path=""
	mongo_views_import=""
	mongo_views_function=""
fi

cd
mkdir $directory
cd
cd $directory/

if [ $pyTypeDjangoPipenv == true ] ; then
	cd
	cd $directory/
	echo "helloworld"
fi

cd
cd $directory/

cat > requirements.txt << EOF1
coreapi
coreschema
Django
djangorestframework
drf-yasg
packaging
pytz
Markdown
Pygments
django-filter
django-guardian
whitenoise
gunicorn
django-cors-headers
django-createsuperuser
django-jenkins
pyunpack
djangorestframework_simplejwt
$mongo_venvlibs
EOF1

cd
cd $directory/

cd
cd $directory/

linux_distro_version_id=$(lsb_release -sr)
linux_distro_version_name=$(lsb_release -si)
linux_distro_version_docker="FROM ${linux_distro_version_name,,}:${linux_distro_version_id}"

cd
cd $directory/

cat > Dockerfile_Virtualenv << EOF18
$linux_distro_version_docker
RUN mkdir /$dockerimage
WORKDIR /$dockerimage
ADD . /$dockerimage
RUN apt-get clean && apt-get update -m -y && apt-get install -y \
	python-pip \
	python3-pip \
	libkrb5-dev \
	libsnappy-dev \
	libssl-dev \
	libffi-dev \
&& rm -rf /var/lib/apt/lists/*
RUN alias pip=pip3
RUN pip3 install -r requirements.txt
EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
EOF18

cd
cd $directory/

cat > Dockerfile_Pipenv << EOF19
FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /${dockerimage}
WORKDIR /${dockerimage}
ADD . /${dockerimage}/
RUN pip3 install --upgrade pip
RUN pip3 install pipenv
ONBUILD COPY Pipfile Pipfile
ONBUILD COPY Pipfile.lock Pipfile.lock
RUN pipenv install --deploy --ignore-pipfile
RUN pipenv update
EXPOSE 8000
CMD ["pipenv", "run", "python3", "manage.py", "runserver", "0.0.0.0:8000"]
EOF19

cd
cd $directory/

if [ $djangotype_virtualenvdocker == true ] || [ $djangotype_pipenvdocker == true ] ; then
	timedatectl set-local-rtc 1
fi

cd
cd $directory/

if [ $djangotype_virtualenvdocker == true ] ; then
	echo "wowhello"
fi

cd
cd $directory/

cat > Pipfile << EOF23
[[source]]
name = "pypi"
url = "https://pypi.org/simple/"
verify_ssl = true

[dev-packages]
ipykernel = "*"

[packages]
Flask = "==1.1.1"
gunicorn = "==20.0.4"

[requires]
python_version = "3.6"
EOF23

cd
cd $directory/

if [ $djangotype_pipenvdocker == true ] ; then
	cd
	cd $directory/
	sed -i 's/.*python_version.*/python_version = "3"/g' Pipfile
fi

cd
cd $directory/

exec bash
