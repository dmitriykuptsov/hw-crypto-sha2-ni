OS:=$(shell uname)
CXX:=g++
CXX_STANDARD:=-std=c++17
LINKER:=-shared
DFLAGS:=-mavx2 -msha
CXX_FLAGS=-Wall -Wextra -O3 -pedantic
PYTHON_INCLUDE=/usr/include/python3.9/

default:
	$(CXX) $(CXX_STANDARD) $(LINKER) -Wl,-soname,shalib.so -o shalib.so shani.c $(DFLAGS) $(CXX_FLAGS) -fPIC -I $(PYTHON_INCLUDE)

clean:
	@rm shalib.so
