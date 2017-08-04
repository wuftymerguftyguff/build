git clone https://github.com/python/cpython.git
cd cpython
git checkout 2.7
sudo apt-get install libdb-dev
mkdir built
PRE=$(pwd)/built
./configure --prefix=$PRE --with-pydebug --with-dbmliborder=bdb:gdbm --enable-shared --enable-ipv6
make -s -j2
make install
cd built
ls -lrt
cd bin
export PATH=$PRE/built/bin:$PATH
export LD_LIBRARY_PATH=$PRE/built/lib:$LD_LIBRARY_PATH
which python
python -V
python -c "import bdb"
