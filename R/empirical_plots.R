
library(ggplot2)
library(magrittr)
library(dplyr)
library(readr)

pima <- read_csv("../pima.csv")

lm(diabetes ~ glucose, data = pima) %>%
  use_series("fitted.values") %>%
  min() -> min_predicted_y

scatter_p <- pima %>%
  ggplot(aes(glucose, diabetes)) +
  geom_point(alpha = 0.07, size = 10) +
  labs(x = "Plasma Glucose Concentration",
       y = "Diabetes positive") +
  ylim(min_predicted_y, 1 - min_predicted_y) +
  theme_bw() +
  theme(axis.title = element_text(size = 15))

linear_p <- scatter_p +
  geom_smooth(method = "lm")

logistic_p <- scatter_p +
  geom_smooth(method = "glm",
              method.args = list(family = "binomial"))

pdf(file = "scatterplot.pdf",
    width = 8,
    height = 6)
print(scatter_p)
dev.off()

pdf(file = "linear.pdf",
    width = 8,
    height = 6)
print(linear_p)
dev.off()

pdf(file = "logistic.pdf",
    width = 8,
    height = 6)
print(logistic_p)
dev.off()


