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

os_iso_checksum   = "4f1457c4fe14ce48c9b2324924f33ca4f0470475e6da851b39ccbf98f44e7852"
os_iso_url        = "2022.iso"
autounattend_file = "answer_files/2022/en/autounattend.xml"
os_version        = 2022
imagetype_name    = "app"
