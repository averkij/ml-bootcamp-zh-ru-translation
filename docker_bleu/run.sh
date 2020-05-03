#!/bin/bash
python /OpenNMT-py/tools/apply_bpe.py -c /src32_open.code -i /sent_zh_test_open.txt -o /sent_zh_test_open.bpe
#
#
python /OpenNMT-py/translate.py -model /ondatr-trans_step_160000.pt -src /sent_zh_test_open.bpe -output /pred160_open.bpe -replace_unk -verbose
sed 's/@@ //g' /pred160_open.bpe
perl /OpenNMT-py/tools/multi-bleu.perl /sent_ru_test_open.txt < /pred160_open.bpe >> /result.txt
#
python /OpenNMT-py/translate.py -model /ondatr-trans_step_200000.pt -src /sent_zh_test_open.bpe -output /pred200_open.bpe -replace_unk -verbose
sed 's/@@ //g' /pred200_open.bpe
perl /OpenNMT-py/tools/multi-bleu.perl /sent_ru_test_open.txt < /pred200_open.bpe >> /result.txt
#
python /OpenNMT-py/translate.py -model /ondatr-trans_step_220000.pt -src /sent_zh_test_open.bpe -output /pred220_open.bpe -replace_unk -verbose
sed 's/@@ //g' /pred220_open.bpe
perl /OpenNMT-py/tools/multi-bleu.perl /sent_ru_test_open.txt < /pred220_open.bpe >> /result.txt
#
python /OpenNMT-py/translate.py -model /ondatr-trans_step_240000.pt -src /sent_zh_test_open.bpe -output /pred240_open.bpe -replace_unk -verbose
sed 's/@@ //g' /pred240_open.bpe
perl /OpenNMT-py/tools/multi-bleu.perl /sent_ru_test_open.txt < /pred240_open.bpe >> /result.txt
#
python /OpenNMT-py/translate.py -model /ondatr-trans_step_260000.pt -src /sent_zh_test_open.bpe -output /pred260_open.bpe -replace_unk -verbose
sed 's/@@ //g' /pred260_open.bpe
perl /OpenNMT-py/tools/multi-bleu.perl /sent_ru_test_open.txt < /pred260_open.bpe >> /result.txt
#
python /OpenNMT-py/translate.py -model /ondatr-trans_step_280000.pt -src /sent_zh_test_open.bpe -output /pred280_open.bpe -replace_unk -verbose
sed 's/@@ //g' /pred280_open.bpe
perl /OpenNMT-py/tools/multi-bleu.perl /sent_ru_test_open.txt < /pred280_open.bpe >> /result.txt
#
python /OpenNMT-py/translate.py -model /ondatr-trans_step_300000.pt -src /sent_zh_test_open.bpe -output /pred300_open.bpe -replace_unk -verbose
sed 's/@@ //g' /pred300_open.bpe
perl /OpenNMT-py/tools/multi-bleu.perl /sent_ru_test_open.txt < /pred300_open.bpe >> /result.txt
