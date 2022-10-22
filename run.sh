#! /bin/bash
terraform apply -var-file prod.tfvars
ansible-playbook -i ansiblerole/inventory --private-key ~/Projects/terraform.pem ansiblerole/main.yaml