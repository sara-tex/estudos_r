#1 Encontre o log natural, log na base 10, log na base 2 e a raiz quadrada de 12.43. Some os resultados os resultados encontrados e arredonde a soma para duas casas decimais.
round(
  sum(
    log10(12.43), 
    log(12.43), 
    log2(12.43), 
    sqrt(12.43)
    ), 2)

#resposta: c) 10.78



#2 Determine a área de um círculo com diâmetro de 20 cm e atribua o resultado a um objeto chamado area_circulo. Eis a fórmula para calcular a área do círculo:
area_circulo <- pi*(10^2)
#resposta: b) 314.1593




#3 Calcule a raiz cúbica de 14*0.51
(14*0.51)^(1/3)
#resposta: d) 1.93



#4
a <- 2
b <- (-1)
c <- (-4)
delta <- sqrt((b^2)-4*a*c)
x1 <- (-b+delta)/(2*a)
x2 <- (-b-delta)/(2*a)
round(x1, 2)
round(x2, 2)

(2*(x1^2)) - x1 - 4
(2*(x2^2)) - x2 - 4

#resposta: c) 1.69, -1.19





#5 Crie um vetor chamado peso contendo o peso (em kg) de 4 pessoas: 80.2, 56.3, 70.5 e 60.3. Agora, calcule a média e o desvio padrão do vetor peso. Arredonde os resultados para uma casa decimal.
peso <- c(80.2, 56.3, 70.5, 60.3)
round(mean(peso), 1)
round(sd(peso), 1)
#resposta: d) 66.8, 10.7





#6 Crie o objeto altura com os valores (em cm) para a altura das mesmas quatro pessoas que tiveram o peso registrado anteriormente: 175, 160, 165 e 172. Agora, transforme o objeto altura de modo que os valores sejam apresentados em metros. Salve o resultado para um novo objeto chamado altura_m.
#Quais os valores encontrados para a mediana, o mínimo e o máximo do objeto altura_m, respectivamente?”
altura <- c(175, 160, 165, 172)
altura_m <- altura/100
median(altura_m)
min(altura_m)
max(altura_m)
#resposta: a) 1.685, 1.6, 1.75




#7 Sabendo que o Índice de Massa Corpórea (IMC) é obtido dividindo o peso (em kg) pela altura (em metros) ao quadrado, recrie os objetos peso e altura_m e crie um objeto imc com os valores do IMC de cada caso.
#Qual o imc médio dessa amostra de quatro pessoas? Arredonde o resultado para três casas decimais.
imc <- peso/(altura_m^2)
round(mean(imc), 3)
#resposta: c) 23.614




#8 No R, é possível usar funções de dentro de funções. Veja o exemplo a seguir:
vetor <- "q"
questoes <- paste(rep("q", times = 5), c(1,2,3,4,5), sep = "")
#conquista!!!
print(questoes)





#9 Agora, crie um objeto questoes_ com os seguintes elementos: q_1,q_2,q_3,q_4 e q_5. Em seguida, em uma nova linha, imprima o objeto questoes_ com a função print() para conferir o resultado.
questoes_ <- paste(rep("q", 5), c(1, 2, 3, 4, 5), sep = "_")
print(questoes_)





#10 Agora, tente criar novamente o objeto questoes com os elementos q1,q2,q3,q4 e q5, mas utilizando o operador pipe (|> ou %>%). Em uma terceira linha, imprima o objeto questoes com a função print()
questoes <- questoes |>
  paste(rep("q", 5), c(1, 2, 3, 4, 5), sep = "")
print(questoes)

#correção:
questoes_2 <- rep("q",5) |>
  paste(1:5, sep = "")
print(questoes_2)

#de fato. a função mais interior
# é a primeira a ser rodada. a mais externa
#é sucessiva. "faça a média e, então, arredonde
#faça a repetição e, então, cole
teste <- c(5, 6, 2, 4, 6)
mean(teste)|>
  round(2)
round(mean(teste), 2)

#11 Crie um objeto mil com 1000 valores que tenham uma distribuição normal com média 20 e desvio padrão 5. Em seguida, crie um histograma usando a função básica do R.
mil <- rnorm(n = 1000,
      mean = 20,
      sd = 5)
hist(mil)
#correção: faltou só o set.seed(123)



#12 Use a função replace() para substituir os valores do objeto a que estão como caracteres pelo valor numérico correspondente.
a_12 <- c(1, 2, "três", 4, "cinco")
replace(
  x = a_12,
  list = c(3, 5),
  values = c(3, 5)
)





#13 Extraía o nome das variáveis do banco de dados mtcars e salve num objeto chamado colunas. Em seguinda, imprima o objeto criado.

colunas <- colnames(mtcars)

#data() para conhecer outros dataframes