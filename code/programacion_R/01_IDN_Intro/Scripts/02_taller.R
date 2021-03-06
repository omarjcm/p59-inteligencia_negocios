library(readxl)
library(dplyr)
library(tidyverse)
library(magrittr)

data_banco <- read_excel("Data/Data_Banco.xlsx", sheet = "Data")
data_sucursal <- read_excel("Data/Data_Banco.xlsx", sheet = "Data_Sucursal")
data_cajero <- read_excel("Data/Data_Banco.xlsx", sheet = "Data_Cajero")

str(data_banco)

head(data_sucursal, n=2)
str(data_banco)
names(data_banco)
names(data_sucursal)

data_banco <- tbl_df( data_banco )
data_banco
str(data_banco)

select( data_banco, Transaccion, Tiempo_Servicio_seg )

data_banco %>% 
  select( Transaccion, Tiempo_Servicio_seg ) 

data_banco %>% 
  names

data_banco %>% 
  dim

data_banco %>% 
  names %>% 
  length

length( names(data_banco) )

data_banco %>% 
  head(, n=5)

data_banco %>% 
  select( Tiempo_Servicio_seg ) %>% 
  boxplot()

# Todas las columnas a excepcion de la columna Cajero

data_banco %>% 
  select( -Cajero ) %>% 
  View()

# Busqueda de columnas por sus nombres

data_banco %>% 
  select( contains('Tra') ) %>% View()

data_banco %>% 
  select( starts_with('S') ) %>% View()

data_banco %>% 
  select( matches('r?sa') ) %>% View()

# Filtrado

data_banco %>% 
  filter( Sucursal == 62 ) %>% View()

data_banco %>% 
  filter( Sucursal == 62 & Tiempo_Servicio_seg >= 120 ) %>% View()

data_banco %>% 
  filter( Sucursal == 62 & Tiempo_Servicio_seg >= 120 & Satisfaccion == 'Muy Bueno' ) %>% View()

# Consultar la correlacion del tiempo de servicio y el monto
# Teniendo en cuenta una sucursal en particular (85).

data_banco %>% 
  filter( Sucursal == 85 ) %$% 
  cor( Tiempo_Servicio_seg, as.numeric( Monto )  )

# Ordenamiento de datos

data_banco %>% arrange( Satisfaccion ) %>% View()

data_banco %>% arrange( Satisfaccion, desc(Tiempo_Servicio_seg) ) %>% View()

# Crear una nueva columna

data_banco %>% mutate(Tiempo_Servicio_min=Tiempo_Servicio_seg/60) %>% View()
data_banco <- data_banco %>% mutate(Tiempo_Servicio_min=as.integer(Tiempo_Servicio_seg/60))
str(data_banco)

data_banco <- data_banco %>% 
  mutate( Monto = str_replace(Monto, pattern = ',', replacement = '.') ) %>% 
  mutate( Sucursal = as.character(Sucursal),
          Cajero = as.character(Cajero),
          Satisfaccion = parse_factor(Satisfaccion, 
                                      levels = c('Muy Malo', 'Malo', 'Regular', 'Bueno', 'Muy Bueno'),
                                      ordered = T), 
          Monto = parse_number(Monto, locale = locale(decimal_mark = '.')))

str(data_banco)

# Estadistica Descriptiva

data_banco %$% mean(Tiempo_Servicio_seg, na.rm=TRUE)

# Media acotada al 10%
data_banco %$% mean(Tiempo_Servicio_seg, trim=0.05, na.rm=TRUE)

data_banco %$% median(Tiempo_Servicio_seg, na.rm = TRUE)

#library(modeest)
#mlv(data_banco$Tiempo_Servicio_seg)

min(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)
max(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)

# Quartiles
quantile(data_banco$Tiempo_Servicio_seg, probs = c(0.25, 0.5, 0.75))

# Deciles
quantile(data_banco$Tiempo_Servicio_seg, probs = seq(from=0.1, to=1, by=0.1))

# Medidas de Posicion
library(ggplot2)

ggplot(data = data_banco, aes(x='', y=Tiempo_Servicio_seg)) +
  geom_boxplot() +
  coord_flip()

# Medidas de dispersion
var(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)

sd(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)

# Creacion de resumenes

glimpse(data_banco)
summary(data_banco)

