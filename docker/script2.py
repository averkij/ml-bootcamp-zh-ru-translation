#!/usr/bin/python
# -*- coding: utf8 -*-

inputPath = '/tmp/data/input.txt'
preOutputPath = '/opt/results/pre_output.txt'
outputPath = '/opt/results/output.txt'

# inputPath = 'D:\\git\\input.txt'
# preOutputPath = 'D:\\git\\pre_output.txt'
# outputPath = 'D:\\git\\output.txt'

import jieba

with open(inputPath, mode='r', encoding='utf-8') as input, open(preOutputPath, mode='r', encoding='utf-8') as pre_output, open(outputPath, mode='w', encoding='utf-8') as output:
	#input_lines = input.readlines()

	for line in input:
		translation = pre_output.readline()
			#.strip().strip('\n').strip('\r')
		if not translation:
			translation = 'время\n'
		output.write(translation)
		#output.write(translation + '\n')