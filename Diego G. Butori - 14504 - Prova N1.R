# 1 [0,1 pontos]) Desenvolva um script em R que declare 3 variáveis quaisquer e implemente uma expressão que utilize o uso de exponenciação e resto com as variáveis declaradas.

# QUestão 1:
var1 = 2
var2 = 3
var3 = 15

(var3 ^ var2) %% var1


# 2 [0,1 pontos]) Desenvolva um script em R que carregue o dataset de Jogos Android (android-games.csv) e apresente uma sumarização (summary) dos jogos no dataset. Os detalhes do conteúdo do dataset Android Games pode ser obtido em https://rebrand.ly/IPBDAndroidGames .

# QUestão 2:
setwd("C:/aulaR")
android_g = read.csv(file = "android-games.csv", header = TRUE)
summary(android_g)

# 3 [0,1 pontos]) Crie um vetor de inteiros em R com números entre 1000 e 2000.

# QUestão 3:
vector = c(1000:2000)

# 4 [0,1 pontos]) Crie um vetor de inteiros  em R com os números entre 30 e 90 com cada elemento repetido 2 vezes.

# QUestão 4:
rep_vector = rep(30:90, 2)
rep_vector

# 5 [0,1 pontos]) Crie um vetor em R com os 5 primeiros números fibonaccis e posteriormente eleve cada elemento na potência de 3.

# QUestão 5:
fibo = c(1, 2, 3, 5, 8)
fibo = fibo ^ 5
fibo

# 6 [0,1 pontos]) Apresente um vetor de inteiros em R com números entre 300 e 900 com os números de forma decrescente, ou seja, na primeira posição do vetor deve-se ter o número 900 e na última o 300.

# QUestão 6:
rotcev = c(900:300)

# 7 [0,1 pontos]) Desenvolva um fator (factor) em R ordenado de categorias de natação: Pré-Mirim, Mirim, Petiz, Infantil, Juvenil, Junior e Sênior.

# QUestão 7:
categorias = c("Infantil", "Juvenil", "Junior", "Pre-Mirim", "Mirim", "Petiz",
               "Senior")
categorias = ordered(factor(categorias, levels = c("Pre-Mirim", "Mirim", "Petiz", 
                                             "Infantil", "Juvenil", "Junior", 
                                             "Senior")))
categorias

# 8 [0,1 pontos]) Crie uma lista em R que contenha ao menos 3 elementos com tipos de dados distintos.

# QUestão 8:
uma_lista_em_r = list(1, 1.2, TRUE, FALSE, "Uma lista bonita")

# 9 [0,1 pontos]) Desenvolva uma matriz em R de terceira ordem quadrada (3 x 3) preenchida com números sequenciais únicos saltando de 2 em 2. Ex: 1, 3, 5, 7, 9, 11, etc.

# QUestão 9:
matriz = matrix(data = seq(from = 1, to = 20, by = 2), nr = 3, nc = 3)
matriz

# 10 [0,1 pontos]) Crie um data frame em R que armazene uma lista de compras de no mínimo 4 itens contendo o código do item, descrição, quantidade e valor unitário.

# QUestão 10:
lista_compras = data.frame(Codigo_Item = 1:4, 
                 Descricao = c("Sabonete", "Pizza", "Mat-Inset", "Cerveja"), 
                 Quantidade = c(2, 1, 3, 36),
                 Valor_unitario = c(2.39, 15.99, 3.79, 3.49))
lista_compras

# 11) O dataset "android-games.csv" possui vários problemas que precisam ser corrigidos.

# Problemas:
  
# 11.1 [0,3 pontos]) Remova as colunas sem nome e valores

# QUestão 11.1:
android_g = read.csv(file = "android-games.csv", header = TRUE,
                       sep = ",",
                       na.strings = "",
                       strip.white = TRUE,
                       stringsAsFactors = TRUE)
summary(android_g)
str(android_g)
android_g = android_g[ ,1:15]
str(android_g)

# 11.2 [0,3 pontos]) A coluna "category" possui fatores que deveriam ser agrupados por erro de digitação, com "S" a mais ao final.

# QUestão 11.2:
unique(android_g$category)
android_g$category[which(android_g$category == "GAME ACTIONS")] = "GAME ACTION"
android_g$category[which(android_g$category == "GAME STRATEGYS")] = "GAME STRATEGY"
android_g$category = factor(android_g$category)
unique(android_g$category)

# 11.3 [0,3 pontos]) Uma das colunas esta com valor claramente incorreto (acima ou abaixo)

# QUestão 11.3:
summary(android_g)
which.min(android_g$average.rating)
android_g$average.rating[which.min(android_g$average.rating)] = 3.090

# 11.4 [0,3 pontos]) Tem linhas duplicadas

# QUestão 11.4:
sum(duplicated(android_g))
android_g = unique(android_g)
row.names(android_g) = 1:nrow(android_g)

# 12) Utilizando o dataset em android-games.csv corrigido desenvolva as tarefas descritas abaixo:

# 12.1 [0,3 pontos]) Gere 3 gráficos utilizando o R Base a sua escolha (histograma, gráfico de dispersão, diagrama de caixa, gráfico de barra e/ou coluna, gráfico de pontos ou gráfico de pizza) utilizando qualquer coluna (math score, reading score ou  writing score) de sua escolha do dataset em anexo inserindo os gráficos em uma única página.

# QUestão 12.1:
hist(android_g$average.rating, col = 'purple')
plot(android_g$installs, android_g$average.rating, 
     col = "grey", pch = 18)
plot(android_g$total.ratings, android_g$average.rating, 
     pch = 4, 
     col = "blue")

# 12.2 [0,3 pontos]) Gere 3 gráficos utilizando o ggplot2 a sua escolha (histograma, gráfico de dispersão, diagrama de caixa, gráfico de barra e/ou coluna, gráfico de pontos ou gráfico de pizza) utilizando qualquer coluna de sua escolha do dataset em anexo inserindo os gráficos em uma única página.

# QUestão 12.2:
library(ggplot2)

ggplot(android_g, aes(average.rating)) +
  geom_histogram(col="blue")

ggplot(android_g, aes(paid, average.rating, fill = paid)) +
  geom_boxplot()

ggplot(android_g, aes(category, average.rating, fill = category) ) +
  geom_boxplot()


# 12.3 [0,3 pontos]) Acrescente ao menos 3 configurações (rótulos de título, eixo, limites dos eixos, cores, aparência geral com temas, tamanho do texto ou legenda) em um gráfico de sua escolha.

# QUestão 12.3:
ggplot(android_g, aes(average.rating)) +
  geom_histogram(col="blue",  binwidth = 0.1)
  ggtitle("Average Rating Histogram") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(android_g, aes(paid, average.rating, fill = paid)) +
  geom_boxplot() +
  ggtitle("Paid vs Average Rating") +
  xlab("Paid Games") + ylab("Average Rating") + 
  theme(plot.title = element_text(hjust = 0.5))

ggplot(android_g, aes(category, average.rating, fill = category)) +
  geom_boxplot() +
  ggtitle("Category / Average Rating") +
  xlab("Category") + ylab("Average Rating") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