data_banco %>% summarise(
  MEDIA = mean(Tiempo_Servicio_seg, na.rm=TRUE),
  MEDIA_ACOTADA = mean(Tiempo_Servicio_seg, na.rm=TRUE, trim=0.05),
  DESV = sd(Tiempo_Servicio_seg, na.rm = TRUE),
  CANTIDAD = n()
)

boxplot(data_banco$Tiempo_Servicio_seg)


data_banco %>% summarise( 
  MEDIA = mean(Tiempo_Servicio_seg, na.rm=TRUE),
  MEDIA_ACOTADA = mean(Tiempo_Servicio_seg, na.rm=TRUE, trim=0.05),
  DESV = sd(Tiempo_Servicio_seg, na.rm = TRUE),
  CANTIDAD = n()
) %>% 
  View()

data_banco %>% summarise_at( 
  vars(Tiempo_Servicio_seg, Monto),
  list(
    MEDIA = ~mean(., na.rm=TRUE),
    MEDIA_ACOTADA = ~mean(., na.rm=TRUE, trim=0.05),
    DESV = ~sd(., na.rm = TRUE),
    CANTIDAD = ~n()
  )
) %>% 
  View()

# Agrupar los datos

data_banco %>% 
  group_by(Transaccion) %>% 
  summarise(
    MEDIA = mean(Tiempo_Servicio_seg, na.rm=TRUE),
    MEDIA_ACOTADA = mean(Tiempo_Servicio_seg, na.rm=TRUE, trim=0.05),
    DESV = sd(Tiempo_Servicio_seg, na.rm = TRUE),
    CANTIDAD = n()    
  )

data_banco %>% 
  group_by(Transaccion, Satisfaccion) %>% 
  summarise(
    MEDIA = mean(Tiempo_Servicio_seg, na.rm=TRUE),
    MEDIA_ACOTADA = mean(Tiempo_Servicio_seg, na.rm=TRUE, trim=0.05),
    DESV = sd(Tiempo_Servicio_seg, na.rm = TRUE),
    CANTIDAD = n()    
  ) %>% View()

data_banco %>% 
  filter(Sucursal == 62) %>% 
  group_by(Transaccion, Satisfaccion) %>% 
  summarise(
    MEDIA = mean(Tiempo_Servicio_seg, na.rm=TRUE),
    MEDIA_ACOTADA = mean(Tiempo_Servicio_seg, na.rm=TRUE, trim=0.05),
    DESV = sd(Tiempo_Servicio_seg, na.rm = TRUE),
    CANTIDAD = n()    
  ) %>% View()

data_banco %>% 
  group_by(Satisfaccion) %>% 
  summarise(
    tibble(
      Quartil = c('Min', 'Q1', 'Mediana', 'Q3', 'Max'),
      Valor = quantile(Tiempo_Servicio_seg, c(0, 0.25, 0.5, 0.75, 1))
    )
  )

# Explorar los datos

# Tablas de frecuencia con datos numericos

library(fdth)

tbl_frec <- data_banco %$%
  fdt(Tiempo_Servicio_seg, breaks='Sturges')

tbl_frec

tbl_frec$breaks

tbl_frec$table

hist(data_banco$Tiempo_Servicio_seg, breaks = 'Sturges', 
     main='Histograma para la variable Tiempo de Respuesta')

library(ggplot2)

ggplot(data=data_banco, aes(x=Tiempo_Servicio_seg)) +
  geom_histogram( aes(y=..count..) ) +
  labs( title='Histograma para Tiempo Servicio (Seg)', y='Cantidad', x='Tiempo' )

tbl_frec <- data_banco %$% 
  fdt(Tiempo_Servicio_seg, start=0, end=max(Tiempo_Servicio_seg), h=50, right=FALSE)

tbl_frec

# Tablas de frecuencia con datos categoricos

table(data_banco$Transaccion)
table(data_banco$Satisfaccion)

barplot(table(data_banco$Satisfaccion))

data_banco %>% 
  ggplot(aes(x=Satisfaccion)) +
  geom_bar() +
  coord_flip() +
  labs(title = 'Grafico de barras para el nivel de satisfaccion', y='Cantidad',
       x='Nivel de Satisfaccion')

library(prettyR)
describe( data_banco, num.desc = c('mean', 'sd', 'median', 'min', 'max', 'valid.n') )

