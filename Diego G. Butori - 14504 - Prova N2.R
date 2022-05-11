rm(list = ls())
setwd("C:/aulaR")
library(ggplot2)
library(gridExtra)
library(dplyr)
# 1 [0,3 pontos]) Carregue o dataset temperatura.csv em anexo e apresente uma 
# sumarização (summary) do dataframe carregado.
temperatura = read.csv(file = "temperatura.csv", header = TRUE)
summary(temperatura)

# 2) Corrija os problemas abaixo do dataset temperatura.csv carregado 
# anteriormente:
  
# 2.1 [0,2 pontos]) Remova as colunas sem nome e valores
temperatura = temperatura[ ,1:13]
str(temperatura)

# 2.2 [0,2 pontos]) A coluna "precipitacao" possui fatores que deveriam ser 
# corrigidos por erro de digitação, com "X" a mais ao final.
unique(temperatura$precipitacao)
temperatura$precipitacao[which(temperatura$precipitacao == "ChuvaX")] = "Chuva"
temperatura$precipitacao[which(temperatura$precipitacao == "NeveX")] = "Neve"

# 2.3 [0,2 pontos]) Elimine as linhas duplicadas
sum(duplicated(temperatura))
temperatura = unique(temperatura)
row.names(temperatura) = 1:nrow(temperatura)
str(temperatura)

# 3 [0,3 pontos]) Gere 2 gráficos utilizando o R Base a sua escolha 
# (histograma, gráfico de dispersão, diagrama de caixa, gráfico de barra e/ou 
# coluna, gráfico de pontos ou gráfico de pizza) utilizando qualquer coluna de 
# sua escolha do dataset temperaturas.csv  carregado e/ou corrigido 
# anteriormente inserindo os gráficos em uma única página.
head(temperatura)
temp_graf = ggplot(temperatura, aes(precipitacao, umidade, 
                         fill = precipitacao)) + 
  geom_boxplot() + ggtitle("Precipitação e Umidade") + 
  xlab("Precipitação") + ylab("Umidade") + 
  theme(plot.title = element_text(hjust = 0.5))

temp_c = ggplot(temperatura, aes(temperatura_c)) +
  geom_histogram(col="blue")

grid.arrange(temp_graf, temp_c, ncol= 1)
dev.print(device = pdf, file = "graficos_prova.pdf")
dev.off()

# 4 [0,8 pontos]) Faça uma função que receba como parâmetro um dataframe 
# carregado e/ou corrigido do dataset temperatura.csv e retorne os dados que 
# estão no intervalo de temperaturas (temperatura_c) passados também como
# parâmetros. Demonstre o uso da função desenvolvida.
# Assinatura típica da função:
#  filtro_temperatura <- function( temperaturas, temper_ini, temper_fim)
minha_temperatura = function(temperaturas, temper_ini, temper_fim){
  filtrado = temperatura$temperatura_c
  final = filtrado[between(filtrado, temper_ini, temper_fim)]
  return(final)
}
minha_temperatura(temperatura, 1, 1.1)

# Regressão Linear Simples
# 5 [1,0 pontos]) Existe uma relação entre umidade e temperatura 
# (temperatura_c)? E entre umidade e temperatura aparente 
# (temperatura_aparente_c)? Você pode prever a temperatura aparente 
# (temperatura_c) dada a umidade?
# Utilizando regressão linear do R project destaque nos resultados obtidos da 
# análise de regressão da umidade e temperatura_c, assim como, umidade e 
# temperatura_aparente_c, se existe ou não uma relação nestas regressões 
# calculadas. Também deve-se entregar a fórmula final de regressão para prever
# a temperatura aparente (temperatura_c) dada a umidade.
relacao = lm(temperatura$umidade~temperatura$temperatura_c)
print(relacao)
print(summary(relacao))

# Existe relação
# Formula da predicao de (temperatura = 0.88930 + (-0.01294 * umidade))
temperatura_desejada = 38
temperat = 0.88930 + (-0.1294 * temperatura_desejada)
print(temperat)

relacao_2 = lm(temperatura$umidade~temperatura$temperatura_aparente_c)
print(relacao_2)
print(summary(relacao_2))

# Existe relação
# Formula da predicao de (temperatura_aparente = 0.85443 + (-0.01101 * umidade))
temperatura_apa_desejada = 12
temperat_apa = 0.85443 + (-0.01101 * temperatura_apa_desejada)
print(temperat_apa)
