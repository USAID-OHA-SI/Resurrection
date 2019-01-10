# MUNGE MER DATA
# Project: Resurection
# A.Chafetz, USAID
# Purpose: clean up MER data for use
# Created: 2019-01-10


# MUNGE -------------------------------------------------------------------

  ## MER - beneficiaries
  
  ben <- df_mer %>% 
    filter(((indicator %in% c("HTS_TST","HTS_TST_POS")  &
               standardizeddisaggregate %in% c("Modality/Age/Sex/Result", "Modality/Age Aggregated/Sex/Result")) |
              (indicator == "TX_CURR" & standardizeddisaggregate == "Total Numerator")),
           !mechanismid %in% c("00000", "00001")) 
  
  ben_vmmc <- ben %>% 
    filter(modality == "VMMC") %>% 
    mutate(indicator = paste(indicator, modality, sep = "_"))
  
  ben <- ben %>% 
    bind_rows(., ben_vmmc) %>% 
    group_by(operatingunit, fundingagency, mechanismid, indicator, implementingmechanismname, primepartner) %>% 
    summarize_at(vars(fy2018apr), sum, na.rm = TRUE) %>% 
    ungroup() %>% 
    mutate(type = case_when(indicator == "TX_CURR"                      ~ "TX",
                            indicator %in% c("HTS_TST", "HTS_TST_VMMC") ~ "HTS",
                            TRUE                                        ~ "HTS_POS"),
           indicator = str_remove(indicator, "_POS"),
           program = ifelse(indicator == "TX_CURR", "C&T", "HTS")) %>%
    spread(indicator, fy2018apr, fill = 0) 
  
  ben <- ben %>% 
    mutate(beneficiaries = case_when(type == "TX"  ~ TX_CURR,
                                     TRUE                  ~ HTS_TST - HTS_TST_VMMC), 
           beneficiaries = pmax(beneficiaries, 0)) %>% 
    select(-HTS_TST:-TX_CURR)
  rm(ben_vmmc)
