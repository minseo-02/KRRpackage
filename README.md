
# KRR: Kernel Ridge Regression Package

This package implements Kernel Ridge Regression (KRR) using a Gaussian kernel.

- `krr_fit()` : KRR 모형 적합 (dual coefficients 추정)
- `krr_predict()` : S3 predict 메서드로 새로운 데이터에 대한 예측 수행

---

## 📌 Installation

```r
devtools::install_github("minseo-02/KRRpackage")
```
---

## 📌 Example: Regression Data Simulation, Fitting, Prediction

```r
library(MyKRR)

set.seed(1)
n <- 80
X <- matrix(runif(n), ncol = 1)
f <- function(x) sin(2*pi*x)
y <- f(X[,1]) + rnorm(n, sd = 0.1)

fit <- krr_fit(X, y, rho = 5, lambda = 0.01)
pred <- predict(fit, X)

plot(X, y)
lines(X, pred, col="red")
```

---

## Returned Object

- `coefficients`
- `fitted_values`
- `X`
- `y`
- `rho`
- `lambda`

---

## Author

- 이민서

