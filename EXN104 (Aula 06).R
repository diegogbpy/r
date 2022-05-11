# O dataset em anexo (telecom_users.csv) possui os problemas que precisam ser corrigidos.
# Corrija os problemas listados abaixo no dataset e envie nesta tarefa um  arquivo contendo o script R que corrijou os problemas além de um arquivo csv chamado de "telecom_users_ok.csv" com os dados corrigidos.

# Problemas:
# 1 [0,25 pontos]) Colunas sem nome e valores
# 2 [0,25 pontos]) As colunas gender e InternetService possuem fatores que deveriam ser agrupados por erro de digitação ("s" a mais, espaços, tamanho de caracteres diferentes, etc)
# 3 [0,25 pontos]) Uma das colunas/medidas esta com valor claramente incorreto (acima ou abaixo)
# 4 [0,25 pontos]) Tem linhas duplicadas

setwd("C:/aulaR/IPBD202101R")

tele_com <- read.csv(file = "telecom_users.csv",
                       header = TRUE,
                       sep = ",",
                       na.strings = "",
                       strip.white = TRUE,
                       stringsAsFactors = TRUE)

summary(tele_com)

names(tele_com)

str(tele_com)

tele_com <- tele_com[ ,1:21]

names(tele_com)

str(tele_com)

unique(tele_com$gender)

levels(tele_com$gender)

tele_com$gender[which(tele_com$gender == "Males")] = "Male"

tele_com$gender[which(tele_com$gender == "Females")] = "Female"

tele_com$gender = factor(tele_com$gender)

unique(tele_com$gender)

levels(tele_com$gender)

duplicated(tele_com)

sum(duplicated(tele_com))

which(duplicated(tele_com))

tele_com[which(duplicated(tele_com)),]

tele_com[13:15,]

tele_com = unique(tele_com)

row.names(tele_com) = 1:nrow(tele_com)

summary(tele_com)

summary(tele_com$SeniorCitizen)

summary(tele_com$MonthlyCharges)

which.max(tele_com$TotalCharges)

str(tele_com)

# tele_com[which.min(tele_com$MonthlyCharges), 19] = 7008

tele_com$TotalCharges[which.min(tele_com$TotalCharges)] = 7008

summary(tele_com$TotalCharges)

write.csv(tele_com, file = "tele_com_ok.csv", row.names = FALSE)

save(tele_com, file = "tele_com.Rdata")

rm(list = ls())