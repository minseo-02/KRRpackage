
#' Predict method for KRR
#'
#' @description Predicts new responses using a fitted KRR model.
#'
#' @param object A fitted KRR model from krr_fit().
#' @param newdata New data matrix.
#' @param ... Additional arguments.
#'
#' @return Predicted response vector.
#'
#' @export

predict.krr = function(model, X_new, ...){
  X = model$X
  n = nrow(X)

  n_new = nrow(X_new)
  K_new = matrix(0, ncol = n, nrow = n_new)
  for(i in 1:n_new)
    for(j in 1:n)
      K_new[i, j] = exp(- model$rho * sum((X_new[i, ]- X[j, ])^2))

  pred_values = K_new %*% model$coefficients
  return(pred_values)
}
