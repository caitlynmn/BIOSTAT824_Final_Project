# Script Name: Data_Compile.R
# Purpose: Compile Metabric clinical and zscore expression data files

library(tidyverse)

data1 = read.csv("Zscores/ABI1-EWSR1.csv")
data2 = read.csv("Zscores/EXT1-MLLT10.csv")
data3 = read.csv("Zscores/EXOSC6-SFRP4.csv")
data4 = read.csv("Zscores/SGK1-ZRSR2.csv")

clinical_data = read.csv("brca_metabric_clinical_data.csv")
names(clinical_data) = gsub("\\.", "_", names(clinical_data))
colnames(clinical_data)[3] = "SAMPLE_ID"
df = left_join(clinical_data, data1, by = "SAMPLE_ID")
df = left_join(df, data2, by = "SAMPLE_ID")
df = left_join(df, data3, by = "SAMPLE_ID")
df = left_join(df, data4, by = "SAMPLE_ID")

write.csv(df, "compiled_metabric_data.csv", row.names=FALSE)
