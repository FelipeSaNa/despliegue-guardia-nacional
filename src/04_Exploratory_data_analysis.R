# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Exploratory data analysis
# =============================================

#aggregating data in annual databases
data_anual_guardia = guardia_all %>%
    filter(mes == "jul") %>%
    group_by(entidad, ano) %>%
    summarize(migrantes_detenidos = sum(despliegue))

data_anual_estacion = estacion_all %>%
    filter(mes == "jul") %>%
    group_by(entidad, ano) %>%
    summarize(migrantes_detenidos = sum(migrantes_detenidos))

#creating north and south databases
guardia_norte = data_anual_guardia %>%
    filter(entidad== "baja_california" |
               entidad == "sonora"|
               entidad == "chihuahua"|
               entidad == "coahuila_de_zaragoza"|
               entidad == "nuevo_leon" |
               entidad == "tamaulipas")

guardia_sur = data_anual_guardia %>%
    filter(entidad== "tabasco" |
               entidad == "chiapas"|
               entidad == "campeche"|
               entidad == "quintana_roo")


estaciones_norte = data_anual_estacion %>%
    filter(entidad== "baja_california" |
               entidad == "sonora"|
               entidad == "chihuahua"|
               entidad == "coahuila_de_zaragoza"|
               entidad == "nuevo_leon" |
               entidad == "tamaulipas")

estaciones_sur = data_anual_estacion %>%
    filter(entidad== "tabasco" |
               entidad == "chiapas"|
               entidad == "campeche"|
               entidad == "quintana_roo")




guardia_sur %>%
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



guardia_norte %>%
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


estaciones_sur %>%
    ggplot(aes(x=ano, y=migrantes_detenidos, group=entidad, color=entidad)) +
    geom_line()+
    scale_color_viridis(discrete = TRUE) +
    labs(title = "Detenciones en estaciones migratorias",
         subtitle = "Frontera sur")+
    # scale_x_discrete(ano, breaks=factor(2019:2021), drop=FALSE)+
    theme_ipsum() +
    scale_x_discrete(name = "Año",limits = c(2019, 2020,2021))+
    # xlab("Año")+
    ylab("Número de migrantes")

estaciones_norte %>%
    ggplot(aes(x=ano, y=migrantes_detenidos, group=entidad, color=entidad)) +
    geom_line()+
    scale_color_viridis(discrete = TRUE) +
    labs(title = "Detenciones en estaciones migratorias",
         subtitle = "Frontera norte")+
    # scale_x_discrete(ano, breaks=factor(2019:2021), drop=FALSE)+
    theme_ipsum() +
    scale_x_discrete(name = "Año",limits = c(2019, 2020,2021))+
    # xlab("Año")+
    ylab("Número de migrantes")
