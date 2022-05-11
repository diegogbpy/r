# Utilizando o dataset em anexo (students_performance.csv) desenvolva as tarefas descritas abaixo:
   
# 1 [0,25 pontos]) Gere 3 gráficos utilizando o R Base a sua escolha (histograma, gráfico de dispersão, diagrama de caixa, gráfico de barra e/ou coluna, gráfico de pontos ou gráfico de pizza) utilizando qualquer coluna (math score,   reading score ou  writing score) de sua escolha do dataset em anexo  inserindo os gráficos em uma única página;

# 2 [0,25 pontos]) Gere 3 gráficos utilizando o ggplot2 a sua escolha (histograma, gráfico de dispersão, diagrama de caixa, gráfico de barra e/ou coluna, gráfico de pontos ou gráfico de pizza) utilizando qualquer coluna (math score,   reading score ou  writing score) de sua escolha do dataset em anexo  inserindo os gráficos em uma única página;

# 3 [0,25 pontos]) Acrescente ao menos 3 configurações (rótulos de título, eixo, limites dos eixos, cores, aparência geral com temas, tamanho do texto ou legenda) em um dos gráficos gerados acima;

# 4 [0,25 pontos]) Salve 3 arquivos que representem os gráficos dos itens 1, 2 e 3 gerados anteriormente com os seguintes nomes: exn106_graph1, exn106_graph2 e exn106_graph3;

# Envie o script R que endereça os itens acima e os arquivos que foram salvos no item 4.

rm(list = ls())

library(ggplot2)
library(gridExtra)

setwd("C:/aulaR")
desempenho <- read.csv(file = "students_performance.csv", header = TRUE)
head(desempenho, n= 10)
summary(desempenho)

# 1

par(mfrow = c(1,3))
hist(desempenho$math.score, col = "green")
plot(desempenho$reading.score, desempenho$writing.score, 
     col = "black", pch = 18)
hist(desempenho$reading.score, col = "purple")
dev.print(device = pdf, file = " exn106_graph1.pdf")
dev.off()
     
# 2

ggplot(desempenho, aes(math.score)) +
   geom_histogram(col="blue")

ggplot(desempenho, aes(race.ethnicity, reading.score, fill = race.ethnicity)) +
   geom_boxplot()

ggplot(desempenho, aes(gender, math.score, fill = gender) ) +
   geom_boxplot()

# 3  

par(mfrow = c(1,3))
hist(desempenho$math.score, 
     main = "Histograma de Math Score",
     col = "green",
     xlab = "Math Score",
     ylab = "Frequência",
     breaks = 50)
dev.print(device = pdf, file = "exn106_graph2.pdf")

plot(desempenho$reading.score, desempenho$writing.score,
     main = "Scatter plot de Writing e Reading Score",
     col = c("red", "black"),
     pch = 18, 
     xlab = ("Reading Score (Red)"),
     ylab = ("Writing Score (Black)"))
dev.print(device = pdf, file = " exn106_graph2.pdf")

hist(desempenho$reading.score,
     main = "Histograma de Reading Score",
     col = "blue",
     xlab = "Reading Score",
     ylab = "Frequência",
     breaks = 10)
dev.print(device = pdf, file = " exn106_graph2.pdf")
dev.off()

graf1 = ggplot(desempenho, aes(math.score)) +
                geom_histogram(col="blue", binwidth = 1) + 
   ggtitle("Math Score Histogram") + xlab("Math Score") + 
   ylab("Frequência") + 
   theme(plot.title = element_text(hjust = 0.5))
dev.print(device = pdf, file = " exn106_graph3.pdf")

graf2 = ggplot(desempenho, aes(race.ethnicity, reading.score, 
                               fill = race.ethnicity)) + 
   geom_boxplot() + ggtitle("Boxplot Race vs Reading Score") + 
   xlab("Race Ethnicity") + ylab("Reading Score") + 
   theme(plot.title = element_text(hjust = 0.5))
dev.print(device = pdf, file = " exn106_graph3.pdf")

graf3 = ggplot(desempenho, aes(gender, math.score, fill = gender) ) + 
   geom_boxplot() + ggtitle("Boxplot Gender vs Math score") + 
   theme(plot.title = element_text(hjust = 0.5)) +
   ylab("Math Score")

grid.arrange(graf1, graf2, graf3, ncol= 1)
dev.print(device = pdf, file = " exn106_graph3.pdf")
dev.off()
