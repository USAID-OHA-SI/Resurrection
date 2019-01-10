# MUNGE DHA DATA [MWI]
# Project: Resurection
# A.Chafetz, USAID
# Purpose: clean up DHA HTS_POS data
# Created: 2019-01-10


# MUNGE -------------------------------------------------------------------

## DHA - beneficiaries, HTS_POS

df_mwcc <- df_mwcc %>% 
  rename_all(~str_remove_all(.," ")) %>% 
  rename_all(~tolower(.)) %>% 
  rename(primepartner = implementingpartner) %>% 
  mutate(mechanismid = as.character(mechanismid)) %>% 
  select(psnu:fundingagency, primepartner, starts_with("hts_tst_pos_fy"), -ends_with("targets")) %>% 
  gather(indicatorpd, beneficiaries, starts_with("hts_tst_pos")) %>%
  select(-psnu, -indicatorpd) %>% 
  group_by_if(is_character) %>% 
  summarize_at(vars(beneficiaries), sum, na.rm = TRUE) %>% 
  mutate(operatingunit = "Malawi",
         type = "HTS_POS",
         program = "HTS") %>% 
  select(operatingunit, everything())

#merge back onto MEr
ben_mwi <- bind_rows(ben_mwi, df_mwcc)
