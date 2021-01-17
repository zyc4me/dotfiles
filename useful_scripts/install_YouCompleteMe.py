# coding: utf-8
"""
This script tries to install YouCompleteMe in a more stable way

It clone all the dependent submodule repos into local directory, which can use mirror site (gitee.com) for better speed

It requires git version >= 2.30.0 thus `git submodule update --init --depth 1` can be run correctly

It use an iteractive way for installation: print out the commands to be executed, and you copy them to run, then re run this script, get newer content, re-rerun it.
"""

import os

local_github_dir='/home/zz/work/github'
ycm_tgt_dir = '/home/zz/work/test/ycmtest'
use_mirror = True

submodule_lst = [
    {
        'url': 'https://github.com/certifi/python-certifi',
        'mirror_url': 'https://gitee.com/mirrors/python-certifi',
    },

    {
        'url': 'https://github.com/chardet/chardet',
        'mirror_url': 'https://gitee.com/mirrors/chardet',
    },

    {
        'url': 'https://github.com/kjd/idna',
        'mirror_url': 'https://gitee.com/mirrors/idna',
    },

    {
        'url': 'https://github.com/requests/requests',
        'mirror_url': 'https://gitee.com/mirrors/requests',
    },

    {
        'url': 'https://github.com/urllib3/urllib3',
        'mirror_url': 'https://gitee.com/mirrors/urllib3',
    },

    {
        'url': 'https://github.com/ross/requests-futures',
        'mirror_url': 'https://gitee.com/ycm-core/requests-futures',
    },

    {
        'url': 'https://github.com/defnull/bottle',
        'mirror_url': 'https://gitee.com/ycm-core/bottle',
    },

    {
        'url': 'https://github.com/davidhalter/jedi',
        'mirror_url': 'https://gitee.com/ycm-core/jedi',
    },

    {
        'url': 'https://github.com/numpy/numpydoc',
        'mirror_url': 'https://gitee.com/ycm-core/numpydoc',
    },

    {
        'url': 'https://github.com/davidhalter/parso',
        'mirror_url': 'https://gitee.com/ycm-core/parso',
    },

    {
        'url': 'https://github.com/gorakhargosh/pathtools',
        'mirror_url': 'https://gitee.com/ycm-core/pathtools',
    },

    {
        'url': 'https://bitbucket.org/mrabarnett/mrab-regex',
        'mirror_url': 'https://gitee.com/ycm-core/mrab-regex',
    },

    {
        'url': 'https://github.com/mitsuhiko/flask-sphinx-themes',
        'mirror_url': 'https://gitee.com/ycm-core/flask-sphinx-themes',
    },

    {
        'url': 'https://github.com/davidhalter/typeshed.git',
        'mirror_url': 'https://gitee.com/ycm-core/typeshed',
    },

    {
        'url': 'https://github.com/davidhalter/django-stubs',
        'mirror_url': 'https://gitee.com/ycm-core/django-stubs',
    },

    {
        'url': 'https://github.com/scipy/scipy-sphinx-theme',
        'mirror_url': 'https://gitee.com/ycm-core/scipy-sphinx-theme',
    },

    {
        'url': 'https://github.com/Pylons/waitress',
        'mirror_url': 'https://gitee.com/mirrors/waitress',
    },

    {
        'url': 'https://github.com/gorakhargosh/watchdog',
        'mirror_url': 'https://gitee.com/mirrors/watchdog',
    },

    {
        'url': 'https://github.com/ycm-core/ycmd',
        'mirror_url': 'https://gitee.com/ycm-core/ycmd',
    },

    {
        'url': 'https://github.com/ycm-core/YouCompleteMe',
        'mirror_url': 'https://gitee.com/ycm-core/YouCompleteMe',
    }
]


# step0: check git version
def step0():
    # get git version
    import subprocess
    p = subprocess.Popen(['git', '--version'], stdout=subprocess.PIPE,
            stderr=subprocess.PIPE)
    out, err = p.communicate()
    out = out.decode('utf-8')
    out = out.strip()
    print("out is:", out)
    version = out.split(' ')[-1]
    version_minor = int(version.split('.')[1])
    if (version_minor<30):
        print("Error! Your git it too old. Please upgrade to >= 2.30.0")
        print("You may consider use PPA to get latest git:")
        print("    sudo add-apt-repository ppa:git-core/ppa")
        print("    sudo apt update")
        print("    sudo apt install git git-all")
        print("")
        print("Or, you may also compile git from source")

        compile_commands = """
    sudo apt install gettext
    sudo apt intall openssl libcurl4-openssl-dev

    wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.30.0.tar.gz

    cd ~/work/git-2.30.0
    ./configure --prefix=/home/zz/soft/git-2.30 --with-expat --with-openssl

    make -j8
    make install

export PATH=/home/zz/soft/git-2.30/libexec/git-core:$PATH
"""
        print("reference compile commands are:")
        print(compile_commands)

        exit(-1)
    else:
        print("Git version >= 2.30 satisfied")
    return

