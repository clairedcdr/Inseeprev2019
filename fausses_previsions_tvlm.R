# Révisions coef tvlm ---------------------

toto = function(tv) {
  datatest = tv$x
  coef = tv$coef
  coef = ts(coef, end = end(datatest), frequency = frequency(datatest))
  predict <- sapply(2:nrow(datatest), function(i) {
    datatest[i, ] %*% coef[i-1, ]
  })
  rmse_res(tv$y[-1] - predict)
}

toto(tvlm_c5_6)

rmse_tvlm_oos = sapply(test, function(x) {
  x$rmse[[2]][4]
})
rmse_tvlm_false_oos = sapply(tvlm, toto)
tvlm_comp = rmse_tvlm_oos > rmse_tvlm_false_oos

revision_coef_tvlm = data.frame(rmse_tvlm_oos, rmse_tvlm_false_oos, tvlm_comp, row.names = names(models))
