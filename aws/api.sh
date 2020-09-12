### quick lambda setup ###
# create rest api
aws apigateway create-rest-api --name bookstore
# get rest api's root-id
aws apigateway get-resources --rest-api-id rest-api-id
# put GET http method
aws apigateway put-method --rest-api-id rest-api-id \
--resource-id resource-id --http-method GET \
--authorization-type NONE
# put lambda integration
aws apigateway put-integration --rest-api-id rest-api-id \
--resource-id resource-id --http-method ANY --type AWS_PROXY \
--integration-http-method POST \
--uri arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:account-id:function:books/invocations
# test invoke
aws apigateway test-invoke-method --rest-api-id rest-api-id --resource-id resource-id --http-method "GET"
# deploy api
aws apigateway create-deployment --rest-api-id rest-api-id --stage-name staging
# test cUrl - curl https://rest-api-id.execute-api.<REGION>.amazonaws.com/<STAGE>/<PARAM>?key=value
