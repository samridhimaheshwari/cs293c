# Clone binutils project
``` sh
# clone the target
git clone git://sourceware.org/git/binutils-gdb.git

cd binutils-gdb

# compile all binutils tools
./configure 
make -j$(nproc) # use maximum proc available
```

## Build using LibFuzzer flags

``` sh
# create input folder
clang++ /input/seeds/* -fsanitize=address,fuzzer -jobs = 8 target.cpp
./a.out


```
