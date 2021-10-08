# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Exploratory data analysis
# =============================================

# Graph of incidencia delictiva
# incidencia = incidencia %>%
#     mutate(delitos = comma(delitos))
incidencia_1 = incidencia %>%
    group_by(delitos, entidad, delito,ano) %>%
    summarize(delitos = sum(delitos))

incidencia_1 %>%
    filter(ano == 2019) %>%
    # group_by(ano, delito) %>%
ggplot(aes(fill = delito, x=entidad, y=delitos)) +
    geom_bar(position="stack",stat = "identity") +
    # scale_color_manual(values=c("red", "blue", "#56B4E9"))+
    labs(title = "Incidencia delictiva en entidades del bajío",
         subtitle = "Año 2019",
         caption = "Elaborado por MUCD con información del SESNSP",
         fill = NULL )+
    scale_y_continuous(label=comma)+
    ylab("Número de víctimas")+
    xlab(NULL)+
    theme_ipsum()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5))+
    scale_fill_manual(values = c("Delitos contra la libertad personal" ="#396aa9" ,"Extorsión" = "#4fa26a", "Homicidio doloso y feminicidio"="#ad333d"))
ggsave(filename = here("plots","incidencia_2019.png"))


incidencia_1 %>%
    filter(ano == 2020) %>%
    # group_by(ano, delito) %>%
    ggplot(aes(fill = delito, x=entidad, y=delitos)) +
    geom_bar(position="stack",stat = "identity") +
    # scale_color_manual(values=c("red", "blue", "#56B4E9"))+
    labs(title = "Incidencia delictiva en entidades del bajío",
         subtitle = "Año 2020",
         caption = "Elaborado por MUCD con información del SESNSP",
         fill = NULL )+
    scale_y_continuous(label=comma)+
    ylab("Número de víctimas")+
    xlab(NULL)+
    theme_ipsum()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5))+
    scale_fill_manual(values = c("Delitos contra la libertad personal" ="#396aa9" ,"Extorsión" = "#4fa26a", "Homicidio doloso y feminicidio"="#ad333d"))
ggsave(filename = here("plots","incidencia_2020.png"))

incidencia_1 %>%
    filter(ano == 2021) %>%
    # group_by(ano, delito) %>%
    ggplot(aes(fill = delito, x=entidad, y=delitos)) +
    geom_bar(position="stack",stat = "identity") +
    # scale_color_manual(values=c("red", "blue", "#56B4E9"))+
    labs(title = "Incidencia delictiva en entidades del bajío",
         subtitle = "Año 2021",
         caption = "Elaborado por MUCD con información del SESNSP",
         fill = NULL )+
    scale_y_continuous(label=comma)+
    ylab("Número de víctimas")+
    xlab(NULL)+
    theme_ipsum()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5))+
    scale_fill_manual(values = c("Delitos contra la libertad personal" ="#396aa9" ,"Extorsión" = "#4fa26a", "Homicidio doloso y feminicidio"="#ad333d"))
ggsave(filename = here("plots","incidencia_2021.png"))



# Graph of despliegue Guardia Nacional
guardia_anual = guardia_all %>% filter(mes == "jul") %>%
    group_by(ano) %>%
    summarize(despliegue = sum(despliegue))

guardia_anual %>%
    ggplot(aes(x=ano, y=despliegue)) +
    geom_bar(fill = "#69b3a2", stat= "identity")+
    geom_text(aes(label=despliegue), vjust=-0.1, hjust =0.5,check_overlap = T, size = 3, color= "black")+
    scale_y_continuous(label=comma, name ="Número de elementos")+
