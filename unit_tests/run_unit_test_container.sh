#!/bin/sh
RES=96
NPX=`expr $RES + 1`
NPY=`expr $RES + 1`
HOME=/home/builder
cd $HOME/stochastic_physics/unit_tests
if [ ! -f build_standalone.sh ];then
  echo "No build script! check build_standalone.sh in container"
  exit 1
fi
/bin/sh -c build_standalone.sh
cp /tmp/INPUT .
echo $(ls -l)
