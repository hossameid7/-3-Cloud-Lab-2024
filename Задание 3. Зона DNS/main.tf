terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 1.9.1"
}

provider "yandex" {
  token     = "y0_AgAEA7qkdRXuAATuwQAAAAEJU4mZAAAplx3Z8X1Ckqtj0uK7O1MUgxmpXg"
  cloud_id  = "b1g71e95h51okii30p25"
  folder_id = "b1guilhk9kmh58p160il"
}

resource "yandex_dns_zone" "pr12-dns-zone" {
  name        = "pr12-itiscl-ru"
  description = "Public DNS zone for pr12-itiscl-ru"
  zone        = "pr12.itiscl.ru."
  public      = true

}

resource "yandex_dns_recordset" "pr12-txt-record" {
  zone_id = yandex_dns_zone.pr12-dns-zone.id
  name    = "pr12.itiscl.ru."
  type    = "TXT"
  ttl     = 300
  data    = ["itis-cloud-lab-pr12"]
}
