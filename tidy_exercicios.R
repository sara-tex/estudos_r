library(tidyverse)

# Bloco 1

ufo <- read_csv("https://tinyurl.com/ufo-avist")

ufo |>
  filter(
    reported_date_time_utc >= ymd("1993-09-10"),
    shape == "chevron",
    country_code == "US") |>
  count(state, sort = T)

#2

ufo |>
  filter(
    shape == "cigar",
    country_code == "US"
  ) |>
  group_by(state) |>
  summarise(
    m = mean(
      duration_seconds/3600),
  n = n()
  )|>
  arrange(desc(n))


#3

ufo |>
  drop_na(day_part) |>
  group_by(day_part) |>
  summarise(
    m = mean(duration_seconds, na.rm = T)
  ) |>
  arrange(desc(m))


#4

ufo |>
  filter(country_code == "US") |>
  group_by(year(reported_date_time_utc))|>
  summarise(
    n = n()
  ) |>
  arrange(desc(n))

ufo |>
  filter(country_code == "US") |>
  mutate(
    ano = year(reported_date_time_utc)
  ) |>
  count(ano, sort = T)


#5
ufo |>
  filter(country_code == "US") |>
  count(city, state, sort = T)

# Segundo bloco #

#6

eventos <- read_csv("https://tinyurl.com/noaa-clean")

eventos|>
  group_by(year, evtype) |>
  summarise(
    total_de_feridos = sum(injuries)
  ) |>
  arrange(desc(total_de_feridos))

#7

eventos |>
  group_by(year, evtype) |>
  summarise(
    total_mortes = sum(fatalities)
  ) |>
  arrange(desc(total_mortes))


#8
eventos |>
  group_by(evtype) |>
  summarise(
    total_feridos = sum(injuries)
  ) |>
  arrange(desc(total_feridos))


#9 
eventos |>
  group_by(evtype) |>
  summarise(
    m = mean(injuries)
  ) |>
  arrange(desc(m))

#10
eventos |>
  group_by(evtype) |>
  summarise(
    total = sum(fatalities)
  ) |>
  arrange(desc(total))

#11
eventos |>
  group_by(evtype) |>
  summarise(
    m = mean(fatalities)
  ) |>
arrange(desc(m))

#12 
eventos |>
  group_by(state, evtype)|>
  summarise(
    total = sum(cropdmg)
  ) |>
  arrange(desc(total))


#13
eventos |> 
  group_by(state) |>
  summarise(
    total = sum(propdmg)
  ) |>
  arrange(desc(total))

# Terceiro bloco #

srq20 <- read_csv("https://tinyurl.com/srq20toy")

srq20 <- srq20 |>
  mutate(
    across(srq1:srq20,
      \(x) case_when(
        x == "sim" ~ 1,
        .default = 0
      )
    )
  )

#14
srq20 <- srq20 |>
  rowwise()|>
  mutate(
    total = sum(c_across(srq1:srq20))
  ) |> ungroup()

srq20 <- srq20 |>
  rowwise()|>
  mutate(
    tem_tmc = case_when(
     total <= 7 ~ "não",
     total > 7 ~ "sim"
    ) 
  )

srq20 |>
  count(tem_tmc) |>
  mutate(
    "%" = percent(n/sum(n))
  )

srq20 |>
  summarise(
    mean = mean(total),
    sd = sd(total),
    max = max(total),
    min = min(total)
  )

srq20 |>
  filter(genero == "masculino")|>
  summarise(
    mean = mean(total),
    sd = sd(total),
    max = max(total),
    min = min(total)
  )
