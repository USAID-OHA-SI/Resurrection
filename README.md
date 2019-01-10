# Resurrection
Creating PEPFAR Unit Expenditures with MER and ER

## Calculation
- Numerator = All HTS Program expenditures in FY18
- Denominator = 
  - HTS Beneficiaries = HTS_TST - HTS_TST_VMMC [VMMC Modality]
  - HTS_POS Beneficiaries   =   HTS_TST_POS - HTS_TST_POS_VMMC [VMMC Modality]
  
## Caveats:
- Expenditures and unit expenditures are inclusive of ONLY PEPFAR spending and should not be confused with a total unit cost.
- Expenditures here include the entire HTS program area. This does not include the PM of the prime, but does include the PM of the sub (all expenditures for the sub are lumped together under the subrecipient object class).
- The expenditures and unit expenditures should not be compared to EA unit expenditures or unit budgets from the past as the categorization of the underlying ER data is composed differently.
- Unit expenditures should not be used for a target based budgeting approach.
- Unit expenditures do not capture the full context of the spending/the program. 
- VMMC tests are excluded as their spending is categorized elsewhere. However, there often a is a discrepancy between HTS_TST VMMC testing modality and VMMC_CIRC. This analysis uses the testing modality.
