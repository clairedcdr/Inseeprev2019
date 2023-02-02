# Application hansen.test et rmse_prev -----------------

## Modèles manuf ===============

hansen.test(model_manuf_1) #rien ne varie sauf intercept
hansen.test(model_manuf_2) #rien ne varie

hansen.test(model_manuf_3)
test_manuf_3 = rmse_prev(formula = prod_manuf ~ +ind1997Q2 + ind2008Q4 + ind2009Q1 + ind2011Q1 + ind2012Q3 + ind2013Q3
                         + diff(ins_tppre_m2,1) + ins_tppa_m2 + stats::lag(ins_tppre_m3,-1) + stats::lag(bdf_prodpre_m3,-1),
                         data = data,
                         var_fixes = fixed_coefficients(model_manuf_3))
test_manuf_3


## Modèles c1 ==================

hansen.test(model_c1_1) #rien ne varie
hansen.test(model_c1_2) #rien ne varie
hansen.test(model_c1_3) #rien ne varie
hansen.test(model_c1_4) #rien ne varie
hansen.test(model_c1_5) #rien ne varie
hansen.test(model_c1_6) #rien ne varie
hansen.test(model_c1_7) #rien ne varie
hansen.test(model_c1_8) #rien ne varie

## Modèles c3 =================

hansen.test(model_c3_1) #rien ne varie

hansen.test(model_c3_2)
test_c3_2 = rmse_prev(formula = prod_c3 ~ ins_climat_c3_m1 + ins_tppre_c3_m1 +
                        diff(ins_tppre_c3_m1, 1) + ind2009Q1,
                      data = data,
                      var_fixes = fixed_coefficients(model_c3_2))
test_c3_2


hansen.test(model_c3_3) #rien ne varie

hansen.test(model_c3_4)
test_c3_4 = rmse_prev(formula = get_formula(model_c3_4),
                      data = data,
                      var_fixes = fixed_coefficients(model_c3_4))
test_c3_4

hansen.test(model_c3_5)
test_c3_5 = claiRe::rmse_prev(formula = get_formula(model_c3_5),
                              data = data,
                              var_fixes = fixed_coefficients(model_c3_5))
test_c3_5

hansen.test(model_c3_6) #rien ne varie

## Modèles c4 ====================

hansen.test(model_c4_1) #rien ne varie
hansen.test(model_c4_2) #rien ne varie
hansen.test(model_c4_3) #rien ne varie
hansen.test(model_c4_4) #rien ne varie
hansen.test(model_c4_5) #rien ne varie
hansen.test(model_c4_6) #rien ne varie

## Modèles c5 ====================

hansen.test(model_c5_1)
test_c5_1 = rmse_prev(formula = prod_c5 ~ ins_climat_c5_m1 + diff(ins_tppre_c5_m1, 1)
                      + ind2008Q4 + ind2009Q1,
                      data = data,
                      var_fixes = fixed_coefficients(model_c5_1))
test_c5_1

hansen.test(model_c5_2)
test_c5_2 = rmse_prev(prod_c5 ~ acquis_ipi1_c5 + bdf_prodpas_c5_m2 +
                        stats::lag(ins_oscd_c5_m3, -1) + diff(bdf_sitcar_c5_m2, 1),
                      data = data,
                      var_fixes = fixed_coefficients(model_c5_2))
test_c5_2

hansen.test(model_c5_3)
test_c5_3 = rmse_prev(formula = prod_c5 ~ acquis_ipi1_c5 + bdf_prodpas_c5_m2 +
                        diff(bdf_evocar_c5_m2, 1) + diff(ins_tppre_c5_m2, 1),
                      data = data,
                      var_fixes = fixed_coefficients(model_c5_3))
test_c5_3

hansen.test(model_c5_4)
test_c5_4 = rmse_prev(formula = prod_c5 ~ ins_climat_c5_m1 + diff(ins_tppre_c5_m1, 1) + ind2008Q4 + ind2009Q1,
                      data = data,
                      var_fixes = fixed_coefficients(model_c5_4))
test_c5_4

hansen.test(model_c5_5)
test_c5_5 = rmse_prev(prod_c5 ~ stats::lag(prod_c5, -1) + bdf_prodpre_c5_m1 +
                        diff(ins_climat_c5_m2, 1) + diff(bdf_tuc_c5_m1, 1) + ind2008Q4 +
                        ind2009Q1,
                      data = data,
                      var_fixes = fixed_coefficients(model_c5_5))
test_c5_5

hansen.test(model_c5_6)
test_c5_6 = rmse_prev(formula = prod_c5 ~acquis_ipi1_c5+ins_climat_c5_m3+ins_oscd_c5_m2
                      +diff(ins_tppre_c5_m3,1)+diff(bdf_tuc_c5_m2,1),
                      data = data,
                      var_fixes = fixed_coefficients(model_c5_6),
                      date = 28)
test_c5_6





