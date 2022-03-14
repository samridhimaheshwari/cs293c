# Clone SSL specific version
``` sh
# clone the target
git clone https://github.com/openssl/openssl.git OpenSSL_1_1_0c

cd openssl

# compile target
./configure 
make -j$(nproc) # use maximum proc available
```

## Build using LibFuzzer flags
``` sh
# create input folder
mkdir /input/seeds
cp /bin/ps /input/seeds

#run fuzzer on target.cc which has LLVMFuzzerTestOneInput function calling the libraries functions
clang++ /input/seeds/* -fsanitize=address,fuzzer -jobs = 8 target.cc
./a.out


```
