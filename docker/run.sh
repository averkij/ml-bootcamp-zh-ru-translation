#!/bin/bash
#python /script.py
#mv /ondatr-model_step_50000.pt /OpenNMT-py/
python /apply_bpe.py -c /src_ted217_32.code -i /tmp/data/input.txt -o /input.bpe
python /OpenNMT-py/translate.py -model /ondatr-trans_step_100000_ted217_v32_lower.pt -src /input.bpe -output /output.bpe -replace_unk -verbose
sed 's/@@ //g' /output.bpe > /opt/results/output.txt
#mv /output.bpe /opt/results/output.txt