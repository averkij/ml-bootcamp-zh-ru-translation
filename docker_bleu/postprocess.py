#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals, division

import sys
import codecs
import io
import argparse
import json
import re
from collections import defaultdict

# hack for python2/3 compatibility
from io import open
argparse.open = open

def create_parser():
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description="parser")

    parser.add_argument(
        '--input', '-i', type=argparse.FileType('r'), default=sys.stdin,
        metavar='PATH',
        help="Input file (default: standard input).")
    parser.add_argument(
        '--output', '-o', type=argparse.FileType('w'), default=sys.stdout,
        metavar='PATH',
        help="Output file (default: standard output)")

    return parser

def fix_capitalization(mystr):
    newstr = []
    for s in mystr.split('. '):
        tmp = re.sub('^(\s*\w+)', lambda x:x.group(1).title(), s)
        newstr.append(tmp)     
    return '. '.join(newstr).replace(' i ', ' I ')

if __name__ == '__main__':

    # python 2/3 compatibility
    if sys.version_info < (3, 0):
        sys.stderr = codecs.getwriter('UTF-8')(sys.stderr)
        sys.stdout = codecs.getwriter('UTF-8')(sys.stdout)
        sys.stdin = codecs.getreader('UTF-8')(sys.stdin)
    else:
        sys.stdin = io.TextIOWrapper(sys.stdin.buffer, encoding='utf-8')
        sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8')
        sys.stdout = io.TextIOWrapper(
            sys.stdout.buffer, encoding='utf-8', write_through=True, line_buffering=True)

    parser = create_parser()
    args = parser.parse_args()

    if args.input.name != '<stdin>':
        args.input = codecs.open(args.input.name, encoding='utf-8')
    if args.output.name != '<stdout>':
        args.output = codecs.open(args.output.name, 'w', encoding='utf-8')

    
    # pattern = re.compile(r'[\s]+')
    pattern = re.compile(r'[a-zA-Z0-9\(\)\[\]\s\/\-\:！？｡。•＂＃＄％＆＇（）＊＋，－／：；＜＝＞＠［＼］＾＿｀｛｜｝～｟｠｢｣､、〃》「」『』【】〔〕〖〗〘〙〚〛〜〝〞〟〰〾〿–—‘’‛“”„‟…‧﹏.．]+')
    for line in args.input:
        args.output.write(fix_capitalization(line).strip())
        args.output.write('\n')
