
"""
检查某个txt文件是否包含“零宽字符”(宽度为0的unicode字符)

思路：

1. 首先确保文件是UTF-8编码保存的

2. 确定需要检查的零宽字符的16进制表示

3. 逐行读取得到字节序列，检查每个要检查的零宽字符是否在当前行中

举例：
[b"'\xe2\x80\x8f\xe2\x80\x8e2020_08_13-11_12_36_000'"]

对于这样的输出，检查里面的bytes序列

"""

def generate_example():
    """
    generate a txt file that contains zero-width unicode characters
    """
    fout = open('x.txt', 'wb')
    content = b"'\xe2\x80\x8f\xe2\x80\x8e2020_08_13-11_12_36_000'"
    content += b'\n'
    fout.write(content)
    fout.close()


def check():
    fin = open("x.txt", "rb")

    # https://juejin.im/post/6844903669192720391
    # https://www.utf8-chartable.de/unicode-utf8-table.pl?start=8192&number=128&utf8=dec
    # https://www.ptiglobal.com/2018/04/26/the-beauty-of-unicode-zero-width-characters
    # https://330k.github.io/misc_tools/unicode_steganography.html
    # U+200B ZERO WIDTH SPACE 零宽度空格符       226 128 139  \xe2\x80\x8b
    # U+200C ZERO WIDTH NON-JOINER 零宽度断字符  226 128 140  \xe2\x80\x8c
    # U+200D ZERO WIDTH JOINER 零宽度连字符      226 128 141  \xe2\x80\x8d
    # U+200E LEFT-TO-RIGHT MARK 左至右符         226 128 142  \xe2\x80\x8e
    # U+200F RIGHT-TO-LEFT MARK 右至左符         226 128 143  \xe2\x80\x8f

    # U+202A LEFT-TO-RIGHT EMBEDDING
    # U+202C POP DIRECTIONAL FORMATTING
    # U+202D LEFT-TO-RIGHT OVERRIDE

    # U+2060 Word joiner 连字符                  226 129 160  \xe2\x81\xa0
    # U+2062 INVISIBLE TIMES                    226 129 162
    # U+2063 INVISIBLE SEPARATOR                226 129 163

    # U+FEFF zero-width no-break space 零宽度非断空格符

    zero_width_unicode_bytes_lst = [
        b'\xe2\x80\x8b',
        b'\xe2\x80\x8c',
        b'\xe2\x80\x8d',
        b'\xe2\x80\x8e',
        b'\xe2\x80\x8f',
    ]

    found = False
    for line in fin: # line by line
        print(line)
        for zero_width_bytes in zero_width_unicode_bytes_lst:
            if(zero_width_bytes in line):
                found = True
                break
    fin.close()
    if (found):
        print("[Found] found zero-width unicode characters")
    else:
        print("[Not Found] no zero-width unicode characters found")


if __name__ == '__main__':
    generate_example()
    check()