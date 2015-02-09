cf-deploy
===============

A simple way to deploy static sites on S3 and CloudFront.

## Setup

This is an application that relies on using CloudFormation to set up the initial architecture, before using `make` for updates.

### Initializing Infrastructure
Upload `provision/cloudformation.json` to CloudFormation. You'll need to provide the following variables:

- `ClientTag` the IAA number of the Client this project is for
- `BucketName` the name of the S3 bucket you wish to create. *NOTE* - the bucket cannot already exist.
- `DomainName` the FQDN you wish to use (eg. `hello.18f.us`)
- `Route53HostedZoneID` a Hosted Zone ID from Route53 for your Zone.
- `Route53RecordSetName` if you wish to provide an additional subdomain off the main DomainName, provide it here. Otherwise leave blank.

Once CloudFormation finishes doing its magic, you may continue. It's common to create to identical stacks, one for production and one for staging.

### Deployments

Create your static site in `site\` using whatever you want to use.

#### Requirements

You'll need to install `s3cmd` on your computer. For example:

`brew install s3cmd`


You can then create a `.config` file in the top directory of the project.

The *first line* of this file should contain the *staging* bucket URL. The *second line* of this file should contain the *production* bucket URL. For example:

```
s3://staging-bucket
s3://production-bucket
```

#### Running Make

It's very simple to deploy. Run `make staging` to deploy to the staging bucket and `make production` to deploy to production.