#AGGREGATE PLANNING  USIN=G MIP

library(ROI.plugin.glpk)
library(ompr)
library(ompr.roi)

result <- MIPModel() |>
  #DECLARE VARIABLES AND BOUNDS
  add_variable(x1, type = "integer") |>
  add_variable(x2, type= "integer") |>
  add_variable(x3, type = "integer") |>
  add_variable(x4, type = "integer") |>
  add_variable(x5, type= "integer") |>
  add_variable(x6, type = "integer") |>
  add_variable(x7, type= "integer") |>
  set_bounds(x1, lb = 0) |>
  set_bounds(x2, lb = 0) |>
  set_bounds(x3, lb = 0) |>
  set_bounds(x4, lb = 0) |>
  set_bounds(x5, lb = 0) |>
  set_bounds(x6, lb = 0) |>
  set_bounds(x7, lb = 0) |>

   #SET OBJECTIVE FUNCTION
  set_objective(10*x1+12*x2+11*x3+10*x4+14*x5+11*x6+2*x7, "min") |>
  add_constraint(x1+x2+x3-x7>=8000) |>
  add_constraint(x7+x4+x5+x6>=10000) |>
  add_constraint(x1<=7000) |>
  add_constraint(x4<=7000) |>
  add_constraint(x1+x3<=9000) |>
  add_constraint(x4+x6<=9000) |>
  add_constraint(x7<=5000) |>
  solve_model(with_ROI(solver = "glpk", verbose=TRUE))

  get_solution(result, x1)
  get_solution(result, x2)
  get_solution(result, x3)
  get_solution(result, x4)
  get_solution(result, x5)
  get_solution(result, x6)
  get_solution(result, x7)
  

