FROM tensorflow/tensorflow:1.13.2-gpu-py3

WORKDIR /east
ADD . /east

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN rm /etc/apt/sources.list.d/*
RUN apt-get update
RUN apt-get install -y libsm6 libxrender1 libxext-dev gcc libgeos-dev vim
RUN apt-get install -y language-pack-zh-hans
RUN pip3 install -i http://pypi.douban.com/simple -r /east/requirements.txt --trusted-host pypi.douban.com


