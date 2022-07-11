// MemInfo_Console_Testbed.cpp
// by Zhuo Zhang (zz9555@arcsoft.com.cn)
// 2022.07.11
//

#include <stdio.h>
#include <string>
#include <vector>
#include <fstream>
#include <iostream>
#include <unordered_map>

static
std::vector<std::string> get_text_file_lines(const std::string& filename)
{
    std::vector<std::string> v;
    std::ifstream in(filename);
    if (in.fail())
    {
        fprintf(stderr, "%s: failed to open file %s\n", __FUNCTION__, filename.c_str());
        return v;
    }
    std::string line;
    while (getline(in, line))
    {
        v.emplace_back(line);
        //printf("%s\n", line.c_str());
    }
    return v;
}

static
void parse_line(const std::string& line, std::unordered_map<std::string, int>& hash)
{
    int pos1 = -1; // ':'
    int pos2 = -1; // :后面，第一个数字的位置，在原始字符串里的位置
    int pos3 = -1; // 最后一个数字的位置
    for (int i = 0; i < line.length(); i++)
    {
        if (line[i] == ':')
        {
            pos1 = i;
            break;
        }
    }
    for (int i = pos1; i < line.length(); i++)
    {
        if (isdigit(line[i]))
        {
            pos2 = i;
            break;
        }
    }
    for (int i = pos2; i < line.length(); i++)
    {
        if (!isdigit(line[i]))
        {
            pos3 = i;
            break;
        }
    }

    std::string s1 = line.substr(0, pos1);
    std::string s2 = line.substr(pos2, pos3);

    //std::cout << s1 << ", " << s2 << std::endl;
}


int main()
{
    printf("Memory Info:\n");
#if __linux__ || __ANDROID__
    const char* file_path = "/proc/meminfo";
    std::vector<std::string> lines = get_text_file_lines(file_path);
    std::unordered_map<std::string, int> table;

    for (int i = 0; i < lines.size(); i++)
    {
        parse_line(lines[i], table);
    }

    std::vector<std::string> keys = { "MemTotal", "MemAvailable" };

    for (int i = 0; i < keys.size(); i++)
    {
        std::cout << keys[i] << ": " << table[keys[i]] << std::endl;
    }
#else
    printf("only support Linux and Android\n");
#endif

    return 0;
}

