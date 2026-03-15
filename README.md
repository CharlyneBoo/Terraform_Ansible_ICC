# Terraform_Ansible_ICC

Ce projet automatise entièrement le déploiement d'une infrastructure composée d'une application web (API Flask) et d'une base de données (PostgreSQL) sur deux machines virtuelles Ubuntu distinctes via Proxmox.

---

## Configuration

Afin de configuerer ce projet pour être executable, vous pouvez placer vos variables de la manière suivante :

- **Terraform :** Modifiez le fichier `terraform/terraform.tfvars` pour les paramètres d'infrastructure (identifiants Proxmox, adresses IP des VMs, utilisateur SSH).
- **Ansible :** \* Pour l'application : `/ansible/roles/app/default/main.yml`
  - Pour la base de données : `/ansible/roles/bdd/default/main.yml`

---

## Déploiement Terraform

Pour déployer les machines virtuelles sur Proxmox

```bash
cd terraform/
terraform init
terraform plan
terraform apply
```

## Suppression des VMs

Pour supprimer les machines virtuelles sur Proxmox

```bash
cd terraform/
terraform destroy
```

## Information de la VM

Pour acceder à la page web de la VM. Rendez vous à l'url : http://192.168.100.140:8080

## Auteur

Charlyne Wargnier--Potier
