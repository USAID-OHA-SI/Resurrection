# SETUP HTS_TST VIZ [MWI]
# Project: Resurection
# A.Chafetz, USAID
# Purpose: prep data for vizualization
# Created: 2019-01-10

ue_viz <-  ue %>%
  filter(type == "TX") %>% 
  arrange(ue) %>%
  mutate(name = as_factor(name)) %>%
  gather(type, val, c("expenditures", "beneficiaries", "ue")) %>%
  mutate(color = case_when(type == "ue" ~ "#2166AC",
                           TRUE         ~ "#67A9CF"),
         type = case_when(type == "beneficiaries" ~ "Beneficiaries (TX)",
                          type == "expenditures"  ~ "Expenditure (C&T Program, USD)",
                          TRUE                    ~ "Unit Expenditure (USD)"))

viz_title <- "Malawi FY18 PEPFAR Expenditures per Patient Currently on Treatment"
#viz_subtitle <- "The unit expenditure is calculated by looking at the total expenditures reported under the C&T program area divided by the HTS beneficiaries."
viz_caption <- "Source: MSD (FY18Q4c) + ER Structured Dataset (FY18c) \n Note: TX Beneficiaries = TX_CURR"

savename <- "mwi_tx.png"