# DevOps Demo

1. Clone repo
2. Launch concourse

```
$ cd devops-demo/infra/concourse/provision
$ vagrant up
 ```

3. Log to Concourse



###Fly

```
Login
$ fly -t aws login --concourse-url <concource url> --username concourse

Intercept
$ fly -t aws intercept -j <pipeline>/<build> --step <task>

Set Pipeline
$ fly sp -t aws -c pipeline.yml -p monitoring -l ~/s3-credentials.yml
```


