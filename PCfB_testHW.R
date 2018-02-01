rm(list = ls()) # remove global environment
setwd("/home/titus/Documents/Practical_Computing_for_Biologists/project/") # set working directory

# Load packages
library(xlsx)
library(adegenet)
library(pegas)
print("All packages loaded succesfully")

# load data in variable d
d <- read.xlsx("shark_ms_ordered.xlsx",sheetName=2,1)

# analyse data and store in a genind object (contains several types of data)
# later we will extract the number of alleles per locus
d.genind <- df2genind(d[,c(3:16)], sep="/", ind.names = d$ID,
                      pop = d$LOC, loc.names = names(d)[c(3:16)], NA.char = "-9/-9",
                      type='codom')

## Departure from HWE
HW.TEST <- hw.test(d.genind, B=1000) # Test of HWE, with 1000 permutations
# mare summary of HW.TEST to later extract mean P value
HW.SUMMARY <- summary(HW.TEST)

# convert to data frame
HW.TEST <- as.data.frame(HW.TEST)

# calculate percentage of loci departing from HWE
Percentage <- sum(HW.TEST[,4] < 0.05) / length(d.genind$loc.n.all) *100

# create output variable for output file
output <- as.matrix(cbind("RESULTS hw.test:","Pr.exact mean:",
  HW.SUMMARY[4,4],"Total number of loci:",length(d.genind$loc.n.all),
  "Number of loci departing from HW:",sum(HW.TEST[,4] < 0.05),
  "Number of loci NS departing from HW:",sum(HW.TEST[,4] > 0.05),
  "Percentage loci departing from HW:",Percentage))

# create output_detailed for output_detailed file]
output_detailed <- HW.TEST

# create output files and inform user
write(output, file = "output_Rscript.txt",append=FALSE)
write.table(output_detailed, file = "output_Rscript_detailed.txt",sep='\t',append=FALSE) # tab delimited
# WARNING: header in output_Rscript_detailed.txt not alligned with their column. Move one column to its right!
print('Output files written and saved in current directory:')
print('output_Rscript.txt & output_Rscript_detailed.txt.')