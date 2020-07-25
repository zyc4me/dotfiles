#!/usr/bin/env python
#coding: utf-8


#!/usr/bin/env python
#coding: utf-8

def get_mirror_site(dist_num_str='16.04', site_name='aliyun'):
    site_mp = {
        'ustc': 'https://mirrors.ustc.edu.cn',
        'aliyun': 'http://mirrors.aliyun.com',
        'tuna': 'https://mirrors.tuna.tsinghua.edu.cn',
        '163': 'http://mirrors.163.com',
        'zju': 'http://mirrors.zju.edu.cn',
        'huawei': 'http://mirrors.huaweicloud.com'
    }

    site_url = site_mp[site_name]

    dist_mp = {
        '12.04': 'precise',
        '14.04': 'trusty',
        '16.04': 'xenial',
        '16.10': 'yakkety',
        '17.04': 'zesty',
        '17.10': 'artful',
        '18.04': 'bionic',
        '20.04': 'focal',
		'20.10': 'groovy'    
    }

    dist_name = dist_mp[dist_num_str]


    mirror_url_lst = [
        '# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释',
        'deb {:s}/ubuntu/ {:s} main restricted universe multiverse'.format(site_url, dist_name),
        '# deb-src {:s}/ubuntu/ {:s} main restricted universe multiverse'.format(site_url, dist_name),
        'deb {:s}/ubuntu/ {:s}-updates main restricted universe multiverse'.format(site_url, dist_name),
        '# deb-src {:s}/ubuntu/ {:s}-updates main restricted universe multiverse'.format(site_url, dist_name),
        'deb {:s}/ubuntu/ {:s}-backports main restricted universe multiverse'.format(site_url, dist_name),
        '# deb-src {:s}/ubuntu/ {:s}-backports main restricted universe multiverse'.format(site_url, dist_name),
        'deb {:s}/ubuntu/ {:s}-security main restricted universe multiverse'.format(site_url, dist_name),
        '# deb-src {:s}/ubuntu/ {:s}-security main restricted universe multiverse'.format(site_url, dist_name),

        '# 预发布软件源，不建议启用',
        '# deb {:s}/ubuntu/ {:s}-proposed main restricted universe multiverse'.format(site_url, dist_name),
        '# deb-src {:s}/ubuntu/ {:s}-proposed main restricted universe multiverse'.format(site_url, dist_name)
    ]
    for mirror_url in mirror_url_lst:
        print(mirror_url)

if __name__ == '__main__':
    get_mirror_site(dist_num_str='20.04', site_name='aliyun')

