FROM ubuntu:16.04

ENV py_version=3

# Validate that arguments are specified
RUN test $py_version || exit 1

# Install python and nginx
RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        jq \
        libsm6 \
        libxext6 \
        libxrender-dev \
		git \
        nginx && \
    if [ $py_version -eq 3 ]; \
       then apt-get install -y --no-install-recommends python3.6-dev \
           && ln -s -f /usr/bin/python3.6 /usr/bin/python; \
       else apt-get install -y --no-install-recommends python-dev; fi && \
    rm -rf /var/lib/apt/lists/*

# Install pip
RUN cd /tmp && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py 'pip<=18.1' && rm get-pip.py

# Python won’t try to write .pyc or .pyo files on the import of source modules
# Force stdin, stdout and stderr to be totally unbuffered. Good for logging
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PYTHONIOENCODING=UTF-8 LANG=C.UTF-8 LC_ALL=C.UTF-8

# Install dependencies from pip

RUN pip install torch==1.2.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

# RUN if [ $py_version -eq 3 ]; \
#         then pip install --no-cache-dir http://download.pytorch.org/whl/cpu/torch-1.0.0-cp36-cp36m-linux_x86_64.whl; \
#         else pip install --no-cache-dir http://download.pytorch.org/whl/cpu/torch-1.0.0-cp27-cp27mu-linux_x86_64.whl; fi && \
#RUN pip install --no-cache-dir Pillow retrying six jieba torchvision==0.2.1

#RUN pip install --no-cache-dir retrying

#torch 1.3.1
#torchtext 0.5.0

RUN pip install --no-cache-dir \
jieba==0.42.1 \
certifi==2019.6.16 \
chardet==3.0.4 \
ConfigArgParse==1.2.2 \
future==0.17.1 \
idna==2.8 \
nltk==3.4.5 \
numpy==1.16.4 \
requests==2.22.0 \
sentencepiece==0.1.85 \
#singledispatch==3.4.0.3 \
six==1.12.0 \
torchtext==0.5.0 \
tqdm==4.41.0
#ujson==1.35 \
#urllib3==1.24

#RUN python -m nltk.downloader punkt

WORKDIR /
RUN git clone https://github.com/OpenNMT/OpenNMT-py.git && cd OpenNMT-py 
WORKDIR /OpenNMT-py

#RUN git checkout 518a19d4fbda6dd90f18a838a9a8986e1a0e6663 && 
#RUN pip install -r requirements.txt

RUN python setup.py install

WORKDIR /

COPY run.sh .
COPY script.py .
COPY china2-model_step_55000.pt .

RUN mkdir -p /opt/results/

ENTRYPOINT ["bash", "run.sh"] 