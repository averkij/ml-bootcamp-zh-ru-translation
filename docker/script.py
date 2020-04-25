#!/usr/bin/python
# -*- coding: utf8 -*-

inputPath = '/tmp/data/input.txt'
tokensPath = '/tmp/data/input_tokens.txt'
#outputPath = '/opt/data/output.txt'

#inputPath = 'D:\\git\\output_zh_test.txt'
#tokensPath = 'D:\\git\\output_zh_test_tokens.txt'

import jieba

with open(inputPath, mode='r', encoding='utf-8') as input, open(tokensPath, mode='w', encoding='utf-8') as tokens:
	for line in input:
		tokenized = ' '.join([x.strip() for x in jieba.lcut(line)])
		tokens.write(tokenized + '\n')