# RUN
# Project: Resurection
# A.Chafetz, USAID
# Purpose: 
# Created: 2019-01-10

# DEPENDENCIES ------------------------------------------------------------

library(tidyverse)
library(ICPIutilities)
library(readxl)
library(scales)

# IMPORT ------------------------------------------------------------------

  #set folder path for data
    folderpath <- "~/ICPI/Data/"
  
  #import
    source("R/res_import_data.R")
  

# MUNGE -------------------------------------------------------------------

  #MER
    source("R/res_munge_mer.R")
    
  #ER
    source("R/res_munge_er.R")
    
  #Create UE
    source("R/res_gen_ue.R")
    
  #export
    write_csv(ue, "Output/FY18ExpenditureUEs_HTS_TX.csv")
