
在使用 cmake 时，设定依赖库是通过 `find_package` 命令做到的，例如 `find_package(OpenCV)`，例如 `find_package(ncnn)`。

然而，当需要用的依赖库有多个版本时，或者没有在所谓的“"默认路径" 里的时候，`find_package` 会失败。关于 `find_package` 的查找顺序，可以移步我的文章 [深入理解CMake(3):find_package()的使用](https://www.jianshu.com/p/39fc5e548310)。

这里贴一个方便的脚本，用来找 XXXConfig.cmake 脚本，例如 OpenCV 安装在 /home/zz/soft/opencv-4.4 ，但是 OpenCVConfig.cmake 并不在这一目录的最顶层，而是隐藏的有点深（但为什么windows平台上又放在了最顶层呢。。迷惑）。

anyway，只要你知道你的 opencv 的安装目录，那么切换到改目录下后执行如下脚本，就可以获得`OpenCV_DIR`应该设定的值：
```bash
find . -name 'OpenCVConfig.cmake' | xargs realpath | xargs dirname
```

对于ncnn的查找也是类似的：
```bash
find . -name 'ncnnConfig.cmake' | xargs realpath | xargs dirname
```


