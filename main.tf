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
  environment = [for k, v in merge(var.env_map, { PORT = "${var.port}" }) : { name = k, value = "${v}" }]

  e2 = [
    { name = "FOO", value = "bar" },
    { name = "PORT", value = var.port }

  ]
}

output "out" {
  value = local.environment
}

output "out_yaml" {
  value = yamlencode({ env = local.environment})
}


output "out2" {
  value = local.e2
}



output "out2_yaml" {
  value = yamlencode({ env = local.e2})
}
