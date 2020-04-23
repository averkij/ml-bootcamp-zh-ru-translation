#!/bin/bash
#echo "start"
mv /china2-model_step_55000.pt /OpenNMT-py/
cd /OpenNMT-py && python translate.py -model china2-model_step_55000.pt -src /tmp/data/input.txt -output /opt/results/output.txt -replace_unk -verbose
#echo "end"