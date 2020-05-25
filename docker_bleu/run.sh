#!/bin/bash
python /apply_bpe.py -c /src.code -i /books_test_zh.txt -o /sent_zh_test.bpe
#asd
# #
# python /OpenNMT-py/translate.py -model /ondatr-trans_step_10000.pt -src /sent_zh_test.bpe -output /pred10_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred10_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred10_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-trans_step_20000.pt -src /sent_zh_test.bpe -output /pred20_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred20_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred20_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-trans_step_30000.pt -src /sent_zh_test.bpe -output /pred30_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred30_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred30_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-trans_step_40000.pt -src /sent_zh_test.bpe -output /pred40_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred40_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred40_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-trans_step_50000.pt -src /sent_zh_test.bpe -output /pred50_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred50_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred50_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-trans_step_60000.pt -src /sent_zh_test.bpe -output /pred60_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred60_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred60_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-trans_step_70000.pt -src /sent_zh_test.bpe -output /pred70_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred70_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred70_open.bpe >> /result.txt

#
# python /OpenNMT-py/translate.py -model /ondatr-news_step_80000.pt -src /sent_zh_test.bpe -output /pred80_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred80_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred80_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-news_step_90000.pt -src /sent_zh_test.bpe -output /pred90_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred90_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred90_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-news_step_100000.pt -src /sent_zh_test.bpe -output /pred100_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred100_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred100_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-news_step_110000.pt -src /sent_zh_test.bpe -output /pred110_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred110_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred110_open.bpe >> /result.txt

#
python /OpenNMT-py/translate.py -model /ondatr-news_step_100000.pt -src /sent_zh_test.bpe -output /pred120_open.bpe -verbose -batch_size 50 -beam_size 10
sed 's/@@ //g' /pred120_open.bpe
# python /postprocess.py -i /pred120_open.bpe -o /pred120_open.txt
perl /OpenNMT-py/tools/multi-bleu.perl /books_test_ru.txt < /pred120_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-trans_step_130000.pt -src /sent_zh_test.bpe -output /pred130_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred130_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred130_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-trans_step_140000.pt -src /sent_zh_test.bpe -output /pred140_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred140_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred140_open.bpe >> /result.txt

# #
# python /OpenNMT-py/translate.py -model /ondatr-trans_step_150000.pt -src /sent_zh_test.bpe -output /pred150_open.bpe -replace_unk -verbose
# sed 's/@@ //g' /pred150_open.bpe
# perl /OpenNMT-py/tools/multi-bleu.perl /book_ru.txt < /pred150_open.bpe >> /result.txt

