#!/usr/bin/env python
#coding: utf-8

from __future__ import print_function

import requests
from html.parser import HTMLParser
import time
import os
from download_file import download_file

class MyHtmlParser(HTMLParser):

    a_text = False
    goods = []

    def handle_starttag(self, tag, attr):
        if tag == 'a':
            self.a_text = True

    def handle_endtag(self, tag):
        if tag == 'a':
            self.a_text = False

    def handle_data(self, data):
        if self.a_text and data.endswith('-all.zip') and 'rc' not in data and 'milestone' not in data:
            version = data.split('-')[1]
            if (version > '3.0'):
                self.goods.append(data)


def get_gradle_distributions():
    url = 'https://services.gradle.org/distributions/'
    r = requests.get(url)

    parser = MyHtmlParser()
    parser.feed(r.text)
    parser.close()
    goods = parser.goods

    print(goods)
    return goods


if __name__ == '__main__':
    dists = get_gradle_distributions()
    #dists = ['gradle-5.5.1-all.zip']
    for dist in dists[1:]:
        url = 'https://services.gradle.org/distributions/' + dist
        #downloadFile(dist, url)
        #print('-- saved ' + dist)
        print(url)
        download_file(url)
    print('=== Done')
