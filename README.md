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



# Un-managed stuff that needs to be cleaned up

* IAM -> service user yngvar-fagprosjekt
* IAM -> policy -> 

I have tried to put on the tag "project: yngvar-fagprosjekt" on all resources.
