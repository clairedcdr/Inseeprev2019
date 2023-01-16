
# Comparaisons rmse_prev out of sample  ------------------------

rmse_oos = sapply(test_model_variant, function(test) {
  test$rmse[2]
})
comparaison_rmse_oos = lapply(rmse_oos, sort)

rmse_oos_stable = sapply(test_model_invariant, function(test) {
  test$rmse[2]
})
comparaison_rmse_oos_stable = lapply(rmse_oos_stable, sort)


sapply(comparaison_rmse_oos_stable, `[`, 1)
sapply(comparaison_rmse_oos, `[`, 1)

# Comparaisons rmse_prev in sample ---------------------

rmse_is = sapply(test_model_variant, function(test) {
  test$rmse[1]
})
comparaison_rmse_is = lapply(rmse_oos, sort)

rmse_is_stable = sapply(test_model_invariant, function(test) {
  test$rmse[1]
})
comparaison_rmse_is_stable = lapply(rmse_oos_stable, sort)

sapply(comparaison_rmse_is_stable, `[`, 1)
sapply(comparaison_rmse_is, `[`, 1)
