# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Data cleaning
# =============================================

#cleaning year databases
data_2019 = data_2019 %>%
    pivot_longer(cols = jul:dic, names_to = "mes")
data_2020 = data_2020 %>%
    pivot_longer(cols = ene:dic, names_to = "mes")
data_2021 = data_2021 %>%
    pivot_longer(cols = ene:jul, names_to = "mes")

#cleaning estacion databases
estacion_2019 = estacion_2019 %>%
    pivot_longer(cols = ene:dic, names_to = "mes") %>%
    pivot_wider(names_from = entidad, values_from = value) %>%
    clean_names() %>%
    pivot_longer(cols = aguascalientes:zacatecas, names_to="entidad") %>%
    mutate(entidad = str_replace_all(entidad, "coahuila", "coahuila_de_zaragoza"),
           entidad = str_replace_all(entidad, "michoacan", "michoacan_de_ocampo" ),
           entidad = str_replace_all(entidad, "veracruz", "veracruz_de_ignacio_de_la_llave")) %>%
    left_join(claves_entidades, by = "entidad") %>%
    arrange(ano, entidad)

estacion_2020 = estacion_2020 %>%
    pivot_longer(cols = ene:dic, names_to = "mes") %>%
    pivot_wider(names_from = entidad, values_from = value) %>%
    clean_names() %>%
    pivot_longer(cols = aguascalientes:zacatecas, names_to="entidad") %>%
    mutate(entidad = str_replace_all(entidad, "coahuila", "coahuila_de_zaragoza"),
           entidad = str_replace_all(entidad, "michoacan", "michoacan_de_ocampo" ),
           entidad = str_replace_all(entidad, "veracruz", "veracruz_de_ignacio_de_la_llave")) %>%
    left_join(claves_entidades, by = "entidad") %>%
    arrange(ano, entidad)

estacion_2021 = estacion_2021 %>%
    pivot_longer(cols = ene:jul, names_to = "mes") %>%
    pivot_wider(names_from = entidad, values_from = value) %>%
    clean_names() %>%
    pivot_longer(cols = aguascalientes:zacatecas, names_to="entidad") %>%
    mutate(entidad = str_replace_all(entidad, "coahuila", "coahuila_de_zaragoza"),
           entidad = str_replace_all(entidad, "michoacan", "michoacan_de_ocampo" ),
           entidad = str_replace_all(entidad, "veracruz", "veracruz_de_ignacio_de_la_llave")) %>%
    left_join(claves_entidades, by = "entidad") %>%
    arrange(ano, entidad)

#cleaning incidencia database
incidencia = incidencia %>%
    pivot_longer(cols = "2019":"2021",names_to = "ano", values_to = "delitos") %>%
    mutate(delitos = round(delitos))

#End