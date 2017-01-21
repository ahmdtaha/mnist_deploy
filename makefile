CXX=g++

# You need to change this path according to your cuda installation
CUDA_PATH=/media/ahmedtaha-caffe/00d19c56-2dca-4476-a542-121d82628b1b/usr/local/cuda

# You need to change this path according to your caffe installation
CAFF_PATH=/home/ahmedtaha-caffe/Documents/caffe


CFLAGS=-c -Wall -std=c++0x -g3 -Ofast -msse2  -I. -I$(CUDA_PATH)/include -I$(CAFF_PATH)/include/ -I$(CAFF_PATH)/include/
LDFLAGS= -L/usr/local/lib -L/usr/lib/x86_64-linux-gnu -L$(CUDA_PATH)/lib64 -L$(CUDA_PATH)/lib -lcudart -lcublas -lcurand -lglog -lgflags -lprotobuf -lleveldb -lsnappy -llmdb -lboost_system -lhdf5_hl -lhdf5 -lm -lopencv_core -lopencv_highgui -lopencv_imgproc -lboost_thread -lstdc++  -lcblas -latlas -L$(CAFF_PATH)/build/lib/ -lcaffe

# You need to change this flag if you want to use GPU
DEFINE= -D USE_OPENCV -D CPU_ONLY

SOURCES=${wildcard classification.cpp }
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=classification.x

all:  $(SOURCES) $(EXECUTABLE)


clean:
	rm -f *.o
	rm -f $(EXECUTABLE)
	find ./ -name \*.o  -delete

$(EXECUTABLE): $(OBJECTS)
	@echo 'Linking'
	$(CXX) $(OBJECTS) $(LDFLAGS) -o $@

.cpp.o:
	@echo 'Compiling'
	$(CXX) $(DEFINE) $(CFLAGS) $< -o $@