#!/bin/bash
cd src
export CFLAGS=${CFLAGS}" -isystem $PREFIX/include/eigen3"
make -j${NUM_CPUS} libnnp libnnpif libnnptrain pynnp
mkdir -p ${PREFIX}/include ${PREFIX}/lib ${PREFIX}/bin ${PREFIX}/python${PY_VER}/site-packages
mv ${SRC_DIR}/lib/pynnp* ${SP_DIR}
cp ${SRC_DIR}/lib/* ${PREFIX}/lib
cp ${SRC_DIR}/include/* ${PREFIX}/include
export CFLAG=${CFLAGS}" -std=c++11"
make -j${NUM_CPUS} all-app
cp ${SRC_DIR}/bin/* ${PREFIX}/bin
