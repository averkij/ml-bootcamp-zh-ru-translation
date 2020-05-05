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
COPY src_ted_212_32-32.code .
COPY src_ted217_32.code .

COPY ondatr-trans_step_10000.pt .
COPY ondatr-trans_step_20000.pt .
COPY ondatr-trans_step_30000.pt .
COPY ondatr-trans_step_40000.pt .
COPY ondatr-trans_step_50000.pt .
COPY ondatr-trans_step_60000.pt .
COPY ondatr-trans_step_70000.pt .
COPY ondatr-trans_step_80000.pt .
COPY ondatr-trans_step_90000.pt .
COPY ondatr-trans_step_100000.pt .
COPY ondatr-trans_step_110000.pt .
COPY ondatr-trans_step_120000.pt .
# COPY ondatr-trans_step_130000.pt .
# COPY ondatr-trans_step_140000.pt .
# COPY ondatr-trans_step_150000.pt .

# COPY sent_ru_test_open.txt .
# COPY sent_zh_test_open.txt .
# COPY sent_ru_test_ted.txt .
# COPY sent_zh_test_ted.txt .

COPY sent_ru_test.txt .
COPY sent_zh_test.txt .

COPY book_ru.txt .
COPY book_zh.txt .

COPY apply_bpe.py .

RUN mkdir -p /opt/results/

ENTRYPOINT ["bash", "run.sh"] 