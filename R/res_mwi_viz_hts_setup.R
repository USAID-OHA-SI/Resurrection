# SETUP HTS_TST VIZ [MWI]
# Project: Resurection
# A.Chafetz, USAID
# Purpose: prep data for vizualization
# Created: 2019-01-10

ue_viz <-  ue %>%
  filter(type == "HTS") %>% 
  arrange(ue) %>%
  mutate(name = as_factor(name)) %>%
  gather(type, val, c("expenditures", "beneficiaries", "ue")) %>%
  mutate(color = case_when(type == "ue" ~ "#2166AC",
                           TRUE         ~ "#67A9CF"),
         type = case_when(type == "beneficiaries" ~ "Beneficiaries (HTS_TST)",
                          type == "expenditures"  ~ "Expenditure (HTS Program, USD)",
                          TRUE                    ~ "Unit Expenditure (USD)"))

viz_title <- "Malawi FY18 PEPFAR Expenditures per Test"
#viz_subtitle <- "The unit expenditure is calculated by looking at the total expenditures reported under the HTS program area divided by the HTS beneficiaries."
viz_caption <- "Source: MSD (FY18Q4c) + ER Structured Dataset (FY18c) \n Note: HTS Beneficiaries = HTS_TST [unable to exclude VMMC]"

savename <- "mwi_hts.png"
