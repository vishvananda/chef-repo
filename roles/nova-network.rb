name "nova-network"
description "Nova network node"
run_list(
  "role[base]",
  "recipe[nova::network]"
)

