library(tidyverse)
library(janitor)
library(nycflights13)

#tibble é um tipo especial de banco de dados usado pelo tidyverse

#o básico do dplyr
#verbos do dplyr (funções)
# primeiro argumento: df
# seguintes: colunas
# saída: novo df
filter(mpg, manufacturer == "ford")
select(mpg, model)

mpg |>
  glimpse()

glimpse(mpg)


# quando se trata de linhas: 
filter() #seleciona linhas com base nos valores das colunas
filter(flights, dep_delay > 120)

mpg |>
  filter(cty > 17)

flights |>
  filter(day == 1 & month == 1)

flights |>
  filter(day == 1 | month == 1)

mpg |>
  filter(manufacturer == "jeep", cyl == 6)

mpg |>
  filter(cyl %in% c(6, 8))
# esse %in% quer dizer: cyl == 6 | cyl == 8

mpg |>
  filter(manufacturer %in% c("honda", "nissan", "toyota"))

ford <- mpg |>
  filter(manufacturer == "ford")

arrange() #muda a ordem das linhas baseado nos valores das colunas
# adicionar mais uma coluna vale como desempate
# maior pro menor: desc()
arrange(flights, desc(dep_delay))

mpg |>
  arrange(cty)

arrange(mpg, desc(hwy))

mpg |>
  filter(manufacturer == "ford") |>
  arrange(desc(cty))

distinct() #localiza as linhas únicas em um conjunto de dados
flights |>
  distinct(origin)

mpg |>
  distinct(manufacturer)

mpg |>
  distinct(manufacturer, model)

count() #número de ocorrencias em cada categoria
# é como se você fizesse um distinct e contasse os casos
mpg |>
  count(manufacturer, model)
#o argumento sort = TRUE mostra o n[umero de ocorrências em ordem descente (maior pro menor)]
# é como se n fosse uma variável e eu aplicasse um arrange(desc())

count(mpg, manufacturer, model, sort = TRUE)

mpg |>
  count(manufacturer)

mpg |>
  filter(manufacturer == "jeep") |>
  count()

mpg |>
  count(manufacturer, model)

flights |>
  filter(arr_delay >= 120, 
         dest %in% c("IAH", "HOU"), 
         month %in% c(7, 8, 9),
         dep_delay <= 0,
         carrier %in% c("UA", "AA", "DL"))

flights |>
  arrange(desc(dep_delay))

flights |>
  filter(year == 2013)|>
  count(day, month)

flights |>
  filter(year == 2013) |>
  distinct(month, day) |>
  count(month)

##pg 94: colunas!