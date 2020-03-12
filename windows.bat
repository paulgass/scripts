SET /P application=Python Application Name:
:: Install Python
:: ... idkhowtoinstallpythonviacommandlineonwindows
:: Install cURL
:: ... cURL is PreInstalled on Windows 10 v 1803; For Older Windows Versions Installing GIT will effectively Install cURL
:: Install PIP
:: curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
:: python get-pip.py

SET directory=%CD%

:: add supporting files


cd %directory%
mkdir %application%-api
cd %directory%

echo coreapi > "%directory%\%application%-api\requirements.txt"
echo coreschema >> "%directory%\%application%-api\requirements.txt"
echo Django >> "%directory%\%application%-api\requirements.txt"
echo djangorestframework >> "%directory%\%application%-api\requirements.txt"
echo drf-yasg >> "%directory%\%application%-api\requirements.txt"
echo packaging >> "%directory%\%application%-api\requirements.txt"
echo pytz >> "%directory%\%application%-api\requirements.txt"
echo SECRET_KEY = "xxxxxyyyyyhelloworldyyyyzzzzzzzzzzzzz" >> "%directory%\%application%-api\requirements.txt"
echo Pygments >> "%directory%\%application%-api\requirements.txt"
echo django-filter >> "%directory%\%application%-api\requirements.txt"
echo django-guardian >> "%directory%\%application%-api\requirements.txt"
echo whitenoise >> "%directory%\%application%-api\requirements.txt"
echo gunicorn >> "%directory%\%application%-api\requirements.txt"
echo django-cors-headers >> "%directory%\%application%-api\requirements.txt"
echo django-createsuperuser >> "%directory%\%application%-api\requirements.txt"
echo django-jenkins >> "%directory%\%application%-api\requirements.txt"
echo pyunpack >> "%directory%\%application%-api\requirements.txt"
echo djangorestframework_simplejwt >> "%directory%\%application%-api\requirements.txt"

cd %directory%
cd %application%-api

cd %directory%
cd %application%-api\%application%project

FOR /f "delims=" %%i IN ('FINDSTR /b SECRET_KEY requirements.txt') DO SET secretkey=%%i

echo %secretkey%
cd %directory%
