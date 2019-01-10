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
  
  #combine data
    ue <-  full_join(exp, ben) %>% 
      select(program, type, everything())
    
  #Create UE
    source("R/res_gen_ue.R")
    
  #export
    write_csv(ue, "Output/FY18ExpenditureUEs_HTS_TX.csv")
    

# MALAWI ------------------------------------------------------------------

  #import additional data
    source("R/res_mwi_import_addtl_data.R")
  
  #munge MER & DHA
    source("R/res_mwi_munge_mer.R")
    source("R/res_mwi_munge_dha.R")
  
  #combine data
    ue <- exp %>% 
      filter(operatingunit == "Malawi") %>% 
      full_join(., ben_mwi) %>% 
      select(program, type, everything())
    
  #Create UE
    source("R/res_gen_ue.R")
  

# MALAWI VIZ --------------------------------------------------------------

  #add common names to mechs for viz ease
    source("R/res_map_names.R")
  
  #graph HTS
    source("R/res_mwi_viz_hts_setup.R")
    source("R/res_mwi_viz.R")
    htsviz <- plot
    
  #graph HTS_POS
    source("R/res_mwi_viz_hts_pos_setup.R")
    source("R/res_mwi_viz.R")
    htsposviz <- plot
    
  #graph TX_CURR
    source("R/res_mwi_viz_tx_setup.R")
    source("R/res_mwi_viz.R")
    txviz <- plot
  
    gridExtra::grid.arrange(htsviz, htsposviz, txviz, ncol = 1)

    