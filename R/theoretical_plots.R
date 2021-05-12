
library(ggplot2)

odds <- function(p)
  p / (1 - p)

sigmoid_p <- ggplot() +
  geom_function(fun = plogis, color = "red", n = 10000) +
  xlim(-10, 10) +
  geom_hline(yintercept = c(0, 1), linetype = "dashed") +
  geom_point(aes(x = 0, y = 0.5), size = 3) +
  labs(y = "S(x)", title = "Sigmoid (Logistic) Function") +
  theme_bw() +
  theme(axis.text = element_text(size = 15),
        axis.title = element_text(size = 15))


logit_p <- ggplot() +
  geom_function(fun = qlogis, aes(color = "red"), n = 10000) +
  geom_function(fun = odds, aes(color = "blue"), n = 10000) +
  ylim(-10, 10) +
  labs(x = "Probability", title = "Probability, Odds, and Logit (Log Odds)") +
  theme_bw() +
  theme(axis.text = element_text(size = 15),
        axis.title = element_text(size = 15)) +
  scale_color_identity(name = "Functions",
                       labels = c("Odds", "Logit"),
                       guide = "legend")


pdf(file = "sigmoid.pdf",
    width = 8,
    height = 6)
print(sigmoid_p)
dev.off()

pdf(file = "logit.pdf",
    width = 8,
    height = 6)
print(logit_p)
dev.off()
