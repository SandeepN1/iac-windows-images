### Script to Ingest Vault for Packer Integration with Ansible
cat << EOF > .vault.txt
$1
EOF
pwd
chmod 666 .vault.txt
ls -ld .vault.txt
cat .vault.txt
