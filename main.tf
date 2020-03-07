variable "env_map" {

  default = {
    PG_HOST     = "some.host.internal"
    SOME_SECRET = "pineapples are 1337"
  }
}

variable "port" {
  default = 1234
}


locals {
  environment = flatten([for k, v in merge(var.env_map, { PORT = var.port }) : { name = k, value = v }])
}

output "out" {
  value = local.environment
}

output "out_yaml" {
  value = yamlencode({ env = local.environment})
}
