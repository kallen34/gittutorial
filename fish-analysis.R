library(tidyverse)
source("R/themes.R")

#load data
fish <- read_csv("data/Gaeta_etal_CLC_data.csv")
head(fish)

#create new column in data called length_cat. length > 200 is big, otherwise small

fish %>%
  mutate(length_cat = if_else(length >= 300, "big", "small")) -> fish
head(fish)

#commit with message and push

#create histogram of scale length, fill(color) by length_cat and facet_wrap by length_cat with one of my themes
#commit and push to github and invite Chris to my github

fish %>%
  ggplot() +
  geom_histogram(aes(scalelength, fill = length_cat)) +
  facet_wrap(~length_cat, nrow = 1) +
  theme_pub()


## Chris's modifications

ggplot() +
  geom_histogram(data = fish, aes(x = scalelength, fill = length_cat), colour = "black", bins = 25) +
  facet_wrap(~length_cat) +
  coord_cartesian(ylim = c(0,500), xlim = c(0, 12), expand = FALSE) +
  theme_classic() +
  theme(legend.position = "none",
        panel.spacing = unit(2, "lines"))
