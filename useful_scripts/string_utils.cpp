#include <vector>
#include <string>
#include <ctype.h>

/// @brief split a string with specified delimeter string
/// @param str the string to be splited
/// @param delim the delimeter string
/// @return the splited result
std::vector<std::string> split_string(const std::string& str, const std::string& delim)
{
    std::vector<std::string> tokens;
    size_t prev = 0, pos = 0;
    do
    {
        pos = str.find(delim, prev);
        if (pos == std::string::npos) pos = str.length();
        std::string token = str.substr(prev, pos-prev);
        if (!token.empty()) tokens.push_back(token);
        prev = pos + delim.length();
    }
    while (pos < str.length() && prev < str.length());
    return tokens;
}


/// @brief split a string with (one or more) spaces.
/// @return the splited result
std::vector<std::string> split_string(const std::string& s)
{
    std::vector<std::string> ret;
    typedef std::string::size_type string_size;
    string_size i = 0;
    while (i!=s.size()) {
        // ignore prefix spaces
        while (i!=s.size() && isspace(s[i])) {
            i++;
        }

        // find next word's end position
        string_size j = i;
        while (j!=s.size() && !isspace(s[j])) {
            j++;
        }

        // if there are non-spaces found
        if (i!=j) {
            ret.push_back(s.substr(i, j-i));
            i = j;
        }
    }

    return ret;
}

/// @brief determine if a string starts with a specified string
/// @param str The string to be inspected
/// @param start The target string to be searched
bool string_startswith(const std::string& str, const std::string& start)
{
    int pos = str.find(start);
    return (pos!=-1);
}


/// @brief determine if a string ends with a specified extension
/// @param str The string to be inspected
/// @param ext The target string to be searched
bool string_endswith(const std::string& str, const std::string& ext)
{
    int pos = str.rfind(ext);
    return (pos!=-1);
}

//----------------------------------------------------------------------
// Testing / Examples
//----------------------------------------------------------------------
#include <iostream>

void test_split_string()
{
    std::string a = "hello  world! 233 Rust C++\n";
    std::vector<std::string> res = split_string(a);
    for (size_t i=0; i<res.size(); i++) {
        std::cout << res[i] << ", ";
    }
    std::cout << std::endl;
}

void test_string_endswith()
{
    std::string path = "123/45.6/7890.jpg";
    if (string_endswith(path, "jpg"))
    {
        std::cout << "yes" << std::endl;
    }
    else
    {
        std::cout << "no" << std::endl;
    }
}

int main()
{
	test_split_string();
	test_string_endswith();

	return 0;
}
