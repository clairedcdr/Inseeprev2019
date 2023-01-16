models = mget(ls(pattern = "model_(c|m)"))

tvlm = mget(ls(pattern = "^tvlm_(c|m)\\w*(_\\d*)+$"))

test = ls(pattern = "^test_(c|m)\\w*(_\\d*)+$")

model_variant = mget(paste0("model", lapply(test, function(i) {
  substring(i, 5)
})))

model_invariant = model_all[names(model_all) %in% names(model_variant) == FALSE]

test_model_variant = mget(test)

test_model_invariant = lapply(lapply(model_invariant, get_formula), rmse_prev, data = data)