labs(title = "Elementos de la Guardia Nacional desplegados",
     subtitle = "Desagregado por año al mes de julio",
     caption = "Elaborado por MUCD con información de la Unidad de Transparencia de la GN")+
    ylab("Elementos desplegados")+
    xlab(NULL)+
    theme_ipsum()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5))
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
data_guardia_estaciones_2019 %>%
    group_by(entidad) %>%
    summarize(total_detenciones = sum(migrantes_detenidos)) %>%
    filter(!is.na(total_detenciones)) %>%
    arrange(total_detenciones) %>%
    tail(10) %>%
    mutate(entidad = case_when(entidad == "aguascalientes" ~ "Aguascalientes",
                               entidad == "baja_california" ~ "Baja California",
                               entidad == "baja_california_sur" ~ "Baja California Sur",
                               entidad == "campeche" ~ "Campeche",
                               entidad == "chiapas" ~ "Chiapas",
                               entidad == "chihuahua" ~"Chihuahua",
                               entidad == "coahuila_de_zaragoza" ~"Coahuila",
                               entidad == "colima" ~ "Colima",
                               entidad == "ciudad_de_mexico" ~ "Ciudad de México",
                               entidad == "durango" ~ "Durango",
                               entidad == "guanajuato" ~ "Guanajuato",
                               entidad == "guerrero" ~ "Guerrero",
                               entidad == "hidalgo" ~ "Hidalgo",
                               entidad == "jalisco" ~ "Jalisco",
                               entidad == "mexico" ~ "Estado de México",
                               entidad == "michoacan_de_ocampo" ~ "Michoacán",
                               entidad == "morelos" ~ "Morelos",
                               entidad == "nayarit" ~ "Nayarit",
                               entidad == "nuevo_leon" ~ "Nuevo León",
                               entidad == "oaxaca" ~ "Oaxaca",
                               entidad == "puebla" ~ "Puebla",
                               entidad == "queretaro" ~ "Querétaro",
                               entidad == "quintana_roo" ~ "Quintana Roo",
                               entidad == "san_luis_potosi" ~ "San Luis Potosí",
                               entidad == "sinaloa" ~ "Sinaloa",
                               entidad == "sonora" ~ "Sonora",
                               entidad == "tabasco" ~ "Tabasco",
                               entidad == "tamaulipas" ~ "Tamaulipas",
                               entidad == "tlaxcala" ~ "Tlaxcala",
                               entidad == "veracruz_de_ignacio_de_la_llave" ~"Veracruz",
                               entidad == "yucatan" ~ "Yucatán",
                               entidad == "zacatecas" ~"Zacatecas")) %>%
    mutate(entidad=factor(entidad, entidad)) %>%
    ggplot( aes(x=entidad, y=total_detenciones) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=total_detenciones), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    scale_y_continuous(label=comma)+
    coord_flip() +
    theme_ipsum() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="bottom",
        plot.title = element_text(size=16),
        plot.subtitle = element_text(size=10)) +
    labs(title = "Diez entidades con mayor número de detenciones migratorias",
         subtitle = "Año 2019",
         caption = "Elaboración propia con información de la Unidad de Política Migratoria de la SEGOB")+
    xlab("") +
    ylab("Total de detenciones migratorias por entidad federativa")
ggsave("grafica_detenciones_2019.png", path = here("plots"))

data_guardia_estaciones_2020 %>%
    group_by(entidad) %>%
    summarize(total_detenciones = sum(migrantes_detenidos)) %>%
    filter(!is.na(total_detenciones)) %>%
    arrange(total_detenciones) %>%
    tail(10) %>%
    mutate(entidad = case_when(entidad == "aguascalientes" ~ "Aguascalientes",
                               entidad == "baja_california" ~ "Baja California",
                               entidad == "baja_california_sur" ~ "Baja California Sur",
                               entidad == "campeche" ~ "Campeche",
                               entidad == "chiapas" ~ "Chiapas",
                               entidad == "chihuahua" ~"Chihuahua",
                               entidad == "coahuila_de_zaragoza" ~"Coahuila",
                               entidad == "colima" ~ "Colima",
                               entidad == "ciudad_de_mexico" ~ "Ciudad de México",
                               entidad == "durango" ~ "Durango",
                               entidad == "guanajuato" ~ "Guanajuato",
                               entidad == "guerrero" ~ "Guerrero",
                               entidad == "hidalgo" ~ "Hidalgo",
                               entidad == "jalisco" ~ "Jalisco",
                               entidad == "mexico" ~ "Estado de México",
                               entidad == "michoacan_de_ocampo" ~ "Michoacán",
                               entidad == "morelos" ~ "Morelos",
                               entidad == "nayarit" ~ "Nayarit",
                               entidad == "nuevo_leon" ~ "Nuevo León",
                               entidad == "oaxaca" ~ "Oaxaca",
                               entidad == "puebla" ~ "Puebla",
                               entidad == "queretaro" ~ "Querétaro",
                               entidad == "quintana_roo" ~ "Quintana Roo",
                               entidad == "san_luis_potosi" ~ "San Luis Potosí",
                               entidad == "sinaloa" ~ "Sinaloa",
                               entidad == "sonora" ~ "Sonora",
                               entidad == "tabasco" ~ "Tabasco",
                               entidad == "tamaulipas" ~ "Tamaulipas",
                               entidad == "tlaxcala" ~ "Tlaxcala",
                               entidad == "veracruz_de_ignacio_de_la_llave" ~"Veracruz",
                               entidad == "yucatan" ~ "Yucatán",
                               entidad == "zacatecas" ~"Zacatecas")) %>%
    mutate(entidad=factor(entidad, entidad)) %>%
    ggplot( aes(x=entidad, y=total_detenciones) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=total_detenciones), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    scale_y_continuous(label=comma)+
    coord_flip() +
    theme_ipsum() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="bottom",
        plot.title = element_text(size=16),
        plot.subtitle = element_text(size=10)) +
    labs(title = "Diez entidades con mayor número de detenciones migratorias",
         subtitle = "Año 2020",
         caption = "Elaboración propia con información de la Unidad de Política Migratoria de la SEGOB")+
    xlab("") +
    ylab("Total de detenciones migratorias por entidad federativa")
