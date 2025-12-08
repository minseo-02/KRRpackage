
#' Kernel Ridge Regression fit
#'
#' @description Fits a Kernel Ridge Regression (KRR) model using a Gaussian kernel.
#'
#' @param X Matrix or data frame of predictors.
#' @param y Response vector.
#' @param rho Kernel bandwidth parameter.
#' @param lambda Penalty parameter.
#'
#' @return A list containing:
#'   \item{alpha}{Estimated dual coefficients}
#'   \item{X}{Training data}
#'   \item{rho}{Kernel bandwidth}
#'   \item{lambda}{Penalty parameter}
#'
#' @export

krr_fit = function(X, y, rho = 1, lambda = 0.0001){
  n = nrow(X)
  K = matrix(0, ncol = n, nrow = n)
  for(i in 1:n)
    for(j in 1:n)
      K[i, j] = exp(- rho * sum((X[i, ]- X[j, ])^2))

  coef_hat = solve(K + diag(lambda, n), y)

  rslt = list("coefficients" = coef_hat,
              "fitted_values" = K %*% coef_hat,
              "rho" = rho,
              "X" = X,
              "y" = y)
  class(rslt) = "krr"

  return(rslt)
}
