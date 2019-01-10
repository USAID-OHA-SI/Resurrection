# SAVE PLOT [MWI]
# Project: Resurection
# A.Chafetz, USAID
# Purpose: save plot common size
# Created: 2019-01-10


ggsave(savename, 
       plot = plot,
       path = "Output",
       width = 11, height = 4, units = "in",
       dpi = 300)