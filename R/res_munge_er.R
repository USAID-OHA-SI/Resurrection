# MUNGE ER DATA
# Project: Resurection
# A.Chafetz, USAID
# Purpose: clean up ER data for use
# Created: 2019-01-10


# MUNGE -------------------------------------------------------------------

## ER - expenditures

exp <- df_er %>% 
  filter(program %in% c("HTS", "C&T"),
         !subobjectclass %in% c("Health- non pharmaceutical", "Pharmaceutical")) %>% 
  group_by(program, operatingunit, fundingagency, mechanismid, implementingmechanismname, primepartner) %>% 
  summarize_at(vars(expenditures), sum, na.rm = TRUE) %>% 
  ungroup()