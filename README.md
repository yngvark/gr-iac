# Set up for the first time


## Create IAM user

* In AWS console, create a new IAM user
    * Permissions:
        AmazonS3FullAccess
         AmazonDynamoDBFullAccess
         AmazonMSKFullAccess
    * tag: "project: yngvar-fagprosjekt"
* Note the security credentials

## Set AWS credentials

# Enter secret access key id, secret and region

```bash
aws configure --profile gr-iac
aws configure --profile gr-iac set region eu-north-1

export AWS_PROFILE=gr-iac
```

## Initialize

Before using terraform, we need to initialize its state.

```bash
cd infrastructure/initalize
tf init
tf plan
tf apply
```

## Add GitHub secrets for AWS credentials

Go to repository settings -> secrets. Create secrets for
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY

This is because GitHub Actions needs these.

## Verify setup

You can verify in two ways, locally, and in Github Actions.

### Locally

```bash
cd infrastructure
tf init
tf plan
```

This should not return an error, meaning the Terraform setup works as expected.

### Remote state

Go to this repository's github action in GitHub, and trigger a run on the Terraform github action.

# Un-managed stuff that needs to be cleaned up

* IAM -> service user yngvar-fagprosjekt
* IAM -> policy -> 

I have tried to put on the tag "project: yngvar-fagprosjekt" on all resources.
