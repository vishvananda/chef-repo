name "nova-controller"
description "Nova controller node (vncproxy + rabbit)"
run_list(
  "role[base]",
  "recipe[nova::controller]"
)

