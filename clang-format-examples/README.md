# clang-format examples

## 1. 目的
clang-format 用于代码风格调整，配置文件 `.clang-format` 用于填写不同的风格选项。先前用过 ncnn 等项目的 .clang-format 文件，整体上感觉好用， 但为什么是那些选项， 每个选项有什么效果， 从来不清楚。

这个仓库存放一些例子， 每个目录对应一个独立的 .clang-format 文件， 里面只提供最少的配置， 配合对应的 c++ 代码， 展示配置项的具体效果。

## 2. .clang-format 配置文件格式
.clang-format 文件遵循 YAML 格式:
```yaml
key1: value1
key2: value2
# A comment.
...
```

### 2.1 YAML 格式速成
（这部分翻译自 What is YAML? A beginner's guide[^1])

`YAML` 是 `YAML Ain't Markup Language` 的意思。

YAML 格式： 是 JSON 的超集， 是另一种数据序列化语言。 YAML 文件的基本结构是一个 map, 也叫做字典、哈希或者对象。它的通用写法是：
```YAML
key: value
```

#### key 的构成
key 的构成： 可以用下划线、中横线或者空格分隔的单词。

#### value 的构成
可以使用所有的标量类型作为 value： 数字， 布尔类型， 字符串（带引号或不带引号）。config.yml 的第一行， 通常是：
```yaml
version: 2
```

如果 value 非常长， 一行填写不下， 可以使用 `|` 符号在第一行行尾， 和第二行连接起来。这在定义 shell 命令时候非常有用:
```yaml
command: |
    if [ "${CIRCLE_BRANCH}" == "master" ];
      then ansible-playbook site.yml -i production;
    fi
```
注意： 多行字符串的开头的缩进会被 strip 掉。

#### 集合类型
使用缩进来创建集合:
```yaml
environment:
    TEST_REPORTS: /tmp/test-reports
```

如果有一个列表需要表示， 可以用 dash（短横线）来表示这个序列：
```yaml
docker:
    - image: ubuntu:14.04
    - image: mongo:2.6.8
      command: [mongod, --smallfiles]
    - image: postgres:9.4.1
```
注意在这个序列的第二项中， 有两个 key: `image`, `command`， `command` 使用的是 JSON 风格的序列， 这是 ok 的因为 YAML 是 JSON 的超集。

最后注意， YAML 不允许 tab 字符， 使用的话会产生语法错误。不用太担心写错， 可以用在线工具检查是否符合 YAML 规范: [YAML Validator](https://codebeautify.org/yaml-validator)

关于 YAML 的更多内容可以看 YAML 官方文档： https://yaml.org/spec/1.2.2/

### 2.2 .clang-format 中用到的 YAML 语法

原始 yaml:
```yaml
---
# We'll use defaults from the LLVM style, but with 4 columns indentation.
BasedOnStyle: LLVM
IndentWidth: 4
---
Language: Cpp
# Force pointers to the type for C++.
DerivePointerAlignment: false
PointerAlignment: Left
---
Language: JavaScript
# Use 100 columns for JS.
ColumnLimit: 100
---
Language: Proto
# Don't format .proto files.
DisableFormat: true
---
Language: CSharp
# Use 100 columns for C#.
ColumnLimit: 100
...
```

解释：
- 这个 YAML 文件包含了5个 document， 每个 document 以 `---` 开始
- 每个 document 都包含了一个单行注释行， `#` 开头的那一行
- 每个一内容行， 是一个 mapping， 结构是 `key: value`, 注意空格是必须的

#### `---`

YAML 使用三个短横线(`---`) 有两个作用：
- 来分隔 directives 和 document content
- 如果没有出现 directives， 那么 `---` 表示 document 的开始

关于 directives: 当前 YAML 版本是 1.2 （2023.07.13）， 只定义了两个 directive: `YAML` 和 `TAG`.

关于 document 的概念：暂时没弄明白， 感觉就是内容主体。

也就是说， **在一个 YAML 文件中， 如果出现了不止一次 `---`, 那么表示“表示了多个 document”， 被 `---` 分割的每一部分， 是一个文档（document）**。

[YAML文件：在单一文件中区分多个文件](https://blog.csdn.net/weixin_40571937/article/details/109035416)

举例：
```yaml
# Ranking of 1998 home runs
---
- Mark McGwire
- Sammy Sosa
- Ken Griffey

# Team ranking
---
- Chicago Cubs
- St Louis Cardinals
```
表示存在两个文档， 每个文档都是以 `#` 开头的注释行。

#### `...`
YAML 中的三个点 `...` 表示一个 document 的结束。

#### `#`
`#` 表示单行注释的起始。`#` 必须和其他字符用空格分隔。

https://yaml.org/spec/1.2.2/#66-comments

#### key 和 value 之间用 `: ` （冒号加空格）分隔
> Mappings use a colon and space (“: ”) to mark each key/value pair. 

https://yaml.org/spec/1.2.2/#21-collections

>Normally, YAML insists the “:” mapping value indicator be separated from the value by white space. A benefit of this restriction is that the “:” character can be used inside plain scalars, as long as it is not followed by white space. This allows for unquoted URLs and timestamps. It is also a potential source for confusion as “a:1” is a plain scalar and not a key: value pair.

[Why does the YAML spec mandate a space after the colon?](https://stackoverflow.com/questions/42124227/why-does-the-yaml-spec-mandate-a-space-after-the-colon)

YAML 格式在表示 mapping（也就是字典）结构时， key 和 value 之间用冒号加空格 `: ` 来间隔，而不是只用冒号 `:` 分隔， 好处是：纯文本的标量中依然可以使用冒号。例如：
- 没有被引号引起来的 URL
- 时间戳
- `a:1` 表示 plain scalar， 而不是 `key: value` 对

总之， YAML 中用 `key: value` 表示 mapping（字典）， 而 `key:value` 不用来表示 mapping。


## 3. 配置 .clang-format 的独立例子

1. [no_dot_clang_format](no_dot_clang_format/README.md)
2. [minimal_dot_clang_format](minimal_dot_clang_format/README.md)
3. [based_on_style](based_on_style/README.md)

## References
[^1]: [What is YAML? A beginner's guide](https://circleci.com/blog/what-is-yaml-a-beginner-s-guide/?psafe_param=1&utm_source=google&utm_medium=sem&utm_campaign=sem-google-dg--japac-en-dsa-tROAS-auth-brand&utm_term=g_-_c__dsa_&utm_content=&gclid=CjwKCAjwwb6lBhBJEiwAbuVUSmPNa9Qs1FvVugnXlbwf9RvxHFS6Ff3adILwbLplEmOH0Yfg_LHpvRoChLUQAvD_BwE)