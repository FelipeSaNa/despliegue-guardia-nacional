# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Data import
# =============================================

## Loading packages
pacman::p_load(here, tidyverse, readr, openxlsx, janitor, plotly, hrbrthemes, viridis)
<<<<<<< HEAD
pacman::p_load(lintr, sf, raster, viridis, cowplot, rmarkdown, ggiraph, scales, writexl)
=======
<<<<<<< HEAD
pacman::p_load(lintr, sf, raster, viridis, cowplot, rmarkdown, ggiraph)
=======
pacman::p_load(lintr, sf, raster, viridis, cowplot, rmarkdown, ggiraph, scales)
>>>>>>> b5241fbb82352f0c74618fa6e0f43f3951f576c0
>>>>>>> f7628f97b09a44c384f183d61579c7b70dbb3753

# reading databases of guardia nacional
data_2019 = as_tibble(read.xlsx(here("data", "raw", "guardia_2019.xlsx")))
data_2020 = as_tibble(read.xlsx(here("data", "raw", "guardia_2020.xlsx")))
data_2021 = as_tibble(read.xlsx(here("data", "raw", "guardia_2021.xlsx")))

#reading databases of ingresos regulares
estacion_2019 = as_tibble(read.xlsx(here("data", "raw", "entradas_regulares_2019.xlsx")))
estacion_2020 = as_tibble(read.xlsx(here("data", "raw", "entradas_regulares_2020.xlsx")))
estacion_2021 = as_tibble(read.xlsx(here("data", "raw", "entradas_regulares_2021.xlsx")))

#reading incidencia delictiva databases
incidencia = read.xlsx(here("data", "raw", "incidencia.xlsx"))

#reading database of claves entidades
load((here("data", "clean", "claves_entidades_clean.RData")))

#end