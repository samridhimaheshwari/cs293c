# Clone SSL
``` sh
# clone the target
git clone git://sourceware.org/git/binutils-gdb.git

cd openssl

# compile all ssl tools
./configure 
export CC=afl-gcc
make -j$(nproc) # use maximum proc available
```

## Build and running AFL

``` 
# create input folder
mkdir input
cp /bin/ps input/ #putting random values in input  
mkdir output
afl-fuzz -i input -o output -- ./openssl/ssl @@
```

## Running AFLSmart
afl-fuzz -h -i input -o output -w peach -g input_model_file ./openssl/ssl @@
