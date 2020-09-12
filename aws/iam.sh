########################
### Lambda Exec Role ###
########################

# create role
aws iam create-role \
--role-name lambda-exec \
--assume-role-policy-document file:///$ARTIFACTS/trust.json
# attach policy to role
aws iam attach-role-policy \
--role-name lambda-exec \
--policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

# put role policy
aws iam put-role-policy \
--role-name lambda-exec \
--policy-name dynamodb-item-crud-role \
--policy-document file:///path/policy.json




# update role
aws iam update-role \
--role-name role-name \
--description "desc" \
--max-session-duration 1000

# update group
aws iam update-group \
--group-name group-name \
--group-name test --new-group-name TEST

# update assume role policy
aws iam update-assume-role-policy \
--role-name role-name \
--policy-document JSON-FILE

# put role policy
aws iam put-role-policy \
--role-name role-name \
--policy-name pol-name \
--policy-document JSON \

# put group policy
aws iam put-group-policy \
--group-name group-name \
--policy-name pol-name \
--policy-document JSON \

# delete role
aws iam delete-role \
--role-name role-name \
--assume-role-policy-document file:///path/trust.json

# delete role policy
aws iam delete-role --role-name role-name

# delete policy
aws iam delete-policy --policy-arn ARN

# create policy
aws iam create-policy \
--policy-name pol-name \
--policy-document file:///path/policy.json
