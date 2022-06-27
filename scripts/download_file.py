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


def download_file_with_authentication(url, username, password, save_file = None):
    print("Downloading {:s} ...".format(url))

    if save_file is None:
        save_file = url.split('/')[-1]
    if os.path.exists(save_file) is True:
        print("  local file {:s} already exist, skip download".format(save_file))
        return

    response = requests.get(url, auth=(username, password))
    status = response.status_code
    if (status != 200):
        print("  download file failed, return code ", status)
        return False

    # with open(save_file, 'wb') as f:
    #     f.write(response.content)
    with open(save_file, "wb") as fout:
        for chunk in response.iter_content(chunk_size=4096):
            fout.write(chunk)

    print("  download ok, saved as {:s}".format(url, save_file))

    return True


def test_download_with_authentication():
    url = 'https://artifactory.arcsoft.com.cn/artifactory/generic/arcpkg/toy_core/1.1.35/toy_core-1.1.35-android-armv8-a-static.zip'
    download_file_with_authentication(url, os.environ.get("ARTIFACTORY_USER"), os.environ.get("ARTIFACTORY_PSWD"))

if __name__ == '__main__':
    test_download_with_authentication()