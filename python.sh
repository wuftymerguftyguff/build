git clone https://github.com/python/cpython.git
cd cpython
git checkout 2.7
apt-get install db
./configure --with-pydebug --enable-shared
make -s -j2

