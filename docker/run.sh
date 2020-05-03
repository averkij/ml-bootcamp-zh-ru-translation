#!/bin/bash
#python /script.py
#mv /ondatr-model_step_50000.pt /OpenNMT-py/
python /OpenNMT-py/tools/apply_bpe.py -c /src32_open.code -i /tmp/data/input.txt -o /input.bpe
python /OpenNMT-py/translate.py -model /ondatr-trans_step_150000_v32_open500.pt -src /input.bpe -output /output.bpe -replace_unk -verbose
sed 's/@@ //g' /output.bpe > /opt/results/output.txt
#mv /output.bpe /opt/results/output.txt