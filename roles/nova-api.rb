name "nova-api"
description "API server for nova"
run_list(
  "role[base]",
  "recipe[nova::api]"
)

