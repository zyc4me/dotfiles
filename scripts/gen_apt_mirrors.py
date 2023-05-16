#!/usr/bin/env python
#coding: utf-8

def get_site_location_by_name(site_name : str):
    site_mp = {
        'ustc':     'mirrors.ustc.edu.cn',
        'aliyun':   'mirrors.aliyun.com',
        'tuna':     'mirrors.tuna.tsinghua.edu.cn',
        '163':      'mirrors.163.com',
        'zju':      'mirrors.zju.edu.cn',
        'huawei':   'mirrors.huaweicloud.com',
        'lzu':      'mirror.lzu.edu.cn',
        'sjtu':     'mirrors.sjtug.sjtu.edu.cn'
    }
    return site_mp[site_name]


def get_ubuntu_distro_name_by_number_str(distro_num_str):
    dist_mp = {
        '12.04': 'precise',
        '14.04': 'trusty',
        '16.04': 'xenial',
        '16.10': 'yakkety',
        '17.04': 'zesty',
        '17.10': 'artful',
        '18.04': 'bionic',
        '20.04': 'focal',
        '20.10': 'groovy',
        '21.04': 'hirsute',
        '21.10': 'impish',
        '22.04': 'jammy',
        '22.10': 'kinetic',
        '23.04': 'lunar',
        '23.10': 'mantic'
    }
    return dist_mp[distro_num_str]


def get_mirror_site(distro_num_str='22.04', site_name='aliyun', https=True, ipv6=False):
    protocal = 'https' if https else 'http'
    ipv6_part = 'ipv6' if ipv6 else ''
    location = get_site_location_by_name(site_name)

    # e.g. https://mirrors.ustc.edu.cn
    site_url = "{:s}://{:s}{:s}".format(protocal, ipv6_part, location)
    distro = get_ubuntu_distro_name_by_number_str(distro_num_str)

    mirror_url_lst = [
        '# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释',
        'deb {:s}/ubuntu/ {:s} main restricted universe multiverse'.format(site_url, distro),
        '# deb-src {:s}/ubuntu/ {:s} main restricted universe multiverse'.format(site_url, distro),
        'deb {:s}/ubuntu/ {:s}-updates main restricted universe multiverse'.format(site_url, distro),
        '# deb-src {:s}/ubuntu/ {:s}-updates main restricted universe multiverse'.format(site_url, distro),
        'deb {:s}/ubuntu/ {:s}-backports main restricted universe multiverse'.format(site_url, distro),
        '# deb-src {:s}/ubuntu/ {:s}-backports main restricted universe multiverse'.format(site_url, distro),
        'deb {:s}/ubuntu/ {:s}-security main restricted universe multiverse'.format(site_url, distro),
        '# deb-src {:s}/ubuntu/ {:s}-security main restricted universe multiverse'.format(site_url, distro),

        '# 预发布软件源，不建议启用',
        '# deb {:s}/ubuntu/ {:s}-proposed main restricted universe multiverse'.format(site_url, distro),
        '# deb-src {:s}/ubuntu/ {:s}-proposed main restricted universe multiverse'.format(site_url, distro)
    ]
    for mirror_url in mirror_url_lst:
        print(mirror_url)


if __name__ == '__main__':
    # Actually, the most simple method is to use vim's replace:
    # :%s/archive.ubuntu.com/mirrors.huaweicloud.com/g
    get_mirror_site(distro_num_str='22.04', site_name='aliyun')

