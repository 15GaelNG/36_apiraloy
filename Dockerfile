FROM python:3.9-alpine

#--- Create the vars

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN adduser -D raloy
ENV MY_IP=172.17.0.1

#--- Update OS

RUN apk --update upgrade

#--- Install Alpine packages

RUN apk add --no-cache \
build-base \
bzip2-dev \
ca-certificates \
curl \
git \
libffi-dev \
libxslt-dev \
linux-headers \
ncurses-dev \
openssl-dev \
readline-dev \
sqlite-dev vim 

RUN apk add build-base
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

#--- EndPoint Workdir
#--- Config folder api

RUN mkdir -p api_raloy
WORKDIR api_raloy

#Git Clone & work in the project
RUN git clone https://${TOKEN}@github.com/Raloy-Lubricantes-S-A-de-C-V/DEV036.git


WORKDIR /api_raloy/DEV036
ENV FLASK_APP=app.py
COPY entrypoint.sh .


# Deéndencies and requeriments
RUN pip3 install --upgrade pip setuptools
RUN python -m pip install --upgrade pip
#COPY requirements.txt .
RUN pip3 install -r requeriments.txt

EXPOSE 5000
RUN ["chmod", "+x", "/api_raloy/DEV036/entrypoint.sh"]
ENTRYPOINT ["sh","/api_raloy/DEV036/entrypoint.sh"]



