# Resurrection

PURPOSE: Creating PEPFAR Unit Expenditures with MER and ER for testing, positive testing, and treatment

UEs are calculated for each mechanism reporting Testing/Treatment results in FY18 and/or Testing/Treatment expenditures

## UE Calculation

*HTS_TST*
- Numerator = All HTS Program expenditures in FY18
- Denominator = HTS Beneficiaries FY18 = HTS_TST - HTS_TST_VMMC [VMMC Modality]
  
*HTS_TST_POS*
- Numerator = All HTS Program expenditures in FY18
- Denominator = HTS_POS Beneficiaries FY18 = HTS_TST_POS - HTS_TST_POS_VMMC [VMMC Modality]
  
*TX_CURR*
- Numerator = All C&T Program expenditrues in FY18
- Denominator = Treatment Beneficiaries FY18 = TX_CURR
  
## Caveats:
- Expenditures and unit expenditures are inclusive of ONLY PEPFAR spending and should not be confused with a total unit cost.
- Expenditures here include the entire HTS program area. This does not include the PM of the prime, but does include the PM of the sub (all expenditures for the sub are lumped together under the subrecipient object class).
- The expenditures and unit expenditures should not be compared to EA unit expenditures or unit budgets from the past as the categorization of the underlying ER data is composed differently.
- Unit expenditures should not be used for a target based budgeting approach.
- Unit expenditures do not capture the full context of the spending/the program. 
- VMMC tests are excluded as their spending is categorized elsewhere. However, there often a is a discrepancy between HTS_TST VMMC testing modality and VMMC_CIRC. This analysis uses the testing modality.
- Expenditures are reported based on a preponderance of effort as detailed in ER guidance.  This means that some expenditures included in the numerator might not be strictly HTS-focused, and/or the numerator might not include every HTS expenditures incurred
