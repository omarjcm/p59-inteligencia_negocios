library(readxl)
library(dplyr)
library(tidyverse)

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

