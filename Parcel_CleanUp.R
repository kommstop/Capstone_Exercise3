# Set Working Directory
install.packages("dplyr")
install.packages("tidyr")
install.packages("readxl")
library("dplyr")
library("tidyr")
library("readxl")
setwd("C:/Projects/Data Science Course/Parcels/CleanUp")
brevard2017 <- read_excel("C:/Projects/Data Science Course/Parcels/CleanUp/Parcels_2017_BREVARD.xlsx")
df <- brevard2017
#Group PARUSEDESC VACANT RESIDENTIAL and VACANT COMMERCIAL and get the count and mean land value
head(brevard2017)
brevard2017_filter <- filter(brevard2017, brevard2017$PARUSEDESC == "VACANT RESIDENTIAL" | brevard2017$PARUSEDESC == "VACANT COMMERCIAL")
#Getting the mean value of vacant residential and vacant commercial
PARUSEDESC_Count <- brevard2017_filter %>% group_by(brevard2017_filter$PARUSEDESC) %>% summarise(COUNT_PARUSE = n())
PARCEL_LNDVAL <- brevard2017_filter %>% group_by(brevard2017_filter$PARUSEDESC) %>% summarise((avg_LndVAL = mean(brevard2017_filter$LNDVAL, na.rm = TRUE)))
AGG_PARUSE <- cbind(PARUSEDESC_Count, PARCEL_LNDVAL)
#Saving a file to .csv
write.csv(AGG_PARUSE, file = "Brevard2017_PARUSE.csv")




