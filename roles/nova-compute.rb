name "nova-compute"
description "Nova compute node"
run_list(
  "role[base]",
  "recipe[nova::api]",
  "recipe[nova::compute]"
)

