#!/bin/bash
RES=96
NPX=`expr $RES + 1`
NPY=`expr $RES + 1`
HOME=/home/builder
cd /home/builder/stochastic_physics/unit_tests
ESMFMKFILE=${ESMFMKFILE:-/home/builder/opt/lib/esmf.mk}
export PATH=/home/builder/opt/bin:$PATH
export LD_LIBRARY_PATH=/home/builder/opt/lib
export LD_LIBRARY_PATH=/home/builder/opt/lib64
export CMAKE_PREFIX_PATH=/home/builder/opt
export FC=mpifort
export CC=mpicc
export CXX=mpicxx
if [ ! -f /home/builder/stochastic_physics/unit_tests/build_standalone.sh ];then
  echo "No build script! check build_standalone.sh in container"
  exit 1
fi
/bin/sh -c /home/builder/stochastic_physics/unit_tests/build_standalone.sh
cp -r /tmp/INPUT /home/builder/stochastic_physics/unit_tests/
echo $(ls)
echo $(ls *.x)
mkdir -p RESTART

# test 3 different domain decompositions and compare to baseline
#layout 1x4
#cp input.nml.template input.nml
sed -i -e "s/LOX/1/g" input.nml
sed -i -e "s/LOY/4/g" input.nml
sed -i -e "s/NPX/$NPX/g" input.nml
sed -i -e "s/NPY/$NPY/g" input.nml
sed -i -e "s/RES/$RES/g" input.nml
sed -i -e "s/_STOCHINI_/.false./g" input.nml
#export OMP_NUM_THREADS=2
#module list
mpirun -np 6 /home/builder/stochastic_physics/unit_tests/standalone_stochy.x
mkdir stochy_out
#mv workg* stochy_out
