# create bucket - name, region,
aws s3api create-bucket \
--bucket BUCKET_NAME-REGION \
--region REGION \
--acl private
# enable static website hosting
aws s3api \
put-bucket-website \
--bucket BUCKET_NAME-REGION \
--website-configuration file://$ARTIFACTORY/website.json
# default URL: http://<<BUCKET_NAME>>.s3-website-<<REGION>>.amazonaws.com

# add bucket policy to make objects public
aws s3api put-bucket-policy \
--bucket BUCKET_NAME-REGION \
--policy file://$ARTIFACTORY/policy-s3.json

# delete bucket
aws s3api delete-bucket --bucket BUCKET_NAME-REGION --region REGION
# put
aws s3api put-object --region REGION --bucket BUCKET --key key/file.ext --body path/file.ext
# delete
aws s3api put-object --region REGION --bucket BUCKET --key key/file.ext
