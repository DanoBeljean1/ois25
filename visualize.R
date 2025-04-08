install.packages("ggplot2")
install.packages("reshape2")
install.packages("corrplot")

library(ggplot2)
library(reshape2)

data <- mtcars
cor_matrix <- cor(data)
cor_melt <- melt(cor_matrix)

ggplot(cor_melt, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Corrélation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1)) +
  coord_fixed() +
  labs(title = "Carte de chaleur des corrélations - mtcars",
       x = "",
       y = "")
