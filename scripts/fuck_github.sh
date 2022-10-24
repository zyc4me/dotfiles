#!/bin/bash

#当执行git push，发现如下提示
#remote: Support for password authentication was removed on August 13, 2021. Please use a personal access token instead.
#remote: Please see https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/ for more information.
#fatal: 无法访问 'https://github.com/zchrissirhcz/cmake_examples/'：The requested URL returned error: 403
#
# 原因：github不让本地的老repo用 https 协议执行push动作了。解决办法是改https为git：

#remote=`git remote -v | head -1 | awk '{print $2}'`
#echo $remote

remote=`git remote -v | grep 'https://github.com' | head -1 | awk '{print $1}'`
new_url=`git remote -v | grep 'github' | head -1 | awk '{print $2}' | sed -e 's/https:\/\//git@/g' -e 's/github.com\//github.com:/g'`

git remote set-url $remote $new_url
