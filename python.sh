git clone https://github.com/python/cpython.git
cd cpython
git checkout 2.7
./configure --with-pydebug --enable-shared
make -s -j2

