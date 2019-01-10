# MUNGE MER DATA
# Project: Resurection
# A.Chafetz, USAID
# Purpose: clean up MER data for use
# Created: 2019-01-10


# MUNGE -------------------------------------------------------------------

  ## MER - beneficiaries
  
  ben_mwi <- df_mer %>% 
    filter(operatingunit == "Malawi",
           indicator %in% c("HTS_TST", "TX_CURR"), 
           standardizeddisaggregate == "Total Numerator",
           !mechanismid %in% c("00000", "00001")) 
  
  
  ben_mwi <- ben_mwi %>% 
    group_by(operatingunit, fundingagency, mechanismid, indicator, implementingmechanismname, primepartner) %>% 
    summarize_at(vars(fy2018apr), sum, na.rm = TRUE) %>% 
    ungroup() %>% 
    mutate(type = case_when(indicator == "TX_CURR"                      ~ "TX",
                            indicator %in% c("HTS_TST", "HTS_TST_VMMC") ~ "HTS",
                            TRUE                                        ~ "HTS_POS"),
           indicator = str_remove(indicator, "_POS"),
           program = ifelse(indicator == "TX_CURR", "C&T", "HTS")) %>%
    spread(indicator, fy2018apr, fill = 0) 
  
  ben_mwi <- ben_mwi %>% 
    mutate(beneficiaries = case_when(type == "TX"  ~ TX_CURR,
                                     TRUE          ~ HTS_TST), 
           beneficiaries = pmax(beneficiaries, 0)) %>% 
    select(-HTS_TST:-TX_CURR)