ggsave("grafica_detenciones_2020.png", path = here("plots"))

data_guardia_estaciones_2021 %>%
    group_by(entidad) %>%
    summarize(total_detenciones = sum(migrantes_detenidos)) %>%
    filter(!is.na(total_detenciones)) %>%
    arrange(total_detenciones) %>%
    tail(10) %>%
    mutate(entidad = case_when(entidad == "aguascalientes" ~ "Aguascalientes",
                               entidad == "baja_california" ~ "Baja California",
                               entidad == "baja_california_sur" ~ "Baja California Sur",
                               entidad == "campeche" ~ "Campeche",
                               entidad == "chiapas" ~ "Chiapas",
                               entidad == "chihuahua" ~"Chihuahua",
                               entidad == "coahuila_de_zaragoza" ~"Coahuila",
                               entidad == "colima" ~ "Colima",
                               entidad == "ciudad_de_mexico" ~ "Ciudad de México",
                               entidad == "durango" ~ "Durango",
                               entidad == "guanajuato" ~ "Guanajuato",
                               entidad == "guerrero" ~ "Guerrero",
                               entidad == "hidalgo" ~ "Hidalgo",
                               entidad == "jalisco" ~ "Jalisco",
                               entidad == "mexico" ~ "Estado de México",
                               entidad == "michoacan_de_ocampo" ~ "Michoacán",
                               entidad == "morelos" ~ "Morelos",
                               entidad == "nayarit" ~ "Nayarit",
                               entidad == "nuevo_leon" ~ "Nuevo León",
                               entidad == "oaxaca" ~ "Oaxaca",
                               entidad == "puebla" ~ "Puebla",
                               entidad == "queretaro" ~ "Querétaro",
                               entidad == "quintana_roo" ~ "Quintana Roo",
                               entidad == "san_luis_potosi" ~ "San Luis Potosí",
                               entidad == "sinaloa" ~ "Sinaloa",
                               entidad == "sonora" ~ "Sonora",
                               entidad == "tabasco" ~ "Tabasco",
                               entidad == "tamaulipas" ~ "Tamaulipas",
                               entidad == "tlaxcala" ~ "Tlaxcala",
                               entidad == "veracruz_de_ignacio_de_la_llave" ~"Veracruz",
                               entidad == "yucatan" ~ "Yucatán",
                               entidad == "zacatecas" ~"Zacatecas")) %>%
    mutate(entidad=factor(entidad, entidad)) %>%
    ggplot( aes(x=entidad, y=total_detenciones) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=total_detenciones), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    scale_y_continuous(label=comma)+
    coord_flip() +
    theme_ipsum() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="bottom",
        plot.title = element_text(size=16),
        plot.subtitle = element_text(size=10)) +
    labs(title = "Diez entidades con mayor número de detenciones migratorias",
         subtitle = "Año 2021",
         caption = "Elaboración propia con información de la Unidad de Política Migratoria de la SEGOB")+
    xlab("") +
    ylab("Total de detenciones migratorias por entidad federativa")
ggsave("grafica_detenciones_2021.png", path = here("plots"))



