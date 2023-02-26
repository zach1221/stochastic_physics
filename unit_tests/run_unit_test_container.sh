#!/bin/sh
RES=96
NPX=`expr $RES + 1`
NPY=`expr $RES + 1`
HOME=/home/builder
cd /home/builder/stochastic_physics/unit_tests
if [ ! -f /home/builder/stochastic_physics/unit_tests/build_standalone.sh ];then
  echo "No build script! check build_standalone.sh in container"
  exit 1
fi
/bin/sh -c /home/builder/stochastic_physics/unit_tests/build_standalone.sh
cp -r /tmp/INPUT /home/builder/stochastic_physics/unit_tests/
echo $(ls)
echo $(which sed)
