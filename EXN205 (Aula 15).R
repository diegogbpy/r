# Instalação do pacote
install.packages("ggplot2")
# Carregar pacote
library(ggplot2)
# Carregar Dataset
data("iris")
# Verificar os dados
head(iris)
# Gerar gráfico boxplot a partir do pacote ggplot2
# Gráfico demonstrando relação entre espécie e sepa.
graph = ggplot(iris, aes(Species, Sepal.Length, 
                       fill = Species)) + 
  geom_boxplot() + ggtitle("Species Sepal Length") + 
  xlab("Species") + ylab("Sepal Length") + 
  theme(plot.title = element_text(hjust = 0.5))
graph
