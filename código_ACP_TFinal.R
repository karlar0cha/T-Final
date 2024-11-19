
if (!require(FactoMineR)) install.packages("FactoMineR")
if (!require(factoextra)) install.packages("factoextra")
if (!require(foreign)) install.packages("foreign")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(psych)) install.packages("psych")
if (!require(dplyr)) install.packages("dplyr")
if (!require(tidyr)) install.packages("tidyr")

library(FactoMineR)
library(factoextra)
library(foreign)
library(ggplot2)
library(psych)
library(dplyr)
library(tidyr)

# Limpiar el entorno
rm(list = ls())

# Pelotita y cargar los datos
datos <- read_excel("C:/Users/HP RYZEN/Downloads/vagoneras/3_vagoneras_solo_codigo.xlsx")

#-------Modificar (las variables, ojo con la nomenclatura)-----------------

variables_seleccionadas <- c(
  "otro", "edo_mex", "cdmx", "metro", "metrobus", "pumabus",
  "taxi", "microbus", "camion", "combi", "trolebus",
  "cablebus", "mexibus", "rtp", "tren_ligero", "tren_suburbano", "autobus",
  "lunes", "martes", "miercoles", "jueves", "viernes", "sabado", "domingo",
  "1pm_a_4pm", "9pm_a_11pm", "4am_a_8am", "9am_a_12pm", "5pm_a_8pm", "12am_a_3am"
  
)

base_recortada=datos%>%select(all_of(variables_seleccionadas))

#-------No modificar -----------------
# Filtrar el dataframe para incluir solo las variables seleccionadas
datos_filtrados <- datos[, variables_seleccionadas]


#-------Modificar (si lo consideran, el número de factores)-----------------
poly_model <- fa(datos_filtrados, nfactors = 3, cor = "poly", fm = "mle", rotate = "none")
#Mostrar las cargas factoriales y diagrama del modelos

print(poly_model$loadings)
fa.diagram(poly_model)
