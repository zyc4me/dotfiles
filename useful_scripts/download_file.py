# coding: utf-8

import requests
from tqdm.auto import tqdm
import os

"""
Download file with progress bar. Implemented by requests & tqdm.
ref: https://stackoverflow.com/questions/15644964/python-progress-bar-and-downloads/15645088

@param url: the file you'd like to get
@param save_file: file's saving name. Optional.

example:
    url = 'http://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz'
    download_file(url)
"""
def download_file(url, save_file=None):
    if save_file is None:
        save_file = url.split('/')[-1]
    if os.path.exists(save_file) is True:
        return
    response = requests.get(url, stream=True)
    with tqdm.wrapattr(open(save_file, "wb"), "write", miniters=1,
                    total=int(response.headers.get('content-length', 0)),
                    desc=save_file) as fout:
        for chunk in response.iter_content(chunk_size=4096):
            fout.write(chunk)
