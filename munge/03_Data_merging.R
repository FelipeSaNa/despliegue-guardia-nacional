# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Data  merging
# =============================================

#joining clean guardia nacional databases
guardia_all = data_2019 %>%
    full_join(data_2020) %>%
    full_join(data_2021) %>%
    pivot_wider(names_from = entidad, values_from = "value") %>%
    clean_names()%>%
    pivot_longer(cols = aguascalientes:zacatecas, names_to = "entidad", values_to = "despliegue") %>%
    mutate(entidad = str_replace_all(entidad, "coahuila", "coahuila_de_zaragoza"),
           entidad = str_replace_all(entidad, "michoacan", "michoacan_de_ocampo" ),
           entidad = str_replace_all(entidad, "veracruz", "veracruz_de_ignacio_de_la_llave"),
           entidad = str_replace_all(entidad, "estado_de_mexico", "mexico")) %>%
    left_join(claves_entidades, by = "entidad")

#joining clean estacion migratoria databases
estacion_all = estacion_2019 %>%
    full_join(estacion_2020) %>%
    full_join(estacion_2021) %>%
    rename(ingresos_regulares = value)

#joining both databases
data_guardia_estaciones =
    guardia_all %>%
    left_join(estacion_all, by = c("ano", "mes", "entidad", "cve_entidad")) %>%
    relocate(cve_entidad, .after = entidad)%>%
    mutate(ingresos_regulares = as.numeric(ingresos_regulares),
           ingresos_regulares = replace_na(ingresos_regulares,0))

data_guardia_estaciones_2021 = data_guardia_estaciones %>%
    filter(ano == 2021)

data_guardia_estaciones_2020 = data_guardia_estaciones %>%
    filter(ano == 2020)

data_guardia_estaciones_2019 = data_guardia_estaciones %>%
    filter(ano == 2019)

#removing unwanted variables
<<<<<<< HEAD
rm(data_2019, data_2020, data_2021, estacion_2019, estacion_2020, estacion_2021)

save(data_guardia_estaciones, file = here("data","clean","guardia_estaciones_final.RDS"))
write_xlsx(data_guardia_estaciones, here("data","clean","guardia_estaciones_final.xlsx"))
write_csv(data_guardia_estaciones, here("data","clean","guardia_estaciones_final.csv"))
=======
<<<<<<< HEAD
rm(data_2019, data_2020, data_2021, estacion_2019, estacion_2020, estacion_2021)

#saving databases

save(data_guardia_estaciones, file = here("data","clean","data_fina_guardia_ingresos.RDS"))
write_xlsx(data_guardia_estaciones, here("data","clean","data_fina_guardia_ingresos.xlsx"))
write_csv(data_guardia_estaciones, here("data","clean","data_fina_guardia_ingresos.csv"))
=======
rm(data_2019, data_2020, data_2021, estacion_2019, estacion_2020, estacion_2021)
>>>>>>> b5241fbb82352f0c74618fa6e0f43f3951f576c0
>>>>>>> f7628f97b09a44c384f183d61579c7b70dbb3753
