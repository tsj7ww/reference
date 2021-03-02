# ssh into ec2 instance
chmod 600 /path/my-key-pair.pem # WARNING: UNPROTECTED PRIVATE KEY FILE!
ssh -i /path/my-key-pair.pem my-instance-user-name@my-instance-public-dns-name

# scp files between local and ec2
scp -i /path/my-key-pair.pem /path/SampleFile.txt my-instance-user-name@my-instance-public-dns-name:~
