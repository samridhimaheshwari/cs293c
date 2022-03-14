# Clone binutils project
``` sh
# clone the target
git clone git://sourceware.org/git/binutils-gdb.git
```

``` sh
# overwrite CC and CXX env variable
export CC=$(pwd)/honggfuzz/hfuzz_cc/hfuzz-clang
export CXX=$(pwd)/honggfuzz/hfuzz_cc/hfuzz-clang++

cd binutils-gdb

# compile all binutils tools
./configure 
make -j$(nproc) # use maximum proc available

# verify your target is compiled with honggfuzz
nm ./binutils/readelf | grep hfuzz 
```

## Run honggfuzz

``` sh
# create input folder
mkdir input

# run honggfuzz
../honggfuzz/honggfuzz -i input -- ./binutils/readelf --file-header ___FILE___
```
