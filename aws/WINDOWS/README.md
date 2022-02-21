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

1.0 | [12/22/2021] | Created Packer Template for AWS Windows 2019 [ Ravi Singh ] 
                   | Updated Packer Provisioner to apply latest patches [ Ravi Singh ]
1.1 | [02/09/2022] | Updated Packer Integartion to call Ansible roles [ Ravi Singh ]
                   | Updated Workflow to use Ubuntu 18.04 instead of latest as it breaks vault Integration [ Ravi Singh ]
                   | FileBeat and Winlogbeat Install Integrated [ Ravi Singh ]
    | [02/10/2022] | Updated Workflow to Use Image Bakery v4 which has Pywinrm Support [Ravi Singh ] 
    | [02/11/2022] | Updated To include Heat role in Image Bakery [ Ravi Singh ]
```

Requirements
------------

```

AWS Secret key
AWS Access key 
```

Example Usage
-------------

```

export AWS_ACCESS_KEY_ID=xxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxx

/usr/bin/packer build -force -var-file=win2019.auto.pkrvars.hcl .

```

Support Information
-------------------

```
MAF Orchestration and Automation
App Code:       MAF IAC
DL:             
GIT Project:
