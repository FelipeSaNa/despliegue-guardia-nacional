# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Data import
# =============================================

## Loading packages
pacman::p_load(here, tidyverse, readr, openxlsx, janitor)

# reading database
data_2019 = read.xlsx(here("data", "raw", "guardia_2019.xlsx"))
data_2020 = read.xlsx(here("data", "raw", "guardia_2020.xlsx"))
data_2021 = read.xlsx(here("data", "raw", "guardia_2021.xlsx"))
load((here("data", "clean", "claves_entidades_clean.RData")))

#end