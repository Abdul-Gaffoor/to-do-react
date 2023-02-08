# GitHub Actions for React.JS App


## Infrastructure
This is React App deployed through AWS cloudfront using AWS-S3 bucket as code source

## GitHub Actions Information
**This is a Github Actions workflow yaml file to deploy a React application to AWS S3 and distribute it through AWS CloudFront. The workflow is triggered every time a push event is performed on the master branch.**

The environment variables, SLACK_WEBHOOK_URL, AWS_S3_BUCKET, AWS_CLOUDFRONT_URL and AWS_ACCESS_KEY and AWS_SECRET_KEY are stored as secrets in the Github repository and are used to configure the AWS credentials.

#### The steps performed in the workflow are:
- Checkout - checks out the code from the Github repository.
- Setup node - sets up the node environment for the workflow.
- Install dependencies - installs the necessary dependencies for the React application.
- Build static file - builds the React application and generates the static files.
- Configure AWS Credentials - configures the AWS credentials using the environment variables.
- Delete Old Build in S3 - deletes the old build from the AWS S3 bucket.
- Update New Build to S3 - uploads the new build to the AWS S3 bucket.
- Update Cloudfront with New-Build - updates the AWS CloudFront distribution with the new build.
- Slack Notification - Success - sends a Slack notification to the specified channel with the details of the workflow, repository, branch and the actor who triggered the workflow.

The Slack notification is sent every time, regardless of the success or failure of the workflow.






