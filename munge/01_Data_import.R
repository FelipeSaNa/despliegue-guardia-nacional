# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Data import
# =============================================

## Loading packages
pacman::p_load(here, tidyverse, readr, openxlsx, janitor, plotly, hrbrthemes, viridis)
pacman::p_load(lintr, sf, raster, viridis, cowplot, rmarkdown, ggiraph, scales, writexl)

# reading databases of guardia nacional
data_2019 = read.xlsx(here("data", "raw", "guardia_2019.xlsx"))
data_2020 = read.xlsx(here("data", "raw", "guardia_2020.xlsx"))
data_2021 = read.xlsx(here("data", "raw", "guardia_2021.xlsx"))

#reading databases of estaciones migratorias
estacion_2019 = read.xlsx(here("data", "raw", "extranjeros_estacion_2019.xlsx"))
estacion_2020 = read.xlsx(here("data", "raw", "extranjeros_estacion_2020.xlsx"))
estacion_2021 = read.xlsx(here("data", "raw", "extranjeros_estacion_2021.xlsx"))

#reading incidencia delictiva databases
incidencia = read.xlsx(here("data", "raw", "incidencia.xlsx"))

#reading database of claves entidades
load((here("data", "clean", "claves_entidades_clean.RData")))

#end