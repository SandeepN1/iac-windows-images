build {
  sources = ["source.amazon-ebs.aws_packer_windows"]
  
  provisioner "windows-update" {
    search_criteria = "IsInstalled=0"
    filters = [
      "exclude:$_.Title -like '*Preview*'",
      "include:$true",
    ]
    update_limit = 25
  }
  

  # Ansible Integration with Packer AWS
  provisioner "ansible" {
    playbook_file = "./ansible/main.yml"
    user            = "Administrator"
    use_proxy       = false
    extra_arguments = [
        "--vault-password-file=.vault.txt",
        "-e", 
        "ansible_winrm_server_cert_validation=ignore"
      ]
    ansible_env_vars = [
      "ANSIBLE_ROLES_PATH=./ansible/roles:./roles:./ansible/roles/iac-ansible-elastic/roles/:./ansible/roles/iac-ansible-heat/roles/"
    ]
  }

  provisioner "windows-restart" { # A restart before sysprep to settle the VM once more.
    pause_before    = "2m"
    restart_timeout = "1h"
  }

  provisioner "powershell" {
    pause_before = "2m"
    inline = [
      "C:\\ProgramData\\Amazon\\EC2-Windows\\Launch\\Scripts\\InitializeInstance.ps1 -Schedule",
      "C:\\ProgramData\\Amazon\\EC2-Windows\\Launch\\Scripts\\SysprepInstance.ps1 -NoShutdown",
      "wget https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -OutFile Undo-WinRMConfig.ps1",
      "./Undo-WinRMConfig.ps1"
    ]
  }
}
