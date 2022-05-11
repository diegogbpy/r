# Os datasets em anexo (winemag-data-01.csv e winemag-data-02.csv) precisam ser rearranjados e manipulados em acordo com os itens abaixo:
# 1 [0,25 pontos]) Unifique os datasets pela variável ID para que todos os dados fiquem em apenas um data frame;
# 2 [0,25 pontos]) Utilizando o separador "_" faça um desmembramento da variável/coluna country_province em duas colunas chamadas de country e province;
# 3 [0,25 pontos]) Remova a variável country_province do data frame criado no item 1;
# 4 [0,25 pontos]) Salve o data frame gerado no item em um arquivo chamado de winemag-data.csv;

# Envie o script R que endereçaram os itens acima e o arquivo winemag-data.csv nesta tarefa.

setwd("C:/aulaR")
winemag1 = read.csv("winemag-data-01.csv", header = TRUE)
winemag2 = read.csv("winemag-data-02.csv", header = TRUE)

library(dplyr)
library(tidyr)

str(winemag1)
str(winemag2)

winemag_un = inner_join(winemag1, winemag2, 
                        by = c("ID"))
str(winemag_un)

head(winemag1, n=10)
head(winemag2, n=10)
head(winemag_un, n=20)

str(winemag_un)
winemag_un <- separate(winemag_un, country_province, c("Country", "Province"), 
                       sep = "_",
                       remove = TRUE)

str(winemag_un)
write.csv(winemag_un, file = "winemag_un_ok.csv", row.names = FALSE)
