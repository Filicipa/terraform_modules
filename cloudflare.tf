resource "cloudflare_dns_record" "example" {
  zone_id = var.cloudflare_zone_id
  name    = "evm-stage"
  ttl     = 1
  type    = "A"
  comment = "evm-stage"
  content = digitalocean_droplet.mm-front["stage"].ipv4_address
  proxied = false
}
