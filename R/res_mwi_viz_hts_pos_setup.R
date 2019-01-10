# SETUP HTS_TST VIZ [MWI]
# Project: Resurection
# A.Chafetz, USAID
# Purpose: prep data for vizualization
# Created: 2019-01-10

ue_viz <-  ue %>%
  filter(type == "HTS_POS") %>% 
  arrange(ue) %>%
  mutate(name = as_factor(name)) %>%
  gather(type, val, c("expenditures", "beneficiaries", "ue")) %>%
  mutate(color = case_when(type == "ue" ~ "#2166AC",
                           TRUE         ~ "#67A9CF"),
         type = case_when(type == "beneficiaries" ~ "Beneficiaries (HTS_TST_POS)",
                          type == "expenditures"  ~ "Expenditure (HTS Program, USD)",
                          TRUE                    ~ "Unit Expenditure (USD)"))

viz_title <- "Malawi FY18 PEPFAR Expenditures per Positive Test"
#viz_subtitle <- "The unit expenditure is calculated by looking at the total expenditures reported under the HTS program area divided by the HTS_POS beneficiaries."
viz_caption <- "Source: Malawi DHA (FY18Q4) + ER Structured Dataset (FY18c) \n Note: HTS_POS Beneficiaries = HTS_TST_POS [unable to exclude VMMC]"

savename <- "mwi_hts_pos.png"
