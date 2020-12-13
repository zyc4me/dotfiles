#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

void read_txt_line_by_line(const char* path)
{
    FILE* fin = fopen(path, "r");
    if(fin==NULL) {
        fprintf(stderr, "failed to open %s\n", path);
        exit(-1);
    }
    char line[1024];
    void* ret;
    while (true) {
        memset(line, 0, sizeof(line));
        ret = fgets(line, sizeof(line), fin);
        if (ret == NULL) break;
        if(line[strlen(line)-1]=='\n' || line[strlen(line)-1]=='\r') {
            line[strlen(line) - 1] = '\0';
        }
        if (strlen(line)>0) {
            if(line[strlen(line)-1]=='\r' || line[strlen(line)-1]=='\n') {
                line[strlen(line) - 1] = '\0';
            }
        }
        printf("%s\n", line);
    }
    fclose(fin);
}


int main() {
    read_txt_line_by_line("input.txt");
    return 0;
}
