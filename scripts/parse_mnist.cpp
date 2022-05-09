/*
 * Read mnist image and labels, save as bmp images
 *
 * Modified from https://stackoverflow.com/questions/8286668/how-to-read-mnist-data-in-c
 *
 * Compile:
 *      clang++ parse_mnist.cpp `pkg-config --libs --flags opencv4`
 */

#include <iostream>
#include <fstream>
#include <string>
#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;

// 日常用的PC CPU是Intel处理器，用小端格式
// 把大端数据转换为我们常用的小端数据
static uint32_t swap_endian(uint32_t val)
{
    val = ((val << 8) & 0xFF00FF00) | ((val >> 8) & 0xFF00FF);
    return (val << 16) | (val >> 16);
}

static void read_and_save(const string& mnist_img_path, const string& mnist_label_path, const string& save_dir)
{
    // 以二进制格式读取mnist数据库中的图像文件和标签文件
    ifstream mnist_image(mnist_img_path, ios::in | ios::binary);
    ifstream mnist_label(mnist_label_path, ios::in | ios::binary);
    if (mnist_image.is_open() == false)
    {
        cout << "open mnist image file error!" << endl;
        return;
    }
    if (mnist_label.is_open() == false)
    {
        cout << "open mnist label file error!" << endl;
        return;
    }

    uint32_t magic; // 文件中的魔术数(magic number)
    uint32_t num_items;// mnist图像集文件中的图像数目
    uint32_t num_label;// mnist标签集文件中的标签数目
    uint32_t rows;// 图像的行数
    uint32_t cols;// 图像的列数
    // 读魔术数
    mnist_image.read(reinterpret_cast<char*>(&magic), 4);
    magic = swap_endian(magic);
    if (magic != 2051)
    {
        cout << "this is not the mnist image file" << endl;
        return;
    }
    mnist_label.read(reinterpret_cast<char*>(&magic), 4);
    magic = swap_endian(magic);
    if (magic != 2049)
    {
        cout << "this is not the mnist label file" << endl;
        return;
    }
    // 读图像/标签数
    mnist_image.read(reinterpret_cast<char*>(&num_items), 4);
    num_items = swap_endian(num_items);
    mnist_label.read(reinterpret_cast<char*>(&num_label), 4);
    num_label = swap_endian(num_label);
    // 判断两种标签数是否相等
    if (num_items != num_label)
    {
        cout << "the image file and label file are not a pair" << endl;
    }
    // 读图像行数、列数
    mnist_image.read(reinterpret_cast<char*>(&rows), 4);
    rows = swap_endian(rows);
    mnist_image.read(reinterpret_cast<char*>(&cols), 4);
    cols = swap_endian(cols);

    // 读取图像
    char* pixels = new char[rows * cols];
    Mat image(rows, cols, CV_8UC1, (uchar*)pixels);
    char label;
    char save_pth[256];
    int size = rows*cols;
    for (int i = 0; i != num_items; i++)
    {
        mnist_image.read(pixels, size);
        mnist_label.read(&label, 1);
        sprintf(save_pth, "%s/%d_%04d.bmp", save_dir.c_str(), (int)label, i);
        imwrite(save_pth, image);
    }

    delete[] pixels;
}

int main()
{
    // 注意：请确保原始mnist文件存在、路径正确
    // 并且确保保存的目录已经存在
    string mnist_dir = "/home/zz/work/LeNet-5/mnist";
    string train_image_path = mnist_dir + "/train-images-idx3-ubyte";
    string train_label_path = mnist_dir + "/train-labels-idx1-ubyte";
    string test_image_path = mnist_dir + "/t10k-images-idx3-ubyte";
    string test_label_path = mnist_dir + "/t10k-labels-idx1-ubyte";

    string train_save_dir = "/media/zz/data/mnist/train";
    string test_save_dir = "/media/zz/data/mnist/test";

    read_and_save(test_image_path, test_label_path, test_save_dir);
    read_and_save(train_image_path, train_label_path, train_save_dir);

    return 0;
}
