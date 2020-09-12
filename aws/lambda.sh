############
### INIT ###
############
# create fn
aws lambda create-function \
--function-name FN_NM \
--runtime python3.8 \
--role "IAM ARN" \
--handler main \
--zip-file COMPILED_CODE \
--no-publish \
--environment file://file.json \
--layers "ARN"
# Runtimes: go1.x, nodejs12.x
# or --code "{"S3Bucket":"bckt",S3Key":"key"}"

# invoke fn
aws lambda invoke --function-name FN_NM \
--payload '{"name":"bob"}' --invocation-type Event

# add permission - API invocation
aws lambda add-permission --function-name books --statement-id a-GUID \
--action lambda:InvokeFunction --principal apigateway.amazonaws.com \
--source-arn arn:aws:execute-api:us-east-1:account-id:rest-api-id/*/*/*




# delete fn
aws lambda delete-function --function-name FN_NM

# update fn code
aws lambda update-function-code \
--function-name FN_NM \
--zip-file file://FPATH \
--s3-bucket BCKT \
--s3-key KEY \
--publish

# publish ver
aws lambda publish-version --function-name FN_NM

# update fn config
aws lambda update-function-configuration \
--function-name FN_NM \
--role | --handler | --description | --environment

# publish layer version
aws lambda publish-layer-version
--layer-name LAYER_NM \
--description "test" \
--compatible-runtimes python3.8 \
--content '{"S3Bucket":"BCKT","S3Key":"KEY"}'


#################
### PREP CODE ###
#################
### GoLang ###
# get aws lambda compiler?
go get github.com/aws/aws-lambda-go/lambda
# compile?
GOOS=linux go build -o faas main.go
# zip file
zip faas.zip faas
# upload to s3 file
aws s3 cp faas.zip s3://{my-artifact-s3-bucket-url}/ # artifact, source, assets?


##############
### LAYERS ###
##############
# setup env dir - project > src, env
mkdir ./env
cd !$
touch requirements.txt
mkdir python/lib/python3.8/site-packages
# create layer from docker
pip install -r requirements.txt -t python/lib/python3.8/site-packages/

# zip & write
COMPILE() { # TODO: build src env files from build env??
  SRC=$PWD/src
  ART=$PWD/artifacts
  # zip source py code
  (cd $SRC && zip -r $ART/src.zip ./*)
  # s3 put
  aws s3api put-object --region $AWS_REGION --bucket $EID-artifacts-$AWS_RGN --key $TYPE/$PID/src.zip --body $ART/src.zip --acl bucket-owner-full-control --storage-class REDUCED_REDUNDANCY
  # install reqs
  PKG=$ART/layers/webscrape
  pip install -r $LAYER/requirements.txt -t $PKG/python/lib/python3.8/site-packages
  # zip layer
  (cd $PKG && zip -r $ART/webscrape.zip ./*)
  # s3 put
  aws s3api put-object --region $AWS_REGION --bucket $EID-artifacts-$AWS_RGN --key layers/python/webscrape.zip --body $ART/webscrape.zip --acl bucket-owner-full-control --storage-class REDUCED_REDUNDANCY
}
