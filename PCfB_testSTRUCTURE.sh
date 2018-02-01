#!/bin/bash

#3 is the number of replicates at each value of K.
for k in {1..5}; do for rep in {1..3};
do 
structure -K ${k} -o outfile_k${k}_rep${rep}
done
done
