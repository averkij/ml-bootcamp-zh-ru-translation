#!/bin/bash
python /script.py
mv /china2-model_step_55000.pt /OpenNMT-py/
cd /OpenNMT-py && python translate.py -model china2-model_step_55000.pt -src /tmp/data/input_tokens.txt -output /opt/results/output.txt -replace_unk -verbose
#python /script2.py