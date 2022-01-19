library(readxl)

data_banco <- read_excel("Data/Data_Banco.xlsx", sheet = "Data")
data_sucursal <- read_excel("Data/Data_Banco.xlsx", sheet = "Data_Sucursal")
data_cajero <- read_excel("Data/Data_Banco.xlsx", sheet = "Data_Cajero")

str(data_banco)

head(data_sucursal, n=2)
str(data_banco)
names(data_banco)
names(data_sucursal)