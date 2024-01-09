# Package installation
install.packages("survival")
install.packages("survminer")
install.packages("gtsummary")

# Package loading
library(survival)
library(survminer)
library(gtsummary)

# Set the random seed for reproducibility
set.seed(45256)

# Number of observations
n <- 1000

# Simulation of explanatory variables
X1 <- rnorm(n, mean = 50, sd = 10)
X2 <- rnorm(n, mean = 30, sd = 5)
X3 <- rnorm(n, mean = 5, sd = 2)
X4 <- sample(0:1, n, replace = TRUE)
X5 <- sample(0:3, n, replace = TRUE)
X6 <- sample(0:6, n, replace = TRUE)
X7 <- sample(0:1, n, replace = TRUE)

# Simulation of survival variable (time until event)
TIME <- rexp(n, rate = 0.01)
# Simulation of survival event variable (0: no event, 1: event)
Y <- ifelse(runif(n) > 0.2, 0, 1)

# Simulation of treatment variable
A <- sample(0:1, n, replace = TRUE)

# Creating the dataframe
sim_data <- data.frame(
  MRNO = 1:n,
  X1 = X1,
  X2 = X2,
  X3 = X3,
  X4 = X4,
  X5 = X5,
  X6 = X6,
  X7 = X7,
  A = A,
  TIME = TIME,
  Y = Y
)

# Survival function
km0 <- survfit(Surv(time = TIME, event = Y) ~ A, data = sim_data)
km0
# Summary
summary(km0)

# Log-rank test
logrank_test <- survdiff(Surv(time = TIME, event = Y) ~ A, rho = 0)
logrank_test

# Plot
ggsurv0 <- ggsurvplot(
  km0,
  data = sim_data,
  fun = "pct",
  xlab = "Times",
  ylab = "Recurrence Probability (%)",
  censor = TRUE,
  ggtheme = theme_bw()
)
ggsurv0

# Comparison of survival functions by exposure groups adjusting by stratification
km1 <- survfit(Surv(time = TIME, event = Y) ~ A + strata(X4), data = sim_data)
km1
# Plot
ggsurv1 <- ggsurvplot(
  km1,
  data = sim_data,
  fun = "pct",
  xlab = "Times",
  ylab = "Recurrence Probability (%)",
  censor = TRUE,
  ggtheme = theme_bw()
)
ggsurv1
# Comparison of event rates by exposure groups using a Cox model
## Raw comparison (without adjustment): Raw model
fitcox0 <- coxph(Surv(time = TIME, event = Y) ~ A, data = sim_data)
summary(fitcox0)

## Adjusted model
fitcox1 <-
  coxph(
    Surv(time = TIME, event = Y) ~ A + X1 + X2 + X3 + X4 +
      X5 + X6 + X7, data = sim_data
  )
summary(fitcox1)

# Table regression output with hazard ratios
tbl_regression(fitcox1, exponentiate = TRUE)
