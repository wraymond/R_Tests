### Testing filtering ###

library(tidyverse)

dat <- read.csv("test_data.csv", header = TRUE, stringsAsFactors = FALSE)

## Lets check ##
unique(dat$Site)

## Site A not included ##
df1 <- dat %>%
  filter(Data.Concern. != "Out") %>% 
  group_by(Site, Species, Heatwave_stage) %>%
  summarize(mean_pop_est = mean(pop_est),
            sd_pop_est = sd(pop_est),
            n_samples = n(),
            Total.Area = unique(Total.Area), .groups = 'drop')

## Site A included ##
df2 <- dat %>%
  filter(!Data.Concern. %in% "Out") %>% 
  group_by(Site, Species, Heatwave_stage) %>%
  summarize(mean_pop_est = mean(pop_est),
            sd_pop_est = sd(pop_est),
            n_samples = n(),
            Total.Area = unique(Total.Area), .groups = 'drop')
