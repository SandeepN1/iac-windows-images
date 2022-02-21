// Variables for VMWARE BUILD for 2022

vsphere_server              = "esx-maf.ae"
vsphere_username            = "administrator@maf.ae"
vsphere_password            = "SomeSecurePassword"
vsphere_datacenter          = "MAF"
vsphere_insecure_connection = true
vsphere_host                = "esx1.maf.ae"
vsphere_network             = "VM Network"
vsphere_datastore           = "datastore1"

# datastore path to the vmtools iso file
vmtools_iso_path = "[datastore1] vmtools/windows.iso"

# Windows username (created in autounattend.xml. )
winrm_password = "Administrator"

# Windows password (created in autounattend.xml. ) 
winrm_username = "xxxxxxxxxxx"

vsphere_guest_os_type = "windows9_64Guest"

// Replace checksum with own checksum
os_iso_checksum   = "549bca46c055157291be6c22a3aaaed8330e78ef4382c99ee82c896426a1cee1"
autounattend_file = "answer_files/2016/en/autounattend.xml"
os_version        = 2016
imagetype_name    = "base"
