# Plot_ssm_lm_best ----------

plot(ssm_best$model_c1_1, choice = "filtered")
plot(ssm_best$model_c1_2, choice = "filtered")
plot(ssm_best$model_c3_1, choice = "filtered")
plot(ssm_best$model_c4_2, choice = "filtered")
plot(ssm_best$model_c4_3, choice = "filtered")
plot(ssm_best$model_c5_2, choice = "filtered")
plot(ssm_best$model_c5_6, choice = "filtered")

plot(ssm_best$model_c1_1, choice = "smoothed")
plot(ssm_best$model_c1_2, choice = "smoothed")
plot(ssm_best$model_c3_1, choice = "smoothed")
plot(ssm_best$model_c4_2, choice = "smoothed")
plot(ssm_best$model_c4_3, choice = "smoothed")
plot(ssm_best$model_c5_2, choice = "smoothed")
plot(ssm_best$model_c5_6, choice = "smoothed")

plot(ssm_best$model_c1_1, choice = "filtering")
plot(ssm_best$model_c1_2, choice = "filtering")
plot(ssm_best$model_c3_1, choice = "filtering")
plot(ssm_best$model_c4_2, choice = "filtering")
plot(ssm_best$model_c4_3, choice = "filtering")
plot(ssm_best$model_c5_2, choice = "filtering")
plot(ssm_best$model_c5_6, choice = "filtering")


# Comparaisons -------------

ssm_best = lapply(models, ssm_lm_best)
names(ssm_best)
ssm_best_oos = lapply(models, ssm_lm_best_oos)

smoothed_ssm_best = lapply(ssm_best, function(x){
  x$rmse_best_model_smoothed
})
filtering_ssm_best = lapply(ssm_best_oos, function(x){
  x$rmse_best_model_filtering
})


rmse_is_all_ssm <- lapply(seq_along(smoothed_ssm_best), function(i) {
  c(test[[i]]$rmse[[1]], smoothed_ssm_best[[i]])
})
names(rmse_is_all_ssm) <- names(test)

comparaison_rmse_is_all_ssm = lapply(rmse_is_all_ssm, function(x) {
  sort(unlist(x))
})


rmse_oos_all_ssm <- lapply(seq_along(filtering_ssm_best), function(i) {
  c(test[[i]]$rmse[[2]], filtering_ssm_best[[i]])
})
names(rmse_oos_all_ssm) <- names(test)

comparaison_rmse_oos_all_ssm = lapply(rmse_oos_all_ssm, function(x) {
  sort(unlist(x))
})
