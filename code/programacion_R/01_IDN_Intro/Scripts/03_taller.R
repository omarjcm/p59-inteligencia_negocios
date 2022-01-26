library(tidyverse)

parse_number( c('$1,234.5', '$123.56') )
parse_double( c('1234.5', '12.51') )
parse_integer(c('$1,234.5', '$123.56'))
as.character(lubridate::now())

data_factor <- factor(c('Alto', 'Bajo', 'Medio', 'Alto'), 
                      levels = c('Alto', 'Medio', 'Bajo'), ordered = T)
data_factor

alturas <- c('Alto', 'Bajo', 'Medio', 'Alto')
alturas
alturas <- parse_factor(alturas, 
                        levels = c('Alto', 'Medio', 'Bajo'), 
                        ordered = T)
alturas

parse_date('2022-01-20')
parse_date('2022/01/20')
