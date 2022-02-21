build {
  sources = ["source.vsphere-iso.windows"]

  provisioner "windows-shell" {
    inline = ["dir c:\\"]
  }

  provisioner "windows-restart" { # A restart to settle Windows prior to updates
    pause_before    = "2m"
    restart_timeout = "15m"
  }

  /* 
  # Uncomment this to patch 

  provisioner "windows-update" {
    pause_before    = "2m"
    timeout         = "1h"
    search_criteria = "IsInstalled=0"
    filters = [
      #"exclude:$_.Title -like '*VMware*'", # Can break winRM connectivity to Packer since driver installs interrupt network connectivity
      "exclude:$_.Title -like '*Preview*'",
      "include:$true"
    ]
  }
 */

  provisioner "powershell" {
    pause_before      = "2m"
    elevated_user     = var.winrm_username
    elevated_password = var.winrm_password
    script            = "scripts/enable-rdp.cmd"
    timeout           = "15m"
  }

  provisioner "windows-restart" { # A restart before sysprep to settle the VM once more.
    pause_before    = "2m"
    restart_timeout = "1h"
  }

  provisioner "powershell" {
    pause_before      = "2m"
    elevated_user     = var.winrm_username
    elevated_password = var.winrm_password
    script            = "scripts/sysprep_win.ps1"
    timeout           = "15m"
  }
}
