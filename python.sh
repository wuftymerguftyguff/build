git clone https://github.com/python/cpython.git
cd cpython
git checkout 2.7
sudo apt-get install libdb-dev
mkdir built
PRE=$(pwd)/built
CFFLAGS="--prefix=$PRE --enable-shared --with-ensurepip=no --enable-unicode=ucs4"
MYFLAGS="--prefix=$PRE --with-pydebug --with-dbmliborder=bdb:gdbm --enable-shared --enable-ipv6"
./configure $CFFLAGS
make -s -j2
make install
cd built
ls -lrt
cd bin
export PATH=$PRE/bin:$PATH
export LD_LIBRARY_PATH=$PRE/lib:$LD_LIBRARY_PATH
which python
python -V
python -c "import dbm"
