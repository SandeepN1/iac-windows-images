build {
  sources = ["source.azure-arm.az_packer_wvd"]

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
    pause_before = "2m"
    script       = "./scripts/sysprep_win_10.ps1"
  }
}
