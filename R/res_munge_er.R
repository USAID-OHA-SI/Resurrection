# MUNGE ER DATA
# Project: Resurection
# A.Chafetz, USAID
# Purpose: clean up ER data for use
# Created: 2019-01-10


# MUNGE -------------------------------------------------------------------

## ER - expenditures

df_er <- df_er %>% 
  rename(expenditures = fy2018,
         mechanismid = mechanism,
         primepartner = primepartnername, 
         implementingmechanismname = mechanismname) %>% 
  rename_official()

exp <- df_er %>% 
  filter(program %in% c("HTS", "C&T")) %>% 
  group_by(program, operatingunit, fundingagency, mechanismid, implementingmechanismname, primepartner) %>% 
  summarize_at(vars(expenditures), sum, na.rm = TRUE) %>% 
  ungroup()