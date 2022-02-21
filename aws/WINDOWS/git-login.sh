## Script for git helper to pull Ansible code for Packer Integration with Ansible
apk add git
git config --global credential.helper store
git credential approve << EOF
protocol=https
host=github.com
username=$1
password=$2
EOF
mkdir /tmp/roles/
ansible-galaxy install -v -r ./ansible/requirements.yml -p ./ansible/roles/ --force
ls -ll ./ansible/roles/
ls -ll ./ansible/roles/iac-ansible-elastic/
pwd
