# README

German grammar tree visualizer.

<img width="800" alt="image" src="https://user-images.githubusercontent.com/42254348/201436695-849cda9b-3bea-4f2b-bf5f-7766f7a5b722.png"><img width="800" alt="image" src="https://user-images.githubusercontent.com/42254348/201436818-11a78a54-5af9-4f28-907f-2c6518d29391.png">

This repository purpose is:
- POC new features of rails 7: hotwire, turbo drive, frame, streams, stymulus.
- POC new featuers of ruby 3.x type system tools like rbs, steep & typeprof.
- Visualize a Grammar Tree of a sentence in German using [ParZu](https://github.com/rsennrich/ParZu).

## Architecture Documentation
[RFC - Hotwire POC](https://docs.google.com/document/d/1FkmmALtsmQI4VG-ImMys6Czxt2ka7GQ0rSbovHY_W3U/edit)

## Infrastructure
See infra repo, using terraform and gorillalogiclabs AWS Account

https://github.com/gorillalogic/langwire-infra

## Dependencies
1. ruby 3.1.2, It is recommended to use rbenv as version manager.
2. ParZu Grammar Tree Parser, which is available here https://github.com/rsennrich/ParZu. To pull the image:
```bash
docker pull rsennrich/parzu
```

## Private Docker Registry
It uses AWS ECR (Elastic Container Registry), to setup run:
```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <aws-account-id>.dkr.ecr.us-east-1.amazonaws.com
```
then, to build and push:
```bash
docker build . --tag <aws-account-id>.dkr.ecr.us-east-1.amazonaws.com/langwire
docker push <aws-account-id>.dkr.ecr.us-east-1.amazonaws.com/langwire
```
to deploy, run **on the infra repository**:
```bash
terraform apply -replace="aws_ecs_task_definition.main"
```
To fetch the ip used to access the server, run **on the infra repository** `./describe-ip.sh`

## Local setup
1. Clone the repo 
```bash
git clone git@github.com:gorillalogic/langwire.git
```
2. Run the following commands either locally or inside a container:
```bash
bundle install
bundle exec rake db:create
bundle exec rake db:schema:load
```
3. To run tests
```bash
bundle exec rspec
```

## Troubleshooting
1. If the S3 bucket or the container repository fail to be provisioned because they already exist, we can import them into the local terraform state:
``` sh
terraform import aws_s3_bucket.bucket langwire-labs
terraform import aws_ecr_repository.main langwire 
```
2. If terraform fails because of missing sso options in the aws profile files, this is because the aws provider only supports legacy sso configurations at the time. See https://www.reddit.com/r/aws/comments/zk456d/new_aws_cli_and_sso_sessions_profiles_and_legacy/ 

## Future Work
- [x] Replace sqlite(default) with DynamoDB. Done
- [ ] CI/CD
