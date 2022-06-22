
# Obtain ssh key data
data "hcloud_ssh_key" "ssh_key" {
  fingerprint = "89:f3:7f:c3:2e:a1:dc:b4:55:72:a9:9d:d8:d7:19:2a"
}
resource "hcloud_server" "master_nodes" {
  count = var.master_nodes
  name = "master-${count.index}"
  image = "ubuntu-22.04"
  server_type = "cx11"
  ssh_keys  = ["${data.hcloud_ssh_key.ssh_key.id}"]
  location = "nbg1"

  network {
    network_id = hcloud_network.network.id
    ip = "${lookup(var.master_ips, count.index)}"
    
  }  

  depends_on = [
    hcloud_network_subnet.network-subnet
  ]
}

resource "hcloud_server" "worker_nodes" {
  count = var.worker_nodes
  name = "worker-${count.index}"
  image = "ubuntu-22.04"
  server_type = "cx11"
  ssh_keys  = ["${data.hcloud_ssh_key.ssh_key.id}"]
  location = "nbg1"

  network {
    network_id = hcloud_network.network.id
    ip = "${lookup(var.worker_ips, count.index)}"
    
  }  

  depends_on = [
    hcloud_network_subnet.network-subnet
  ]
}


output "master_ips" {
  value = hcloud_server.master_nodes.*.ipv4_address
}

output "worker_ips" {
  value = hcloud_server.worker_nodes.*.ipv4_address
}
