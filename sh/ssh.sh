# ec2 ssh key pair
ssh-keygen -f ~/.ssh/id_rsa_new
ssh-add ~/.ssh/id_rsa_new
cat ~/.ssh/id_rsa_new.pub | xclip -selection c

#######################
### REMOTE MACHINES ###
#######################
ssh user@ip.addr.ess