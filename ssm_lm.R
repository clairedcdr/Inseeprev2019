# Modèles ---------
ssm_best_c1_1 = ssm_lm_best(model_c1_1)
ssm_best_c1_2 = ssm_lm_best(model_c1_2)
ssm_best_c1_3 = ssm_lm_best(model_c1_3)
ssm_best_c1_4 = ssm_lm_best(model_c1_4)
ssm_best_c1_5 = ssm_lm_best(model_c1_5)
ssm_best_c1_6 = ssm_lm_best(model_c1_6) #pb
ssm_best_c1_7 = ssm_lm_best(model_c1_7) #pb
ssm_best_c1_8 = ssm_lm_best(model_c1_8)

ssm_best_c3_1 = ssm_lm_best(model_c3_1)
ssm_best_c3_2 = ssm_lm_best(model_c3_2) #pb
ssm_best_c3_3 = ssm_lm_best(model_c3_3) #pb
ssm_best_c3_4 = ssm_lm_best(model_c3_4) #pb
ssm_best_c3_5 = ssm_lm_best(model_c3_5) #pb
ssm_best_c3_6 = ssm_lm_best(model_c3_6)

ssm_best_c4_1 = ssm_lm_best(model_c4_1) #pb
ssm_best_c4_2 = ssm_lm_best(model_c4_2)
ssm_best_c4_3 = ssm_lm_best(model_c4_3)
ssm_best_c4_4 = ssm_lm_best(model_c4_4) #pb
ssm_best_c4_5 = ssm_lm_best(model_c4_5)
ssm_best_c4_6 = ssm_lm_best(model_c4_6)

ssm_best_c5_1 = ssm_lm_best(model_c5_1) #pb
ssm_best_c5_2 = ssm_lm_best(model_c5_2)
ssm_best_c5_3 = ssm_lm_best(model_c5_3)
ssm_best_c5_4 = ssm_lm_best(model_c5_4)
ssm_best_c5_5 = ssm_lm_best(model_c5_5) #pb
ssm_best_c5_6 = ssm_lm_best(model_c5_6)

ssm_best_manuf_1 = ssm_lm_best(model_manuf_1) #pb
ssm_best_manuf_2 = ssm_lm_best(model_manuf_2) #pb
ssm_best_manuf_3 = ssm_lm_best(model_manuf_3) #pb


intersect(names(model_variant), names(model_wo_dummy))
names(model_dummy)


# Model_c5_2 -------

fitted_best_smo_c5_2 = ssm_best_c5_2$model$var_move_1_int_move_100$data[,1] - ssm_best_c5_2$model$var_move_1_int_move_100$smoothed_states[, 6]
fitted_best_fil_c5_2 = ssm_best_c5_2$model$var_move_1_int_move_100$data[,1] - ssm_best_c5_2$model$var_move_1_int_move_100$filtered_states[, 6]

plot(cbind(ssm_best_c5_2$model$var_move_1_int_move_100$data[,1], fitted_best_smo_c5_2), plot.type = "s", col = c("black", "red"))
plot(cbind(ssm_best_c5_2$model$var_move_1_int_move_100$data[,1], fitted_best_fil_c5_2), plot.type = "s", col = c("black", "red"))

ssm_best_c5_2$rmse$rmse_smoothed$var_move_1_int_move_100
ssm_best_c5_2$rmse$rmse_filtered$var_move_1_int_move_100

# Model_c5_3 -------

fitted_best_smo_c5_3 = ssm_best_c5_3$model$var_fixe_1_int_fixe_1$data[,1] - ssm_best_c5_3$model$var_fixe_1_int_fixe_1$smoothed_states[, 6]
fitted_best_fil_c5_3 = ssm_best_c5_3$model$var_fixe_1_int_fixe_1$data[,1] - ssm_best_c5_3$model$var_fixe_1_int_fixe_1$filtered_states[, 6]

plot(cbind(ssm_best_c5_3$model$var_fixe_1_int_fixe_1$data[,1], fitted_best_smo_c5_3), plot.type = "s", col = c("black", "red"))
plot(cbind(ssm_best_c5_3$model$var_fixe_1_int_fixe_1$data[,1], fitted_best_fil_c5_3), plot.type = "s", col = c("black", "red"))

ssm_best_c5_3$rmse$rmse_smoothed$var_fixe_1_int_fixe_1
ssm_best_c5_3$rmse$rmse_filtered$var_fixe_1_int_fixe_1

# Model_c5_6

fitted_best_smo_c5_6 = ssm_best_c5_6$model$var_move_100_int_fixe_1$data[,1] - ssm_best_c5_6$model$var_move_100_int_fixe_1$smoothed_states[, 7]
fitted_best_fil_c5_6 = ssm_best_c5_6$model$var_move_100_int_fixe_1$data[,1] - ssm_best_c5_6$model$var_move_100_int_fixe_1$filtered_states[, 7]

plot(cbind(ssm_best_c5_6$model$var_move_100_int_fixe_1$data[,1], fitted_best_smo_c5_6), plot.type = "s", col = c("black", "red"))
plot(cbind(ssm_best_c5_6$model$var_move_100_int_fixe_1$data[,1], fitted_best_fil_c5_6), plot.type = "s", col = c("black", "red"))

# Plot_ssm_lm_best ----------

plot(ssm_best_c1_1, choice = "filtered")
plot(ssm_best_c1_2, choice = "filtered")
plot(ssm_best_c3_1, choice = "filtered")
plot(ssm_best_c4_2, choice = "filtered")
plot(ssm_best_c4_3, choice = "filtered")
plot(ssm_best_c5_2, choice = "filtered")
plot(ssm_best_c5_6, choice = "filtered")

plot(ssm_best_c1_1, choice = "smoothed")
plot(ssm_best_c1_2, choice = "smoothed")
plot(ssm_best_c3_1, choice = "smoothed")
plot(ssm_best_c4_2, choice = "smoothed")
plot(ssm_best_c4_3, choice = "smoothed")
plot(ssm_best_c5_2, choice = "smoothed")
plot(ssm_best_c5_6, choice = "smoothed")
