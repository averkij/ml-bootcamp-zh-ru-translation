#!/bin/bash
#python /script.py
#mv /ondatr-model_step_50000.pt /OpenNMT-py/
python /apply_bpe.py -c /src.code -i /tmp/data/input.txt -o /input.bpe
python /OpenNMT-py/translate.py -model /ondatr-news_step_20000_aligned_21.pt -src /input.bpe -output /output.bpe -replace_unk -verbose -batch_size 50 -beam_size 5
sed 's/@@ //g' /output.bpe > /opt/results/output.txt
#mv /output.bpe /opt/results/output.txt