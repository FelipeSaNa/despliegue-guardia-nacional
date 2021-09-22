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
    rename(migrantes_detenidos = value)

#removing unwanted variables
rm(data_2019, data_2020, data_2021, estacion_2019, estacion_2020, estacion_2021)