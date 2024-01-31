OS:=$(shell uname)
CXX:=g++
CXX_STANDARD:=-std=c++17
LINKER:=-shared
DFLAGS:=-mavx2 -msha
CXX_FLAGS=-Wall -Wextra -O3 -pedantic
PYTHON_INCLUDE=/usr/include/python3.9/

sha:
	$(CXX) $(CXX_STANDARD) $(LINKER) -Wl,--no-undefined,-soname,shalib.so -o shalib.so shani.c $(DFLAGS) $(CXX_FLAGS) -fPIC -I $(PYTHON_INCLUDE)
hmac:
	$(CXX) $(CXX_STANDARD) $(LINKER) -Wl,--no-undefined,-soname,hmaclib.so -I./ -L./ -o hmaclib.so shani.c 	sha256hmac.c $(DFLAGS) $(CXX_FLAGS) -fPIC -I $(PYTHON_INCLUDE)
clean:
	@rm shalib.so
	@rm hmaclib.so
