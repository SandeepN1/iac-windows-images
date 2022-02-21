

Packer is an open source tool for creating identical machine images for multiple platforms from a single source configuration. ... A machine image is a single static unit that contains a pre-configured operating system and installed software which is used to quickly create new running machines.

Version & Author
----------------

```

VER | [ MM/DD/YYYY] | COMMENTS [AUTHOR]

1.0 | [12/15/2021] | Initial Packer Template Created [ Ravi Singh ]
                   | Updated Packer to create image in Shared Image Gallery [ Ravi Singh ] 

```

Requirements
------------
Shared Image Gallery Should exist 

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
