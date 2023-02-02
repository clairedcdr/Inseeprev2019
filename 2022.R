data_2022 <- readRDS("data/data.RDS")
data_2022 <- window(data_2022, start = c(1992,2),
                end = c(2022,2))
plot(data_2022[,"prod_c5"])

model_c5_6_2022 <- dynlm(
  formula = prod_c5 ~acquis_ipi1_c5+ins_climat_c5_m3+ins_oscd_c5_m2
  +diff(ins_tppre_c5_m3,1)+diff(bdf_tuc_c5_m2,1),
  data = data_2022
)
plot(cbind(data_2022[,"prod_c5"],model_c5_6_2022$fitted.values), plot.type = "s", col = c("black", "red"))

test_c5_6_2022 <- rmse_prev(formula = get_formula(model_c5_6_2022), data = data_2022, var_fixes = fixed_coefficients(model_c5_6_2022))
sort(test_c5_6_2022$rmse[[1]])
sort(test_c5_6_2022$rmse[[2]])

plot(cbind(data_2022[,"prod_c5"],test_c5_6_2022$prevision$prev_tvlm$prevision), plot.type = "s", col = c("black", "red"))

ssm_c5_6_2022 <- ssm_lm_best(model_c5_6_2022)
plot(ssm_c5_6_2022, "smoothed")

ssm_oos_c5_6_2022 <- ssm_lm_best_oos(model_c5_6_2022)
ssm_oos_c5_6_2022$rmse_best_model_filtering

sort(unlist(c(ssm_oos_c5_6_2022$rmse_best_model_filtering, test_c5_6_2022$rmse[[2]])))

data_2022[,"prod_c5"] - ssm_oos_c5_6_2022$best_model_filtering$var_move_1_int_move_100[,ncol(ssm_oos_c5_6_2022$best_model_filtering$var_move_1_int_move_100)]


plot(cbind(data_2022[,"prod_c5"],
           data_2022[,"prod_c5"] - ssm_oos_c5_6_2022$best_model_filtering$var_move_1_int_move_100[,ncol(ssm_oos_c5_6_2022$best_model_filtering$var_move_1_int_move_100)],
           test_c5_6_2022$prevision$prev_tvlm$prevision,
           test_c5_6_2022$prevision$prev_lm$prevision),
     plot.type = "s",
     col = c("black", "red", "green", "blue"))
