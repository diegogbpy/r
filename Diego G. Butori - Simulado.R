

# 1 [0,056 pontos]) Desenvolva um script em R que declare 3 variáveis quaisquer e implemente uma expressão que utilize ao menos 3 operações básicas de soma, subtração, multiplicação, divisão, exponenciação ou resto.

# Questão 1

var1 = 2
var2 = 3
var3 = 4
soma = var1 + var2
sub = var3 - var1
mult = var1 * var2 * var3

# 2 [0,059 pontos]) Desenvolva um script em R que carregue o dataset de Heart Attack (heart_attack.csv) e apresente uma sumarização (summary) dos filmes no dataset.

# Questão 2

heart_attack = read.csv("Heart_Attack.csv", header = TRUE)
summary(heart_attack)

# 3 [0,059 pontos]) Crie um vetor de inteiros em R com números entre 13 e 131.

# Questão 3

vetor = c(13:131)
vetor

# 4 [0,059 pontos]) Crie um vetor de inteiros  em R com os números entre 36 e 360 com cada elemento repetido 2 vezes.

# Questão 4

vector = rep(36:360, 2)
vector

# ou 

vec = seq(from=36, to=360, by=2)
vec

# 5 [0,059 pontos]) Crie um vetor em R com os 5 primeiros números primos e posteriormente eleve cada elemento na potência de 5.

# Questão 5
primos = c(2, 3, 5, 7, 11)
primos = primos ^ 5
primos

# 6 [0,059 pontos]) Apresente um vetor de inteiros em R com números entre 1000 e 2000 com os números de forma decrescente, ou seja, na primeira posição do vetor deve-se ter o número 2000 e na última o 1000.

# Questão 6

inverso = c(2000:1000)
inverso

# 7 [0,059 pontos]) Desenvolva um fator (factor) em R ordenado de categorias de futebol: Sub-17, Sub-20, Adulto e Vetereno.

# Questão 7

futibas = factor(c("Sub-17", "Sub-20", "Adulto", "Veterano"), levels = c("Sub-17", "Sub-20", "Adulto", "Veterano"))
futibas

# 8 [0,059 pontos]) Crie uma lista em R que contenha ao menos 3 elementos com tipos de dados distintos.

# Questão 8

conjunto = list(13, c("Mundo,", "Olá!"), c(TRUE, FALSE, 42.0))

# 9 [0,059 pontos]) Desenvolva uma matriz em R de quarta ordem quadrada (4 x 4) preenchida com números sequenciais únicos.

# Questão 9

matriz = 1:16
dim(matriz) = c(4, 4)
matriz

# ou

matr = matrix(data = 1:16, nrow = 4, ncol = 4, byrow = TRUE)
matr

# 10 [0,059 pontos]) Crie um data frame em R que armazene 5 músicas contendo o nome da música e banda.

# Questão 10

mus_band = data.frame(nome_mususica = c("Musica1", "Musica2", "Musica3", "Musica4", "Musica5"), 
                 Banda = c("Banda1", "Banda2", "Banda3", "Banda4", "Banda5"))

# 11) O dataset "netflix_titles01.csv" possui vários problemas que precisam ser corrigidos.

#Corrija os problemas listados abaixo no dataset.

ha_data = read.csv("netflix_titles01.csv", header = TRUE)
summary(ha_data)

# 11.1 [0,059 pontos]) Remover colunas com dados vazios

# Questão 11.1

ha_data = ha_data[ ,-c(2,5,10)] # o espaço em branco representa todas as linhas (das colunas especificadas)

# 11.2 [0,059 pontos]) A coluna "type" possui fatores que deveriam ser agrupados por erro de digitação

# Questão 11.2

str(ha_data)
levels(ha_data$type)
ha_data$type[ which(ha_data$type == "Movies") ] = "Movie"
unique(ha_data$type)
ha_data$type[ which(ha_data$type == "TV Shows") ] = "TV Show"
unique(ha_data$type)
factor(ha_data$type)
ha_data$type = factor(ha_data$type)
levels(ha_data$type)
unique(ha_data$type)

# 11.3 [0,059 pontos]) Uma das colunas/medidas esta com valor claramente incorreto (acima ou abaixo)

# Questão 11.3

summary(ha_data)
witch.max(ha_data$release_year) # informa a linha
ha_data$release_year[ witch.max(ha_data$release_year) ] = 2015

# 11.4 [0,059 pontos]) Tem linhas duplicadas

# Questão 11.4

duplicated(ha_data)
sum(duplicated(ha_data))
ha_data = unique(ha_data)
row.names(ha_data) = 1:nrow(ha_data)

# 12) Utilizando o dataset "snail_feeding01.csv" desenvolva as tarefas descritas abaixo:
  
#  12.1 [0,059 pontos]) Gere 2 gráficos utilizando o R Base a sua escolha (histograma, gráfico de dispersão, diagrama de caixa, gráfico de barra e/ou coluna, gráfico de pontos ou gráfico de pizza) utilizando qualquer coluna (math score,   reading score ou  writing score) de sua escolha do dataset em anexo inserindo os gráficos em uma única página;

# Questão 12.1

snails = read.csv("snail_feeding01.csv", header = TRUE, stringsAsFactors = TRUE)
summary(snails)

par(mfrow = c(2 , 1)) # c(linha, coluna)
hist(snails$Temp)
plot(Depth ~ Temp, data = snails)


# 12.2 [0,059 pontos]) Gere 2 gráficos utilizando o ggplot2 a sua escolha (histograma, gráfico de dispersão, diagrama de caixa, gráfico de barra e/ou coluna, gráfico de pontos ou gráfico de pizza) utilizando qualquer coluna de sua escolha do dataset em anexo  inserindo os gráficos em uma única página;

# Questão 12.2

install.packages("gridExtra")

library(gridExtra)
library(ggplot2)

par(mfrow = c(2,1))
plot1 = ggplot(snails, aes(Temp)) + geom_histogram(col="blue")

plot2 = ggplot(snails, aes(x = Depth, y = Temp)) + geom_point()
grid.arrange(plot1, plot2, ncol=1, nrow=2)

# 12.3 [0,059 pontos]) Acrescente ao menos 3 configurações (rótulos de título, eixo, limites dos eixos, cores, aparência geral com temas, tamanho do texto ou legenda) em um gráfico de sua escolha

# Questão 12.3

ggplot(snails, aes(Temp)) + 
  geom_histogram(col="blue") + # Cor
  xlab("Temperatura") + # Nome X
  ylab("Frequência") + # Nome Y
  ggtitle("Histograma de Temperatura") # Título do gráfico
