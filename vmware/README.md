<div align="center">
  <img width="128" src="./logo.svg" alt="Windows logo" />
  <h1>Windows Server 2016/2019 Image</h1>
  <p>Packer template for creating MAF customized Windows Server 2016/2019 image</p>
  <hr />
  <br />
</div>

Packer is an open source tool for creating identical machine images for multiple platforms from a single source configuration. ... A machine image is a single static unit that contains a pre-configured operating system and installed software which is used to quickly create new running machines.

Version & Author
----------------

```

VER | [ MM/DD/YYYY] | COMMENTS [AUTHOR]

1.0 | [02/07/2021] | Created Packer Template for Vmware Windows 2016 [ Ravi Singh ] 
                   | Created Packer Template for Vmware Windows 2019 [ Ravi Singh ]
      [02/08/2021] | Created Packer Template for Vmware Windows 2022 [ Ravi Singh ]
                   | Updated README and CHANGELOG [ Ravi Singh ]
```

Requirements
------------

```
vsphere_username
vsphere_password
```

Example Usage
-------------

```

export vsphere_username=xxxxxx
export vsphere_password=xxxxxx

/usr/bin/packer build -force -var-file=win2019.auto.pkrvars.hcl .
/usr/bin/packer build -force -var-file=win2016.auto.pkrvars.hcl .
/usr/bin/packer build -force -var-file=win2022.auto.pkrvars.hcl .

```

Support Information
-------------------

```
MAF Orchestration and Automation
App Code:       MAF IAC
DL:             
GIT Project:
