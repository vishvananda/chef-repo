name "nova-volume"
description "Nova volume node"
run_list(
  "role[base]",
  "recipe[nova::volume]"
)

