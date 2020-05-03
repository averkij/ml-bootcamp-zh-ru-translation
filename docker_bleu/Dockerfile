FROM ubuntu:16.04

ENV py_version=3
RUN test $py_version || exit 1

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

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PYTHONIOENCODING=UTF-8 LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN pip install torch==1.2.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

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
six==1.12.0 \
torchtext==0.5.0 \
tqdm==4.41.0

WORKDIR /
RUN git clone https://github.com/OpenNMT/OpenNMT-py.git && cd OpenNMT-py 
WORKDIR /OpenNMT-py

RUN python setup.py install

WORKDIR /

COPY run.sh .
COPY src.code .
COPY src32_open.code .
COPY ondatr-trans_step_160000.pt .
COPY ondatr-trans_step_200000.pt .
COPY ondatr-trans_step_220000.pt .
COPY ondatr-trans_step_240000.pt .
COPY ondatr-trans_step_260000.pt .
COPY ondatr-trans_step_280000.pt .
COPY ondatr-trans_step_300000.pt .

COPY _sent_ru_test_open.txt .
COPY _sent_zh_test_open.txt .
COPY sent_ru_test_open.txt .
COPY sent_zh_test_open.txt .
COPY sent_ru_test_ted.txt .
COPY sent_zh_test_ted.txt .

RUN mkdir -p /opt/results/

ENTRYPOINT ["bash", "run.sh"] 