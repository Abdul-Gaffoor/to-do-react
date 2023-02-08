#!/bin/bash

BUCKET_NAME=abdul-githubactions
DIST_ID=EWQ8188P63YY0

npm i || error "Dependency Installation failed" 2
npm run build || error "Build failed" 2
aws s3 rm s3://$BUCKET_NAME --recursive --profile neuralsync
aws s3 cp --recursive --acl public-read ./build/ s3://$BUCKET_NAME/ --profile leaf
aws cloudfront create-invalidation --distribution-id $DIST_ID --paths '/*' --profile leaf