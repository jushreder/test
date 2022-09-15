#!/bin/bash


mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp juapp.py tempdir/.
cp -r templates/* tempdir/templates/
cp -r static/* tempdir/static/


#cd tempdir/
#python3 -m venv ju
#source ju/bin/activate

echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask " >> tempdir/Dockerfile

echo "COPY ./static /home/myapp/static" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates" >> tempdir/Dockerfile
echo "COPY juapp.py /home/myapp/" >> tempdir/Dockerfile

echo "EXPOSE 5050" >> tempdir/Dockerfile

echo "CMD python3 /home/myapp/juapp.py" >>tempdir/Dockerfile

cd tempdir

docker build -t juapp.py .

docker run -t -d -p 5050:5050 --name jushr juapp.py

docker ps -a


