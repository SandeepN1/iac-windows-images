build {
  sources = ["source.azure-arm.az_packer_windows"]

  provisioner "windows-update" {
    search_criteria = "IsInstalled=0"
    filters = [
      "exclude:$_.Title -like '*Preview*'",
      "include:$true",
    ]
    update_limit = 25
  }

  provisioner "windows-restart" { # A restart before sysprep to settle the VM once more.
    pause_before    = "2m"
    restart_timeout = "1h"
  }

  provisioner "powershell" {
    pause_before = "1m"
    script       = "./scripts/ConfigureRemotingForAnsible.ps1"
  }

  # Ansible Integration with Packer AZURE WINDOWS 2019 
  provisioner "ansible" {
    playbook_file = "./ansible/main.yml"
    use_proxy     = false
    user          = "packer"
    extra_arguments = [
      "--vault-password-file=.vault.txt",
      "-e",
      "ansible_winrm_server_cert_validation=ignore",
    ]
    ansible_env_vars = [
      "ANSIBLE_ROLES_PATH=./ansible/roles:./roles:./ansible/roles/iac-ansible-elastic/roles/:./ansible/roles/iac-ansible-heat/roles/"
    ]
  }

  provisioner "powershell" {
    pause_before = "2m"
    script       = "./scripts/sysprep_win.ps1"
  }
}
