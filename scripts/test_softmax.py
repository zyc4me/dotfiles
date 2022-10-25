#!/usr/bin/env python
#coding: utf-8

import torch
import torch.nn as nn
import numpy as np
import torch_helper


# input = torch.randn(2, 3)
# print(input)
def test_softmax_dim0_1d():
    print("\n=== softmax(dim)=0 for 1-d input")
    torch_helper.setup_seed(200)

    m = nn.Softmax(dim=0)
    input = torch.randn(6)
    output = m(input)
    print(input)
    print(output)

def test_softmax_dim0_2d():
    print("\n=== softmax(dim)=0 for 2-d input")
    torch_helper.setup_seed(200)
    m = nn.Softmax(dim=1)

    #input = torch.randn(2, 3)
    input = torch.tensor([
        [-0.1385, -0.1138,  0.4599],
        [-0.2188, -0.3853,  0.6233]]
    )
    output = m(input)
    print(input)
    print(output)

def test_softmax_dim0_3d():
    print("\n=== softmax(dim)=0 for 3-d input")
    torch_helper.setup_seed(200)
    m = nn.Softmax(dim=0)

    input = torch.randn(2, 3, 4)
    output = m(input)
    print(input)
    print(output)


# dim=0, input=1d # D1A0
def test_softmax_D1A0(msg):
    print(msg)
    torch_helper.setup_seed(200)
    m = nn.Softmax(dim=0)
    input = torch.randn(3)
    output = m(input)
    print(input)
    print(output)


# dim=0, input=1d # D2A0
def test_softmax_D2A0(msg):
    print(msg)
    torch_helper.setup_seed(200)
    m = nn.Softmax(dim=0)
    #input = torch.randn(2, 1, 2)
    input = torch.randn(3, 2)
    output = m(input)
    print(input)
    print(output)


# dim=0, input=3d # D3A0
def test_softmax_D3A0(msg):
    print(msg)
    torch_helper.setup_seed(200)
    m = nn.Softmax(dim=0)
    #input = torch.randn(2, 2, 2)
    #input = torch.randn(2, 2, 3)
    #input = torch.randn(2, 1, 4)
    input = torch.randn(2, 3, 4)
    output = m(input)
    print(input)
    print(output)

# dim=1, input=3d # D3A1
def test_softmax_D3A1(msg):
    print(msg)
    torch_helper.setup_seed(200)
    m = nn.Softmax(dim=1)
    input = torch.randn(2, 3, 4)
    output = m(input)
    print(input)
    print(output)

# dim=2, input=3d # D3A2
def test_softmax_D3A2(msg):
    print(msg)
    torch_helper.setup_seed(200)
    m = nn.Softmax(dim=2)
    input = torch.randn(2, 3, 4)
    output = m(input)
    print(input)
    print(output)


if __name__ == '__main__':
    # test_softmax_dim0_1d()
    # test_softmax_dim0_2d()

    # dim=0, input=1d
    # dim=0, input=2d
    # dim=0, input=3d # D3A0

    # dim=1, input=1d
    # dim=1, input=2d
    # dim=1, input=3d # D3A1

    # dim=2, input=1d
    # dim=2, input=2d
    # dim=2, input=3d # D3A2

    #test_softmax_D1A0("=== D1A0")
    #test_softmax_D2A0("=== D2A0")
    test_softmax_D3A0("=== D3A0")

    # test_softmax_D3A1("=== D3A1")
    # test_softmax_D3A2("=== D3A2")
