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







