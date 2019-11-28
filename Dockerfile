#install docker
#sudo curl -sSL get.docker.com | sh

#Construction et installation de l'image
#docker build -t f80hub/scientist_python_server_arm . & docker push f80hub/scientist_python_server_arm:latest
#pour les problemes de droit sur les répertoires : su -c "setenforce 0"
#docker rm -f scientist_python_server_arm && docker pull f80hub/scientist_python_server_arm:latest && docker run --restart=always -p 6080:6080 --name scientist_python_server_arm -d f80hub/scientist_python_server_arm:latest 6080


FROM arm32v7/python:3-alpine

RUN apk update
RUN apk upgrade


RUN apk --no-cache --update-cache add gcc g++ gfortran python3-dev py3-pip build-base wget freetype-dev libpng-dev openblas-dev
RUN pip3 install --upgrade pip
RUN pip3 install cython
RUN apk add py3-numpy py3-setuptools
RUN pip3 -v install pandas==0.23.4
RUN pip3 -v install scikit-learn
RUN pip3 -v install networkx
RUN pip3 -v install hdbscan
RUN pip3 -v install matplotlib

#Installation des composants pour l'architecture
RUN pip3 -v install Flask
RUN pip3 -v install flask-cors

#Installation des composants de securisation du serveur
#RUN apk add py3-openssl

#Installation de l'application
RUN mkdir /app
WORKDIR /app
COPY . /app

ENTRYPOINT ["python", "app.py"]