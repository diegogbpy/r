rm(list = ls())

# Utilizando o dataset mobile_price_classification.csv em anexo desenvolva um 
# modelo de regressão multipla em R (função lm()) que defina o limite de preço 
# (price_range) utilizando todas as variáveis/colunas disponíveis no dataset 
# fornecido. 

# Envie o script completo com os comandos R para definição do modelo de 
# regressão logística.

setwd("C:/aulaR")
mobile = read.csv(file = "mobile_price_classification.csv", header = TRUE)
str(mobile)
summary(mobile)
head(mobile)
tail(mobile)
celular = mobile[,c("price_range", "battery_power", "clock_speed", "int_memory",
                    "n_cores", "ram")]
print(head(celular, 20))
modelo = lm(price_range~battery_power+clock_speed+int_memory+n_cores+ram, 
            data = celular)
print(modelo)

intercept = coef(modelo)[1]
print(intercept)
xbat = coef(modelo)[2]
xclo = coef(modelo)[3]
xmem = coef(modelo)[4]
xcor = coef(modelo)[5]
xram = coef(modelo)[6]
print(paste(xbat, xclo, xmem, xcor, xram))


# Exemplo
battery_power = 600
clock_speed = 3
int_memory = 64
n_cores = 6
ram = 3998

# Formula utilizada
preco = intercept + 
  (xbat * battery_power) + 
  (xclo * clock_speed) + 
  (xmem * int_memory) + 
  (xcor * n_cores) + 
  (xram * ram)

preco