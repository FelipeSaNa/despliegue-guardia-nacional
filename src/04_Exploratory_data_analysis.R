# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Exploratory data analysis
# =============================================

# Graph of incidencia delictiva
incidencia %>%
ggplot(aes(fill = delito, x=entidad, y=delitos)) +
    geom_bar( position="stack",stat = "identity")+
    labs(title = "Incidencia delictiva en entidades del bajío",
         subtitle = "Años 2019-2021",
         caption = "Elaborado por MUCD con información del SESNSP",
         fill = NULL )+
    ylab("Número de víctimas")+
    xlab(NULL)+
    theme_ipsum()
ggsave(filename = here("plots","incidencia.png"))

guardia_anual = guardia_all %>% filter(mes == "jul") %>%
    group_by(ano) %>%
    summarize(despliegue = sum(despliegue))

# Graph of despliegue Guardia Nacional
guardia_anual %>%
    ggplot(aes(x=ano, y=despliegue)) +
    geom_bar(color="blue", fill=rgb(0.1,0.4,0.5,0.7), stat= "identity")+
labs(title = "Elementos de la Guardia Nacional desplegados",
     subtitle = "Desagregado por año al mes de julio",
     caption = "Elaborado por MUCD con información de la Unidad de Transparencia de la GN")+
    ylab("Elementos desplegados")+
    xlab(NULL)+
    theme_ipsum()
ggsave(filename = here("plots","despliegue_guardia.png"))



# #aggregating data in annual databases
# data_anual_guardia = guardia_all %>%
#     filter(mes == "jul") %>%
#     group_by(entidad, ano) %>%
#     summarize(migrantes_detenidos = sum(despliegue))
#
# data_anual_estacion = estacion_all %>%
#     filter(mes == "jul") %>%
#     group_by(entidad, ano) %>%
#     summarize(migrantes_detenidos = sum(migrantes_detenidos))
#
# #creating north and south databases
# guardia_norte = data_anual_guardia %>%
#     filter(entidad== "baja_california" |
#                entidad == "sonora"|
#                entidad == "chihuahua"|
#                entidad == "coahuila_de_zaragoza"|
#                entidad == "nuevo_leon" |
#                entidad == "tamaulipas")
#
# guardia_sur = data_anual_guardia %>%
#     filter(entidad== "tabasco" |
#                entidad == "chiapas"|
#                entidad == "campeche"|
#                entidad == "quintana_roo")
#
#
# estaciones_norte = data_anual_estacion %>%
#     filter(entidad== "baja_california" |
#                entidad == "sonora"|
#                entidad == "chihuahua"|
#                entidad == "coahuila_de_zaragoza"|
#                entidad == "nuevo_leon" |
#                entidad == "tamaulipas")
#
# estaciones_sur = data_anual_estacion %>%
#     filter(entidad== "tabasco" |
#                entidad == "chiapas"|
#                entidad == "campeche"|
#                entidad == "quintana_roo")
#
#
#
#
# guardia_sur %>%
#     ggplot(aes(x=ano, y=despliegue, group=entidad, color=entidad)) +
#     geom_line()+
#     scale_color_viridis(discrete = TRUE) +
#     labs(title = "Elementos de la Guardia Nacional desplegados",
#          subtitle = "Frontera sur")+
#     # scale_x_discrete(ano, breaks=factor(2019:2021), drop=FALSE)+
#     theme_ipsum() +
#     scale_x_discrete(name = "Año",limits = c(2019, 2020,2021))+
#     # xlab("Año")+
#     ylab("Número de elementos")
#
#
#
#
#
# guardia_norte %>%
#     ggplot(aes(x=ano, y=despliegue, group=entidad, color=entidad)) +
#     geom_line()+
#     scale_color_viridis(discrete = TRUE) +
#     labs(title = "Elementos de la Guardia Nacional desplegados",
#          subtitle = "Frontera sur")+
#     # scale_x_discrete(ano, breaks=factor(2019:2021), drop=FALSE)+
#     theme_ipsum() +
#     scale_x_discrete(name = "Año",limits = c(2019, 2020,2021))+
#     # xlab("Año")+
#     ylab("Número de elementos")
#
#
# estaciones_sur %>%
#     ggplot(aes(x=ano, y=migrantes_detenidos, group=entidad, color=entidad)) +
#     geom_line()+
#     scale_color_viridis(discrete = TRUE) +
#     labs(title = "Detenciones en estaciones migratorias",
#          subtitle = "Frontera sur")+
#     # scale_x_discrete(ano, breaks=factor(2019:2021), drop=FALSE)+
#     theme_ipsum() +
#     scale_x_discrete(name = "Año",limits = c(2019, 2020,2021))+
#     # xlab("Año")+
#     ylab("Número de migrantes")
#
# estaciones_norte %>%
#     ggplot(aes(x=ano, y=migrantes_detenidos, group=entidad, color=entidad)) +
#     geom_line()+
#     scale_color_viridis(discrete = TRUE) +
#     labs(title = "Detenciones en estaciones migratorias",
#          subtitle = "Frontera norte")+
#     # scale_x_discrete(ano, breaks=factor(2019:2021), drop=FALSE)+
#     theme_ipsum() +
#     scale_x_discrete(name = "Año",limits = c(2019, 2020,2021))+
#     # xlab("Año")+
#     ylab("Número de migrantes")




