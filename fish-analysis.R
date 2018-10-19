library(tidyverse)
source("R/themes.R")

#load data
fish <- read_csv("D:/NRES800/gittutorial/data/Gaeta_etal_CLC_data.csv")
head(fish)

#create new column in data called length_cat. length > 200 is big, otherwise small

fish %>%
  mutate(length_cat = if_else(length >= 200, "big", "small")) -> fish
head(fish)

#commit with message and push