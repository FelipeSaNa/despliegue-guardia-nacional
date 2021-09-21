# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Geogrpahical analysis
# =============================================

data_anual = data_all %>%
    filter(mes == "jul") %>%
    group_by(entidad, ano) %>%
    summarize(despliegue = sum(despliegue))

data_norte = data_anual %>%
    filter(entidad== "baja_california" |
               entidad == "sonora"|
               entidad == "chihuahua"|
               entidad == "coahuila_de_zaragoza"|
               entidad == "nuevo_leon" |
               entidad == "tamaulipas")


data_sur = data_anual %>%
    filter(entidad== "tabasco" |
               entidad == "chiapas"|
               entidad == "campeche"|
               entidad == "quintana_roo")

data_norte %>%
    ggplot(aes(x=ano, y=despliegue, group=entidad, color=entidad)) +
    geom_line()


data_sur %>%
    ggplot(aes(x=ano, y=despliegue, group=entidad, color=entidad)) +
    geom_line()+
    scale_color_viridis(discrete = TRUE) +
    labs(title = "Elementos de la Guardia Nacional desplegados",
         subtitle = "Frontera sur")+
    # scale_x_discrete(ano, breaks=factor(2019:2021), drop=FALSE)+
    theme_ipsum() +
    scale_x_discrete(name = "Año",limits = c(2019, 2020,2021))+
    # xlab("Año")+
    ylab("Número de elementos")



data_norte %>%
    ggplot(aes(x=ano, y=despliegue, group=entidad, color=entidad)) +
    geom_line()+
    scale_color_viridis(discrete = TRUE) +
    labs(title = "Elementos de la Guardia Nacional desplegados",
         subtitle = "Frontera sur")+
    # scale_x_discrete(ano, breaks=factor(2019:2021), drop=FALSE)+
    theme_ipsum() +
    scale_x_discrete(name = "Año",limits = c(2019, 2020,2021))+
    # xlab("Año")+
    ylab("Número de elementos")

#Creating maps
data_2019 = data_all %>%
    filter(ano == 2019 & mes == "jul") %>%
    group_by(entidad) %>%
    summarize(despliegue= sum(despliegue)) %>%
    full_join(claves_entidades, by = "entidad")

data_2020 = data_all %>%
    filter(ano == 2020 & mes == "jul")  %>%
    group_by(entidad) %>%
    summarize(despliegue= sum(despliegue)) %>%
    full_join(claves_entidades, by = "entidad")

data_2021 = data_all %>%
    filter(ano == 2021 & mes == "jul") %>%
    group_by(entidad) %>%
    summarize(despliegue= sum(despliegue)) %>%
    full_join(claves_entidades, by = "entidad")


