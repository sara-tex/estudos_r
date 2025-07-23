library(tidyverse)
library(nycflights13)
# mutate()

flights |>
  mutate(
    air_time_horas = air_time/60,
    .before = 1
  )

.keep =

data("economics")

economics |>
  mutate(
    consumo_percapita = pce/pop,
    .before = 1
  )

economics |>
  mutate(
    des_hab = unemploy/pop,
    .before = 1
  )

des_hab_2008 <- economics |>
  mutate(
    year = year(date),
    des_hab = unemploy/pop,
    .keep = "none"
  ) |>
  filter(
    year == 2008
  )
  
dep: 3, 5, 10, 13, 16, 17, 21
est: 1, 6, 8, 11, 12, 14, 18
ans: 2, 4, 7, 9, 15, 19, 20

dass_simulado <- read_csv("https://tinyurl.com/dassdata")
dass_simulado <- dass_simulado |>
  rowwise()|>
  mutate(
    depressao = sum(dass_3, 
                    dass_5,
                    dass_10,
                    dass_13,
                    dass_16,
                    dass_17,
                    dass_21),
    .before = 1
  ) |>
  ungroup() 
#rowwise? ungroup?
# o rowise faz o mutate operar linha por linha (tipo de agrupamento)

dass_simulado <- dass_simulado |>
 rowwise() |>
   mutate(
    ansiedade = sum(
      dass_2, 
      dass_4, 
      dass_7, 
      dass_9, 
      dass_15, 
      dass_19, 
      dass_20
    ),
    .after = depressao
  ) |>
  ungroup()

dass_simulado <- dass_simulado |>
  rowwise() |>
  mutate(
    estresse = sum(dass_1, 
                   dass_6, 
                   dass_8, 
                   dass_11, 
                   dass_12, 
                   dass_14, 
                   dass_18
),
.after = ansiedade
  ) |>
  ungroup()

dass_simulado_seq <- read_csv("https://tinyurl.com/dassseqq")

dass_simulado_seq <- dass_simulado_seq |>
  rowwise() |>
  mutate(
    depressao = sum(c_across(d1:d7)),
    .before = 1
  ) |>
  ungroup()

dass_simulado_seq <- dass_simulado_seq |>
  rowwise() |>
  mutate(
    ansiedade = sum(c_across(a1:a7)),
    .after = depressao
  ) |>
  ungroup()

dass_simulado_seq <- dass_simulado_seq |>
  rowwise() |>
  mutate(
    estresse = sum(c_across(e1:e7)),
    .after = ansiedade
  )

#case_when(): transformar var contínua em categórica

ac_nutri <- read_csv("https://tinyurl.com/ac-nutri")
case_ac_nutri <- ac_nutri |>
  mutate(
    idade_corte = case_when(
      idade <= 20 ~ "adolescente",
      idade >= 21 & idade <= 65 ~ "adulto",
      idade > 65 ~ "idoso"    )
  ) |>
  relocate (idade_corte, .after = idade)

cut_ac_nutri <- ac_nutri |>
  mutate(
    idade_corte = cut(idade,
                      breaks = c(-Inf, 20, 65, +Inf),
                      labels = c("adolesccente", "adulto", "idoso"))
  ) |>
  relocate(idade_corte, .after = idade)

ac_nutri |>
  mutate(
    imc = cut(imc,
              breaks = c(-Inf, 18.5, 25, 30, +Inf),
              labels = c("baixo peso", "peso adequado", "sobrepeso", "obesidade")
    ),
    frequencia_treino = cut(frequencia_treino,
                        breaks = c(-Inf, 2, 5, 7),
                            labels = c("pouco frequente", "frequente", "muito frequente")
    )
  )

# select()
select(starts_with("dep"))
select(where(is.character))
select(!year:day)
select(year:day)
select(year, month, day)

# remame()
rename(
  ano = year, 
  mes = month,
  dia = day
)

rename_with(~ toupper(.),
            .cols = 1:3)
rename_with(~ str_remove_all(., "_"))
clean_names()


# relocate()
relocate(dep_delay:arr_delay, .before = day)

atrasos <- flights |>
  select(year, month, day, dep_delay, arr_delay, carrier) |>
  rename(
    companhia = carrier,
    ano = year,
    mês = month,
    dia = day,
    atraso_na_decolagem = dep_delay,
    atraso_no_pouso = arr_delay
  ) |>
  relocate(companhia)

group_by() # divide o banco em grupos para análise, mas nao altera o df

summarise() #resume as estatísticas

flights |>
  summarise(
    atraso_med_partida = mean(dep_delay, na.rm = T)
  )

flights |>
  summarise(
    m_atraso_partida = mean(dep_delay, na.rm = T),
    sd_atraso_partida = sd(dep_delay, na.rm = T),
    n = n()
  )

flights |>
  group_by(month) |>
  summarise(
    atraso_medio = mean(dep_delay, na.rm = T),
    n = n()
  )

flights |>
  group_by(carrier) |>
  summarise(
    atraso_medio_dec = mean(dep_delay, na.rm = T)
  ) |>
  arrange(atraso_medio_dec)

flights |>
  group_by(origin) |>
  summarise(
    m = mean(dep_delay, na.rm = T)
  ) |>
      arrange(desc(m))

flights |>
  group_by(dest) |>
  arrange(desc(arr_delay))
