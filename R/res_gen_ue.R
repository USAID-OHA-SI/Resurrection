# CREATE UE
# Project: Resurection
# A.Chafetz, USAID
# Purpose: create UE from MER and ER data
# Created: 2019-01-10


# MUNGE -------------------------------------------------------------------

  ## Combine MER and ER to create UE
  ue <- ben %>% 
    full_join(exp, .) %>% 
    select(program, type, everything())
  
  #where there are HTS exp and no ben, need to duplicate so have lines for both HTS and HTS_POS
  ue_hts_pos_m <- ue %>% 
    filter(is.na(type), program == "HTS") %>% 
    mutate(type = "HTS_POS")
  
  #adjust for exp with no ben
  ue <- ue %>% 
    mutate(type = case_when((is.na(type) & program == "HTS") ~ "HTS",
                            (is.na(type) & program == "C&T") ~ "TX",
                            TRUE                             ~ type)) %>% 
    bind_rows(ue_hts_pos_m)
  
  rm(ue_hts_pos_m)
  
  #create unit expenditure
  ue <- ue %>% 
    mutate(ue = round(expenditures / beneficiaries, 2),
           ue = ifelse(is.infinite(ue), 0, ue))  %>% 
    filter_at(vars(expenditures, beneficiaries), all_vars(.!=0 | !is.na(.))) 