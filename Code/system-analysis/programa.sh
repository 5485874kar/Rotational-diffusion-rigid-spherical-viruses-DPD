#!/bin/bash

#. configuraciones.sh

echo "Bash version ${BASH_VERSION}..."
for i in {1..10001..1}
  do 
  let val0=$i-1
  let val1=$i
find ./ -name '*.f90' -exec sed -i 's/'$val0'e''/'$val1'e''/g' {} \;
gfortran firts.f90
./a.out  
gfortran second.f90
./a.out
echo "$val0 $val1"
done

cat *velocidad-angular.data > velocidad-angular-all-frames.data
gfortran third.f90
./a.out
gfortran fourth.f90
./a.out

