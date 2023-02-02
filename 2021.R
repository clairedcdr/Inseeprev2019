dataf <- readRDS("data/data.RDS")
dataf <- window(dataf, start = c(1992,2),
               end = c(2021,4))
plot(dataf[,"prod_c5"])

model_c5_6_2021 <- dynlm(
  formula = prod_c5 ~acquis_ipi1_c5+ins_climat_c5_m3+ins_oscd_c5_m2
  +diff(ins_tppre_c5_m3,1)+diff(bdf_tuc_c5_m2,1),
  data = dataf
)
plot(cbind(dataf[,"prod_c5"],model_c5_6_2021$fitted.values), plot.type = "s", col = c("black", "red"))

test_c5_6_2021 <- rmse_prev(formula =get_formula(model_c5_6_2021), data = dataf, var_fixes = fixed_coefficients(model_c5_6_2021))
sort(test_c5_6_2021$rmse[[1]])
sort(test_c5_6_2021$rmse[[2]])

plot(cbind(dataf[,"prod_c5"],test_c5_6_2021$prevision$prev_tvlm$prevision), plot.type = "s", col = c("black", "red"))

ssm_c5_6_2021 <- ssm_lm_best(model_c5_6_2021)
plot(ssm_c5_6_2021, "smoothed")

ssm_oos_c5_6_2021 <- ssm_lm_best_oos(model_c5_6_2021)
ssm_oos_c5_6_2021$rmse_best_model_filtering

sort(unlist(c(ssm_oos_c5_6_2021$rmse_best_model_filtering, test_c5_6_2021$rmse[[2]])))

dataf[,"prod_c5"] - ssm_oos_c5_6_2021$best_model_filtering$var_move_1_int_move_100[,ncol(ssm_oos_c5_6_2021$best_model_filtering$var_move_1_int_move_100)]


plot(cbind(dataf[,"prod_c5"],
           dataf[,"prod_c5"] - ssm_oos_c5_6_2021$best_model_filtering$var_move_1_int_move_100[,ncol(ssm_oos_c5_6_2021$best_model_filtering$var_move_1_int_move_100)],
           test_c5_6_2021$prevision$prev_tvlm$prevision),
     plot.type = "s",
     col = c("black", "red", "green"))

