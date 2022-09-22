module "site1" {
  source                          = "./modules/f5xc/site/aws/vpc"
  f5xc_api_p12_file               = var.f5xc_api_p12_file
  f5xc_api_url                    = var.f5xc_api_url
  f5xc_namespace                  = "system"
  f5xc_tenant                     = var.f5xc_tenant
  f5xc_aws_region                 = "us-west-2"
  f5xc_aws_cred                   = "mw-aws-personal"
  #f5xc_aws_cred                   = "mw-aws-f5"
  f5xc_aws_vpc_site_name          = format("%s-aws-vif-west", var.project_prefix)
  f5xc_aws_vpc_name_tag           = format("%s-aws-vif-west", var.project_prefix)
  f5xc_aws_vpc_primary_ipv4       = "192.168.168.0/21"
  f5xc_aws_vpc_total_worker_nodes = 0
  f5xc_aws_ce_gw_type             = "multi_nic"
  f5xc_aws_vpc_direct_connect_disabled = false
  f5xc_aws_vpc_direct_connect_hosted_vifs = [ "dxvif-fg2z9snd" ]
  f5xc_aws_vpc_direct_connect_custom_asn = 64555

  f5xc_aws_vpc_az_nodes           = {
    node0 = {
      f5xc_aws_vpc_workload_subnet = "192.168.168.0/26", f5xc_aws_vpc_inside_subnet = "192.168.168.64/26",
      f5xc_aws_vpc_outside_subnet  = "192.168.168.128/26", f5xc_aws_vpc_az_name = "us-west-2a"
    },
    #    node1 = {
    #      f5xc_aws_vpc_workload_subnet = "192.168.169.0/26", f5xc_aws_vpc_inside_subnet = "192.168.169.64/26",
    #  f5xc_aws_vpc_outside_subnet  = "192.168.169.128/26", f5xc_aws_vpc_az_name = "us-east-1a"
    #},
    #node2 = {
    #  f5xc_aws_vpc_workload_subnet = "192.168.170.0/26", f5xc_aws_vpc_inside_subnet = "192.168.170.64/26",
    #  f5xc_aws_vpc_outside_subnet  = "192.168.170.128/26", f5xc_aws_vpc_az_name = "us-east-1a"
    #}
  }
  f5xc_aws_default_ce_os_version       = true
  f5xc_aws_default_ce_sw_version       = true
  f5xc_aws_vpc_no_worker_nodes         = false
  f5xc_aws_vpc_use_http_https_port     = true
  f5xc_aws_vpc_use_http_https_port_sli = true
  public_ssh_key                       = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGQgmCdK9tbjvfnx417pwhyFhphJUEGsn43bFwjkP6pt mwiget@m1.local"
  custom_tags                          = {
    Owner = "m.wiget@f5.com"
  }
}

module "site2" {
  source                          = "./modules/f5xc/site/aws/vpc"
  f5xc_api_p12_file               = var.f5xc_api_p12_file
  f5xc_api_url                    = var.f5xc_api_url
  f5xc_namespace                  = "system"
  f5xc_tenant                     = var.f5xc_tenant
  f5xc_aws_region                 = "us-east-1"
  f5xc_aws_cred                   = "mw-aws-personal"
  #f5xc_aws_cred                   = "mw-aws-f5"
  f5xc_aws_vpc_site_name          = format("%s-aws-vif-east", var.project_prefix)
  f5xc_aws_vpc_name_tag           = format("%s-aws-vif-east", var.project_prefix)
  f5xc_aws_vpc_primary_ipv4       = "192.168.176.0/21"
  f5xc_aws_vpc_total_worker_nodes = 0
  f5xc_aws_ce_gw_type             = "multi_nic"
  f5xc_aws_vpc_direct_connect_disabled = false
  f5xc_aws_vpc_direct_connect_hosted_vifs = [ "dxvif-fftylee8" ]
  f5xc_aws_vpc_direct_connect_custom_asn = 64555

  f5xc_aws_vpc_az_nodes           = {
    node0 = {
      f5xc_aws_vpc_workload_subnet = "192.168.176.0/26", f5xc_aws_vpc_inside_subnet = "192.168.176.64/26",
      f5xc_aws_vpc_outside_subnet  = "192.168.176.128/26", f5xc_aws_vpc_az_name = "us-east-1a"
    },
    #    node1 = {
    #      f5xc_aws_vpc_workload_subnet = "192.168.169.0/26", f5xc_aws_vpc_inside_subnet = "192.168.169.64/26",
    #  f5xc_aws_vpc_outside_subnet  = "192.168.169.128/26", f5xc_aws_vpc_az_name = "us-east-1a"
    #},
    #node2 = {
    #  f5xc_aws_vpc_workload_subnet = "192.168.170.0/26", f5xc_aws_vpc_inside_subnet = "192.168.170.64/26",
    #  f5xc_aws_vpc_outside_subnet  = "192.168.170.128/26", f5xc_aws_vpc_az_name = "us-east-1a"
    #}
  }
  f5xc_aws_default_ce_os_version       = true
  f5xc_aws_default_ce_sw_version       = true
  f5xc_aws_vpc_no_worker_nodes         = false
  f5xc_aws_vpc_use_http_https_port     = true
  f5xc_aws_vpc_use_http_https_port_sli = true
  public_ssh_key                       = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGQgmCdK9tbjvfnx417pwhyFhphJUEGsn43bFwjkP6pt mwiget@m1.local"
  custom_tags                          = {
    Owner = "m.wiget@f5.com"
  }
}

module "site1_status_check" {
  source            = "./modules/f5xc/status/site"
  f5xc_namespace    = "system"
  f5xc_site_name    = "mw-aws-vif-west"
  f5xc_api_url      = var.f5xc_api_url
  f5xc_api_token    = var.f5xc_api_token
  f5xc_tenant       = var.f5xc_tenant
  depends_on        = [module.site1]
}
module "site2_status_check" {
  source            = "./modules/f5xc/status/site"
  f5xc_namespace    = "system"
  f5xc_site_name    = "mw-aws-vif-east"
  f5xc_api_url      = var.f5xc_api_url
  f5xc_api_token    = var.f5xc_api_token
  f5xc_tenant       = var.f5xc_tenant
  depends_on        = [module.site2]
}
