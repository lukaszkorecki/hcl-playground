# HCL playground

Steps:

```shell
terraform apply && terraform output out_yaml | ruby -ryaml -rpp -e 'pp YAML.load(ARGF.read)'
```


output should be:

```ruby
{"env"=>
  [{"name"=>"PG_HOST", "value"=>"some.host.internal"},
   {"name"=>"PORT", "value"=>1234},
   {"name"=>"SOME_SECRET", "value"=>"pineapples are 1337"}]}
```


Read more about this project here: https://korecki.me/blog/2020/3/7/quickly-testing-hcl-expressions
