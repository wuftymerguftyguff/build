git clone https://github.com/python/cpython.git
cd cpython
git checkout 2.7
sudo apt-get install libdb-dev
./configure --with-pydebug --with-dbmliborder=bdb:gdbm --enable-shared --enable-ipv6
make -s -j2

