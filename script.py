#!/usr/bin/env python
# load packages
import subprocess

# load scripts
Rscript = "/home/titus/Documents/Practical_Computing_for_Biologists/project/PCfB_testHW.R" # R script
Sscript = "/home/titus/Documents/Practical_Computing_for_Biologists/project/PCfB_testSTRUCTURE.sh" # Shell script to run STRUCTURE

# start R script to test if loci heterozygosity depard from HWE
subprocess.call (["/usr/bin/Rscript", Rscript])
# 2 files created: output_Rscript.txt & output_Rscript_detailed.txt

# read output of R script
outputRscript = "output_Rscript.txt"
outputR = open(outputRscript,"rt")
contentR = outputR.read()
print contentR

# read content of output R script
ElementList = contentR.split('\n')
print "Percentage loci departing from HW =",ElementList[10],"%"# percentage loci departing from HW

# set threshold (set to 50% of loci depart from HWE)
Threshold = float(50.0)
# check if threshold has been exceeded
if float(ElementList[10]) >= Threshold:
    # infrom user threshold has been reached and start Script
    print 'Treshhold passed'
    subprocess.call (["/bin/bash", Sscript])
else:
    # inform uer threshold has not been reached
    print 'Threshold not passed'