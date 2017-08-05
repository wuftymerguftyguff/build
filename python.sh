pwd
git clone https://github.com/python/cpython.git
git clone https://github.com/lsh123/xmlsec.git

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
cd ..
tar -cvzf $TRAVIS_BUILD_DIR/python.tgz *
ls -l $TRAVIS_BUILD_DIR/python.tgz
tar -tvzf $TRAVIS_BUILD_DIR/python.tgz
md5sum $TRAVIS_BUILD_DIR/python.tgz

cd /home/travis/build/wuftymerguftyguff 
pwd
mkdir xmlsec-built
#sudo apt-get install libxml2 libxml2-dev libxslt1-dev
sudo apt-get install libxml2
sudo apt-get install libxml2-dev
sudo apt-get install libxslt-dev
sudo apt-get install openssl
cd xmlsec
PRE=$(pwd)/xmlsec-built
CFFLAGS="--prefix=$PRE"
./configure $CFFLAGS
make
make install

