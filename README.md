# PBfB_Pop_structure

## Final project PBfB
Everything Titus Hielkema and I used for our end-project of the Practical Bioinformatics for Biologists (PBfB) 2018 course at the Rijksuniversiteit Groningen. Guided by M.C. Fontaine 

## Description
This script analyses data files containing microsatallite data. It tests and returns which loci and the percentage of loci depart from the Hardy-Weinberg Wquilibrium (HWE). If threshold is reached (on default: 50% of loci departing from HWE) it will analyse the data for population structure and returns images for ...

## Data input
.xlsx file containing sample ID, sample site & microsatalite date (alleles seperated using '/' for each locus).

## Scripts
1. Python script: Main script
2. R script: Test if loci depart from HWE
3. Shell script: Analyse population structure using STRUCTURE software
4. 

### Python script
Main script that uses R and Shell scripts. Depending on the output of the R script and the threshold (default: 50%) it will run the Shell script or quit.

### R script
Analyse the heterosigosy of all loci and test if locy depart from HWE. It returns 2 files. output_Rscript.txt contains mean P vallue, total number of loci, loci significant and not significant departing from HWE and the percentage departing loci of the total. output_Rscript_detailed.txt contains output of the statistical test (hw.test) for each locus.

### Shell script