# step1: git clone all submodules to local github directory
# we can use a mirror site for speed up
def step1():
    cmd_lst = []
    for submodule in submodule_lst:
        url = submodule['url']
        mirror_url = submodule['mirror_url']
        repo_user = url.split('/')[-2]
        repo_name = url.split('/')[-1]
        local_git_dir = '%s/%s/%s' % (local_github_dir, repo_user, repo_name)
        if (os.path.exists(local_git_dir)):
            cmd = 'git -C %s pull --unshallow' % (local_git_dir)
        else:
            if (use_mirror):
                cmd = 'git clone %s %s' % (mirror_url, local_git_dir)
            else:
                cmd = 'git clone %s %s' % (url, local_git_dir)
                #cmd2 = 'git -C %s remote rename origin mirror' % (local_git_dir)
                #cmd3 = 'git -C %s add origin %s' % (local_git_dir, url)
                #cmd4 = 'git -C %s fetch upstream' % (local_git_dir)
                #cmd5 = 'git -C %s pull upstream' # seems to be wrong...
                #cmd = '\n'.join(cmd1, cmd2, cmd3, cmd4, cmd5)
        cmd_lst.append(cmd)
    return cmd_lst


# step2: git clone YouCompleteMe, from local github directory, to target directory
# e.g. ~/.vim_runtime/plugged/YouCompleteMe
def step2():
    ycm_src_dir = '%s/ycm-core/YouCompleteMe' % (local_github_dir)
    cmd = 'git clone %s %s' % (ycm_src_dir, ycm_tgt_dir)

    cmd_lst = [cmd]
    return cmd_lst

# step3: modify .gitmodule file, change web url to local file url
# then do git submodule update
# then for each submodule, re-run this precedure
# thus, this is a recursively procedure

def step3(local_repo_dir):
    cmd_lst = []
    new_config_content, submodule_dirs = submodule_urls_to_local(local_repo_dir)
    content_lines = '\n'.join(new_config_content)
    submodule_config_file = '%s/.gitmodules' % local_repo_dir
    cmd = "tee %s << EOF \n%s\nEOF" % (submodule_config_file, content_lines)
    cmd_lst.append(cmd)

    cmd = 'git -C %s submodule update --init --depth 1' % (local_repo_dir)
    cmd_lst.append(cmd)

    # Go to each submodule directory, check if there is .gitmodules file
    # if there isn't, then ignore it
    # if there is, then change it's config's web urls to local and do git submodule update
    # do this recursively
    for submodule_dir in submodule_dirs:
        submodule_submodule_config_file = '%s/.gitmodules' % (submodule_dir)
        if os.path.exists(submodule_submodule_config_file):
            #print('!!!', submodule_submodule_config_file)
            submodule_cmd_lst = step3(submodule_dir)
            cmd_lst.extend(submodule_cmd_lst)

    return cmd_lst

def submodule_urls_to_local(local_repo_dir):
    submodule_config_file = '%s/.gitmodules' % (local_repo_dir)
    submodule_dirs = []
    # TODO: we need a better .gitsubmodule parser
    # thus we don't have pre-define each submodules...
    fin = open(submodule_config_file)
    raw_lines = []
    for line in fin.readlines():
        line = line.rstrip()
        line_slim = line.strip()

        if (line_slim.endswith(".git")):
            line_slim = line_slim[:-4]

        if line_slim.startswith('url') and 'file://' not in line_slim:
            url = line_slim.split('=')[1].strip()
            repo_user = url.split('/')[-2]
            repo_name = url.split('/')[-1]
            local_git_dir = '%s/%s/%s' % (local_github_dir, repo_user, repo_name)
            new_line = '\turl = file://%s' % (local_git_dir)
            raw_lines.append(new_line)
        else:
            if (line_slim.startswith('[')):
                raw_lines.append(line_slim)
            else:
                raw_lines.append("\t" + line_slim)
            if line_slim.startswith('path'):
                directory = line_slim.split('=')[1].strip()
                directory = local_repo_dir + '/' + directory
                submodule_dirs.append(directory)
    fin.close()
    return raw_lines, submodule_dirs

if __name__ == '__main__':
    step0()

    cmd_lst = step1()
    for cmd in cmd_lst:
        print(cmd)
    print('\n')

    cmd_lst = step2()
    for cmd in cmd_lst:
        print(cmd)
    print('\n')

    cmd_lst = step3(ycm_tgt_dir)
    for cmd in cmd_lst:
        print(cmd)

    print("------------")
    print("Ok, you have installed YouCompleteMe and its submodule recursively")
    print("Now install it via:")
    print("    ./install.py --clangd")
