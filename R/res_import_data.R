# IMPORT DATA
# Project: Resurection
# A.Chafetz, USAID
# Purpose: create unit expenditures
# Created: 2019-01-10


# IMPORT DATASETS ---------------------------------------------------------

#folderpath set in res_RUN

#import data
  
  #ER
  df_er <- read_tsv(file.path(folderpath, "ER_Structured_Dataset_FY18_20181221_v2_1.txt"),
                    col_types = cols(.default = "c" )) %>% 
    rename_all(~str_remove_all(., " |-") %>% tolower()) %>%  
    mutate(fy2018 = as.double(fy2018))
  
  df_er <- df_er %>% 
    rename(expenditures = fy2018,
           mechanismid = mechanism,
           primepartner = primepartnername, 
           implementingmechanismname = mechanismname) %>% 
    rename_official()

  #MER
  df_mer <- read_rds(file.path(folderpath, "MER_Structured_Dataset_OU_IM_FY17-18_20181221_v2_1.rds")) %>% 
    rename_all(~tolower(.)) %>% 
    rename_official(.)
