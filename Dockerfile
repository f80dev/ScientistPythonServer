#install docker
#sudo curl -sSL get.docker.com | sh

#Construction et installation de l'image

#pour les problemes de droit sur les répertoires : su -c "setenforce 0"
#docker rm -f scientist_python_server_x86 && docker pull f80hub/scientist_python_server_x86:latest && docker run --restart=always -p 7080:7080 --name scientist_python_server_x86 -d f80hub/scientist_python_server_x86:latest 7080

#pour x86
FROM python:3.10.0a3-slim-buster
#docker build -t f80hub/scientist_python_server_x86 . & docker push f80hub/scientist_python_server_x86:latest

#pour arm
#FROM arm32v7/python:3.8.2-alpine3.11
#docker build -t f80hub/scientist_python_server_arm . & docker push f80hub/scientist_python_server_arm:latest


#RUN echo "http://dl-8.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
#RUN echo "http://dl-8.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
#RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apt update
RUN apt upgrade

RUN pip3 install --upgrade pip
#Installation des librairies complémentaires

#fdsfds


RUN apt get gcc g++ gfortran python python3-dev py-pip build-base wget freetype-dev libpng-dev openblas-dev
RUN pip3 install Cython
RUN pip3 install wheel

RUN pip3 install scipy
RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install networkx
#RUN pip3 install --no-binary :all: hdbscan
RUN easy_install folium
RUN pip3 install matplotlib

#Installation des composants pour l'architecture
#RUN pip3 install Flask
#RUN pip3 install flask-cors

RUN pip3 install scikit-learn

#Installation des composants de securisation du serveur
#RUN apk add py3-openssl

#Installation de l'application
#RUN mkdir /app
#WORKDIR /app
#COPY . /app

#ENTRYPOINT ["python", "app.py"]