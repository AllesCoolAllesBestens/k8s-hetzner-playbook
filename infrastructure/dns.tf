data "aws_route53_zone" "primary" {
  name = var.primary_zone_name
}


resource "aws_route53_record" "master_records" {
  count = var.master_nodes
  name = "${var.master_domain_prefix}${count.index}.${var.primary_zone_name}"
  type = "A"
  zone_id = data.aws_route53_zone.primary.zone_id
  records = [hcloud_server.master_nodes[count.index].ipv4_address]
  ttl = 300
}

resource "aws_route53_record" "worker_records" {
  count = var.worker_nodes
  name = "${var.worker_domain_prefix}${count.index}.${var.primary_zone_name}"
  type = "A"
  zone_id = data.aws_route53_zone.primary.zone_id
  records = [hcloud_server.worker_nodes[count.index].ipv4_address]
  ttl = 300
}