# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Bivariate maps
# =============================================

#create map datasets
mex_map = st_read(here("data", "raw", "00ent.shp"))
mex_map_2021 = mex_map %>%
    left_join(data_guardia_estaciones_2021,
              by = c("CVE_ENT"= "cve_entidad"))
mex_map_2020 = mex_map %>%
    left_join(data_guardia_estaciones_2020,
              by = c("CVE_ENT"= "cve_entidad"))
mex_map_2019 = mex_map %>%
    left_join(data_guardia_estaciones_2019,
              by = c("CVE_ENT"= "cve_entidad"))
#2021 map
# create 3 buckets for Area
quantiles_Area= mex_map_2021$migrantes_detenidos %>%
    quantile(probs = seq(0, 1, length.out = 4))
# create 3 buckets for Area
quantiles_Pop= mex_map_2021$despliegue %>%
    quantile(probs = seq(0, 1, length.out = 4))
# create color scale for two variables
bivariate_color_scale = tibble(
    "3 - 3" = "#3F2949",
    "2 - 3" = "#435786",
    "1 - 3" = "#4885C1",
    "3 - 2" = "#77324C",
    "2 - 2" = "#806A8A",
    "1 - 2" = "#89A1C8",
    "3 - 1" = "#AE3A4E",
    "2 - 1" = "#BC7C8F",
    "1 - 1" = "#CABED0") %>%
    gather("group", "fill")

mex_map_2021 = mex_map_2021 %>%
    mutate(Area_quantiles = cut(migrantes_detenidos,
            breaks = quantiles_Area,
            include.lowest = TRUE),
        POP_quantiles = cut(despliegue,
            breaks = quantiles_Pop,
            include.lowest = TRUE),
        group = paste(
            as.numeric(Area_quantiles), "-",
            as.numeric(POP_quantiles))) %>%
    left_join(bivariate_color_scale, by = "group")

map = ggplot(data = mex_map_2021) +
    # color entidades according to their detenciones/despliegue
    geom_sf(aes(fill = fill),
        color = "white",
        size = 0.1) +
    scale_fill_identity()+
    labs(x = NULL,
         y = NULL,
         title = "México:Densidad de detenciones migratorias por despliegue de la GN",
         subtitle = "Por entidad federativa en 2021",
         caption = "Elaborado por MUCD con información de la Unidad de Política Migratoria y Guardia Nacional") +
    theme_map()
# separate the groups
bivariate_color_scale = bivariate_color_scale %>%
    separate(group, into = c("migrantes_detenidos", "despliegue"), sep = " - ") %>%
    mutate(Area = as.integer(migrantes_detenidos),
           Pop = as.integer(despliegue))

legend = ggplot() +
    geom_tile( data = bivariate_color_scale,
               mapping = aes(x = Area,y = Pop,fill = fill)) +
    scale_fill_identity() +
    labs(x = "Detenciones migratorias--->",
         y = "Elementos la GN--->") +
    theme_map() +
    theme(axis.title = element_text(size = 6.5)) +
    coord_fixed()

bivariate= ggdraw() +
    draw_plot(map, 0, 0, 1, 1) +
    draw_plot(legend, 0.70, 0.60, 0.15, 0.15)
ggsave(filename = here("plots","detenciones_despliegue_2021.png"), plot = bivariate, device = png())

#2020 map
# create 3 buckets for Area
quantiles_Area= mex_map_2020$migrantes_detenidos %>%
    quantile(probs = seq(0, 1, length.out = 4))
# create 3 buckets for Area
quantiles_Pop= mex_map_2020$despliegue %>%
    quantile(probs = seq(0, 1, length.out = 4))
# create color scale for two variables
bivariate_color_scale = tibble(
    "3 - 3" = "#3F2949",
    "2 - 3" = "#435786",
    "1 - 3" = "#4885C1",
    "3 - 2" = "#77324C",
    "2 - 2" = "#806A8A",
    "1 - 2" = "#89A1C8",
    "3 - 1" = "#AE3A4E",
    "2 - 1" = "#BC7C8F",
    "1 - 1" = "#CABED0") %>%
    gather("group", "fill")

mex_map_2020 = mex_map_2020 %>%
    mutate(Area_quantiles = cut(migrantes_detenidos,
                                breaks = quantiles_Area,
                                include.lowest = TRUE),
           POP_quantiles = cut(despliegue,
                               breaks = quantiles_Pop,
                               include.lowest = TRUE),
           group = paste(
               as.numeric(Area_quantiles), "-",
               as.numeric(POP_quantiles))) %>%
    left_join(bivariate_color_scale, by = "group")

