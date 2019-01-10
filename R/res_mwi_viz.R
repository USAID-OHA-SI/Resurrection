# SETUP VISUALIZATION [MWI]
# Project: Resurection
# A.Chafetz, USAID
# Purpose: visualize data
# Created: 2019-01-10

plot <- ue_viz %>%
  ggplot(aes(name, val)) +
  geom_col(fill = ue_viz$color) +
  # geom_text(aes(y = 0, label = scales::comma(val)),
  #           hjust = -.5) +
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  labs(title = viz_title,
       #subtitle = viz_subtitle,
       x = "", y = "",
       caption = viz_caption) +
  facet_wrap(. ~ type, scales = "free_x") +
  theme_bw() +
  theme(legend.position  = "none",
        panel.border     = element_blank(),
        axis.ticks       = element_blank(),
        plot.title       = element_text(face = "bold", size = 14),
        strip.background = element_blank(),
        strip.text       = element_text(face = "bold", size = 12),
        plot.caption     = element_text(color = "#404040"),
        axis.line.x      = element_line("#bfbfbf")) #lgray

#save
source("R/res_mwi_viz_save.R")
