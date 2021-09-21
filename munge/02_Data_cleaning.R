# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Data cleaning and merging
# =============================================

#cleaning year databases
data_2019 = data_2019 %>%
    pivot_longer(cols = jul:dic, names_to = "mes")
data_2020 = data_2020 %>%
    pivot_longer(cols = ene:dic, names_to = "mes")
data_2021 = data_2021 %>%
    pivot_longer(cols = ene:jul, names_to = "mes")

#joining clean databases
data_all = data_2019 %>%
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

#removing unwanted variables
rm(data_2019, data_2020, data_2021)

#End