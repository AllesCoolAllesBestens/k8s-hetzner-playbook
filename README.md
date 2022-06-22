# Deploy Kubernetes Cluster on Hetzner Cloud

## Usage

Add `terraform.tfvars` file to `/infrastructure`:

```
hcloud_token = "<your_hcloud_token>"
primary_zone_name = "exmaple.com"
master_domain_prefix = "master-"
worker_domain_prefix = "worker-"
```

Run `ansible-playbook playbook.yaml`
