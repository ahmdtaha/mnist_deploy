# mnist_deploy
This C++ code loads a mnist trained model using Caffe. It uses the model to classify digits inside png images.

# Compiling
To build this code, you need to have **Caffe, CUDA and OpenCV** installed on your device. If you are going to build this code on your device, make sure to update the makefile with the correct paths. 
The makefile build the classification code for CPU usage. You will need to change that to use GPU
Once you make the classification.x file. You need to update the shared library path using your Caffe installation path
> export LD_LIBRARY_PATH=$LD_LIBRARYPATH:**$CAFFE_ROOT/build/lib**

# Usage

classification.x takes the name of image as argument to classify. 
> ./classification.x ./samples/img_1_2.png

This code is based on information from the following links
[Deploy Trained Network](https://github.com/BVLC/caffe/wiki/Using-a-Trained-Network:-Deploy)

[Cpp Classification](https://github.com/BVLC/caffe/tree/master/examples/cpp_classification)

The output should look like this:
> Image./samples/img_1_2.png  Classified as >> 1 one
