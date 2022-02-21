

Packer is an open source tool for creating identical machine images for multiple platforms from a single source configuration. ... A machine image is a single static unit that contains a pre-configured operating system and installed software which is used to quickly create new running machines.

Version & Author
----------------

```

VER | [ MM/DD/YYYY] | COMMENTS [AUTHOR]

1.0 | [11/28/2021] | Initial Packer Template Created [ Chetan Talwar/Roopam Gaikar]
      [12/01/2021] | Updated Packer to use HCL format [ Ravi Singh ] 
1.1 | [12/15/2021] | Updated code to update timestamp using YYYYMMDD [ Ravi Singh ]
                   | Updated code image naming convention to az-win-<os_version>-<os_type>-<ddddmmdd> [Ravi Singh]

```

Requirements
------------

```

Azure Service Principal
Azure Secret ID
Azure Secret value 
Azure Tenant ID
```

Example Usage
-------------

```
export CLIENT_ID=xxxxxxxx
export CLIENT_SECRET=xxxxxxxxx
export SUBSCRIPTION_ID=xxxxxxxxx
export TENANT_ID=xxxxxxxx

/usr/bin/packer build -force -var-file=windows2019.auto.pkrvars.hcl .

```

Support Information
-------------------

MAF Orchestration and Automation
| Support                                      | Team                                                                                                                                      |        
| ---------------------| -------------------------------------------- |
| App Code:                              |MAF IAC
| DL:                  |
| GIT Project:         |
