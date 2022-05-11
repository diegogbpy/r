rm(list = ls())
# demonstre utilizando a testagem de hipóteses (t.test) qual tratamento 
# (PlantGrowth$group igual a trt1 ou trt2) permitiu um melhor rendimento nas
# plantas comparado ao grupo de controle (PlantGrowth$group igual a ctrl).

# Lembre-se que o p-value é essencial para determinar a hipótese nula e também 
# serve como parâmetro comparativo para determinar a melhor escolha entre 
# diferentes experimentos.

# Comparar trt1 com ctrl
#          e
# Comparar trt2 com ctrl

plant = PlantGrowth
summary(plant)
plantinhas = split(plant, plant$group)
plantinhas
trata1 = data.frame(plantinhas$trt1)
trata2 = data.frame(plantinhas$trt2)
controles = data.frame(plantinhas$ctrl)

teste1 = t.test(trata1$weight, controles$weight, paired = TRUE)
teste1

teste2 = t.test(trata2$weight, controles$weight, paired = TRUE)
teste2

# trata1: p-value = 0.3463
# trata2: p-value = 0.1101
# Nenhuma das hip�teses foi nula, valores acima da margem de corte (5%)
# O experimento com melhor desempenho foi o tratamento 1.