data_guardia_estaciones_2020 %>%
    group_by(entidad) %>%
    summarize(total_detenciones = sum(migrantes_detenidos)) %>%
    filter(!is.na(total_detenciones)) %>%
    arrange(total_detenciones) %>%
    tail(10) %>%
    mutate(entidad = case_when(entidad == "aguascalientes" ~ "Aguascalientes",
                               entidad == "baja_california" ~ "Baja California",
                               entidad == "baja_california_sur" ~ "Baja California Sur",
                               entidad == "campeche" ~ "Campeche",
                               entidad == "chiapas" ~ "Chiapas",
                               entidad == "chihuahua" ~"Chihuahua",
                               entidad == "coahuila_de_zaragoza" ~"Coahuila",
                               entidad == "colima" ~ "Colima",
                               entidad == "ciudad_de_mexico" ~ "Ciudad de México",
                               entidad == "durango" ~ "Durango",
                               entidad == "guanajuato" ~ "Guanajuato",
                               entidad == "guerrero" ~ "Guerrero",
                               entidad == "hidalgo" ~ "Hidalgo",
                               entidad == "jalisco" ~ "Jalisco",
                               entidad == "mexico" ~ "Estado de México",
                               entidad == "michoacan_de_ocampo" ~ "Michoacán",
                               entidad == "morelos" ~ "Morelos",
                               entidad == "nayarit" ~ "Nayarit",
                               entidad == "nuevo_leon" ~ "Nuevo León",
                               entidad == "oaxaca" ~ "Oaxaca",
                               entidad == "puebla" ~ "Puebla",
                               entidad == "queretaro" ~ "Querétaro",
                               entidad == "quintana_roo" ~ "Quintana Roo",
                               entidad == "san_luis_potosi" ~ "San Luis Potosí",
                               entidad == "sinaloa" ~ "Sinaloa",
                               entidad == "sonora" ~ "Sonora",
                               entidad == "tabasco" ~ "Tabasco",
                               entidad == "tamaulipas" ~ "Tamaulipas",
                               entidad == "tlaxcala" ~ "Tlaxcala",
                               entidad == "veracruz_de_ignacio_de_la_llave" ~"Veracruz",
                               entidad == "yucatan" ~ "Yucatán",
                               entidad == "zacatecas" ~"Zacatecas")) %>%
    mutate(entidad=factor(entidad, entidad)) %>%
    ggplot( aes(x=entidad, y=total_detenciones) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=total_detenciones), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    scale_y_continuous(label=comma)+
    coord_flip() +
    theme_ipsum() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="bottom",
        plot.title = element_text(size=16),
        plot.subtitle = element_text(size=10)) +
    labs(title = "Diez entidades con mayor número de detenciones migratorias",
         subtitle = "Año 2020",
         caption = "Elaboración propia con información de la Unidad de Política Migratoria de la SEGOB")+
    xlab("") +
    ylab("Total de detenciones migratorias por entidad federativa")
ggsave("grafica_detenciones_2020.png", path = here("plots"))

data_guardia_estaciones %>%
    group_by(entidad) %>%
    summarize(total_detenciones = sum(migrantes_detenidos)) %>%
    filter(!is.na(total_detenciones)) %>%
    arrange(total_detenciones) %>%
    tail(10) %>%
    mutate(entidad = case_when(entidad == "aguascalientes" ~ "Aguascalientes",
                               entidad == "baja_california" ~ "Baja California",
                               entidad == "baja_california_sur" ~ "Baja California Sur",
                               entidad == "campeche" ~ "Campeche",
                               entidad == "chiapas" ~ "Chiapas",
                               entidad == "chihuahua" ~"Chihuahua",
                               entidad == "coahuila_de_zaragoza" ~"Coahuila",
                               entidad == "colima" ~ "Colima",
                               entidad == "ciudad_de_mexico" ~ "Ciudad de México",
                               entidad == "durango" ~ "Durango",
                               entidad == "guanajuato" ~ "Guanajuato",
                               entidad == "guerrero" ~ "Guerrero",
                               entidad == "hidalgo" ~ "Hidalgo",
                               entidad == "jalisco" ~ "Jalisco",
                               entidad == "mexico" ~ "Estado de México",
                               entidad == "michoacan_de_ocampo" ~ "Michoacán",
                               entidad == "morelos" ~ "Morelos",
                               entidad == "nayarit" ~ "Nayarit",
                               entidad == "nuevo_leon" ~ "Nuevo León",
                               entidad == "oaxaca" ~ "Oaxaca",
                               entidad == "puebla" ~ "Puebla",
                               entidad == "queretaro" ~ "Querétaro",
                               entidad == "quintana_roo" ~ "Quintana Roo",
                               entidad == "san_luis_potosi" ~ "San Luis Potosí",
                               entidad == "sinaloa" ~ "Sinaloa",
                               entidad == "sonora" ~ "Sonora",
                               entidad == "tabasco" ~ "Tabasco",
                               entidad == "tamaulipas" ~ "Tamaulipas",
                               entidad == "tlaxcala" ~ "Tlaxcala",
                               entidad == "veracruz_de_ignacio_de_la_llave" ~"Veracruz",
                               entidad == "yucatan" ~ "Yucatán",
                               entidad == "zacatecas" ~"Zacatecas")) %>%
    mutate(entidad=factor(entidad, entidad)) %>%
    ggplot( aes(x=entidad, y=total_detenciones) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=total_detenciones), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    scale_y_continuous(label=comma)+
    coord_flip() +
    theme_ipsum() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="bottom",
        plot.title = element_text(size=16),
        plot.subtitle = element_text(size=10)) +
    labs(title = "Diez entidades con mayor número de detenciones migratorias",
         subtitle = "Año 2019-2021",
         caption = "Elaboración propia con información de la Unidad de Política Migratoria de la SEGOB")+
    xlab("") +
    ylab("Total de detenciones migratorias por entidad federativa")



