# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Exploratory data analysis
# =============================================

# Graph of incidencia delictiva
# incidencia = incidencia %>%
#     mutate(delitos = comma(delitos))
incidencia_1 = incidencia %>%
    group_by(delitos, entidad, delito) %>%
    summarize(delitos = sum(delitos))

incidencia_1 %>%
    # group_by(ano, delito) %>%
ggplot(aes(fill = delito, x=entidad, y=delitos)) +
    geom_bar(position="stack",stat = "identity") +
    # scale_color_manual(values=c("red", "blue", "#56B4E9"))+
    labs(title = "Incidencia delictiva en entidades del bajío",
         subtitle = "Años 2019-2021",
         caption = "Elaborado por MUCD con información del SESNSP",
         fill = NULL )+
    ylab("Número de víctimas")+
    xlab(NULL)+
    theme_ipsum()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5))+
    scale_fill_manual(values = c("Delitos contra la libertad personal" ="#396aa9" ,"Extorsión" = "#4fa26a", "Homicidio doloso y feminicidio"="#ad333d"))
ggsave(filename = here("plots","incidencia.png"))


# Graph of despliegue Guardia Nacional
guardia_anual = guardia_all %>% filter(mes == "jul") %>%
    group_by(ano) %>%
    summarize(despliegue = sum(despliegue))

guardia_anual %>%
    ggplot(aes(x=ano, y=despliegue)) +
    geom_bar(fill = "#00958a", stat= "identity")+
labs(title = "Elementos de la Guardia Nacional desplegados",
     subtitle = "Desagregado por año al mes de julio",
     caption = "Elaborado por MUCD con información de la Unidad de Transparencia de la GN")+
    ylab("Elementos desplegados")+
    xlab(NULL)+
    theme_ipsum()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5))+
scale_y_continuous(name ="Número de víctimas")
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




