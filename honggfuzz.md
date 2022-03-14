# Clone SSL
``` sh
# clone the target
git clone https://github.com/openssl/openssl.git OpenSSL_1_1_0c
```

``` sh
# overwrite CC and CXX env variable
export CC=$(pwd)/honggfuzz/hfuzz_cc/hfuzz-clang
export CXX=$(pwd)/honggfuzz/hfuzz_cc/hfuzz-clang++

cd openssl

# compile all binutils tools
./configure 
make -j$(nproc) # use maximum proc available

## Run honggfuzz

mkdir input
../honggfuzz/honggfuzz -i input -- ./openssl/ssl --file-header ___FILE___
