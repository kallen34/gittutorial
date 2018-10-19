library(tidyverse)
source("R/themes.R")

#load data
fish <- read_csv("D:/NRES800/gittutorial/data/Gaeta_etal_CLC_data.csv")
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
