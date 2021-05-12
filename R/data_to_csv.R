
library(magrittr)
library(tibble)
library(dplyr)
library(readr)

data("PimaIndiansDiabetes2", package = "mlbench")

PimaIndiansDiabetes2 %>%
  as_tibble() %>%
  mutate(diabetes_int = ifelse(diabetes == "pos", 1, 0)) %>%
  select(c("glucose", "mass", "diabetes_int")) %>%
  rename(diabetes = diabetes_int) %>%
  na.omit() %>%
  write_csv(file = "../pima.csv")