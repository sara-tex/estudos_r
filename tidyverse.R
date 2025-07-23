
# o tidyverse não é um pacote, mas uma COLEÇÃO de pacotes
# manipulação, visualização e importação de dados
# pacotes em formato tidy:
# cada variável é uma coluna
# cada obs é uma linha
# cada unidade observacional é uma tabela
# principais pacotes:
# ggplot2: Visualização de dados com base na gramática dos gráficos
# dplyr: Manipulação e transformação de dados
# tidyr: Organização e reestruturação de dados
# readr: Importação de dados (CSV, TSV etc.)
# tibble:
# stringr:
# forcats:
# purrr: iteração

# o tidyverse utiliza o operador pipe (encadeamento)

# janitor: limpeza e preparação de dados
# principais funcionalidades: clean_names() e tabyl()

# TÍPICO FLUXO tidyverse + janitor

read_csv("dados.csv") |>             # Importa os dados (readr)
  clean_names() |>                   # Limpa nomes de colunas (janitor)
  filter(condição) |>                # Filtra linhas (dplyr)
  select(colunas) |>                 # Seleciona colunas (dplyr)
  mutate(nova_coluna = ...) |>       # Cria/transforma colunas (dplyr)
  group_by(variável) |>              # Agrupa por categorias (dplyr)
  summarise(média = mean(x)) |>      # Resume por grupo (dplyr)
  ggplot(aes(x, y)) +                # Visualiza os dados (ggplot2)
  geom_col()                         # Tipo de gráfico

