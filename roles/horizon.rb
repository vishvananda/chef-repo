name "horizon"
description "Nova web control panel"
run_list(
  "role[base]",
  "recipe[horizon]"
)

