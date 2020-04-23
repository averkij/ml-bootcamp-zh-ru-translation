#!/usr/bin/python
# -*- coding: utf8 -*-

inputPath = '/tmp/data/input.txt'
tokensPath = '/tmp/data/input_tokens.txt'
#outputPath = '/opt/data/output.txt'

#inputPath = 'D:\\git\\input.txt'
#tokensPath = 'D:\\git\\input_tokens.txt'

import jieba

with open(inputPath, mode='r', encoding='utf-8') as input, open(tokensPath, mode='w', encoding='utf-8') as tokens:
	for line in input:
		t = jieba.lcut(line)
		tokens.write(' '.join(t))