map = ggplot(data = mex_map_2020) +
    # color entidades according to their detenciones/despliegue
    geom_sf(aes(fill = fill),
            color = "white",
            size = 0.1) +
    scale_fill_identity()+
    labs(x = NULL,
         y = NULL,
         title = "México:Densidad de detenciones migratorias por despliegue de la GN",
         subtitle = "Por entidad federativa en 2020",
         caption = "Elaborado por MUCD con información de la Unidad de Política Migratoria y Guardia Nacional") +
    theme_map()
# separate the groups
bivariate_color_scale = bivariate_color_scale %>%
    separate(group, into = c("migrantes_detenidos", "despliegue"), sep = " - ") %>%
    mutate(Area = as.integer(migrantes_detenidos),
           Pop = as.integer(despliegue))

legend = ggplot() +
    geom_tile( data = bivariate_color_scale,
               mapping = aes(x = Area,y = Pop,fill = fill)) +
    scale_fill_identity() +
    labs(x = "Detenciones migratorias--->",
         y = "Elementos la GN--->") +
    theme_map() +
    theme(axis.title = element_text(size = 6.5)) +
    coord_fixed()

bivariate= ggdraw() +
    draw_plot(map, 0, 0, 1, 1) +
    draw_plot(legend, 0.70, 0.60, 0.15, 0.15)
ggsave(filename = here("plots","detenciones_despliegue_2020.png"), plot = bivariate, device = png())

#2019 map
# create 3 buckets for Area
quantiles_Area= mex_map_2019$migrantes_detenidos %>%
    quantile(probs = seq(0, 1, length.out = 4))
# create 3 buckets for Area
quantiles_Pop= mex_map_2019$despliegue %>%
    quantile(probs = seq(0, 1, length.out = 4))
# create color scale for two variables
bivariate_color_scale = tibble(
    "3 - 3" = "#3F2949",
    "2 - 3" = "#435786",
    "1 - 3" = "#4885C1",
    "3 - 2" = "#77324C",
    "2 - 2" = "#806A8A",
    "1 - 2" = "#89A1C8",
    "3 - 1" = "#AE3A4E",
    "2 - 1" = "#BC7C8F",
    "1 - 1" = "#CABED0") %>%
    gather("group", "fill")

mex_map_2019 = mex_map_2019 %>%
    mutate(Area_quantiles = cut(migrantes_detenidos,
                                breaks = quantiles_Area,
                                include.lowest = TRUE),
           POP_quantiles = cut(despliegue,
                               breaks = quantiles_Pop,
                               include.lowest = TRUE),
           group = paste(
               as.numeric(Area_quantiles), "-",
               as.numeric(POP_quantiles))) %>%
    left_join(bivariate_color_scale, by = "group")

map = ggplot(data = mex_map_2019) +
    # color entidades according to their detenciones/despliegue
    geom_sf(aes(fill = fill),
            color = "white",
            size = 0.1) +
    scale_fill_identity()+
    labs(x = NULL,
         y = NULL,
         title = "México:Densidad de detenciones migratorias por despliegue de la GN",
         subtitle = "Por entidad federativa en 2019",
         caption = "Elaborado por MUCD con información de la Unidad de Política Migratoria y Guardia Nacional") +
    theme_map()
# separate the groups
bivariate_color_scale = bivariate_color_scale %>%
    separate(group, into = c("migrantes_detenidos", "despliegue"), sep = " - ") %>%
    mutate(Area = as.integer(migrantes_detenidos),
           Pop = as.integer(despliegue))

legend = ggplot() +
    geom_tile( data = bivariate_color_scale,
               mapping = aes(x = Area,y = Pop,fill = fill)) +
    scale_fill_identity() +
    labs(x = "Detenciones migratorias--->",
         y = "Elementos la GN--->") +
    theme_map() +
    theme(axis.title = element_text(size = 6.5)) +
    coord_fixed()

bivariate= ggdraw() +
    draw_plot(map, 0, 0, 1, 1) +
    draw_plot(legend, 0.70, 0.60, 0.15, 0.15)
ggsave(filename = here("plots","detenciones_despliegue_2019.png"), plot = bivariate, device = png())

