#!/usr/bin/python
# -*- coding: utf8 -*-

inputPath = '/tmp/data/input.txt'
tokensPath = '/tmp/data/input_tokens.txt'
#outputPath = '/opt/data/output.txt'

#inputPath = 'D:\\git\\input.txt'
#tokensPath = 'D:\\git\\input_tokens.txt'

import jieba

with open(inputPath, mode='r', encoding='utf-8') as input, open(tokensPath, mode='w', encoding='utf-8') as tokens:
	lines = input.readlines()

	#do not print \n for the last line
	for line in lines[:-1]:
		tokenized = ' '.join([x.strip() for x in jieba.lcut(line) if len(x.strip())>0])
		tokens.write(tokenized + '\n')

	tokenized = ' '.join([x.strip() for x in jieba.lcut(lines[-1]) if len(x.strip())>0])
	tokens.write(tokenized)