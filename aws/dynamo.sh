# create table
aws dynamodb create-table --table-name table-nm \
--attribute-definitions AttributeName=keyId,AttributeType=S \
--key-schema AttributeName=keyId,KeyType=HASH \
--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5

# delete table
aws dynamodb delete-table --table-name table-nm

# update table
aws dynamodb update-table --table-name table-nm \
--attribute-definitions AttributeName=keyId,AttributeType=S \
--key-schema AttributeName=keyId,KeyType=HASH \
--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
