module "site1" {
  source                          = "./mymodules/f5xc/site/aws/tgw"
  f5xc_api_p12_file               = var.f5xc_api_p12_file
  f5xc_api_ca_cert                = var.f5xc_api_ca_cert
  f5xc_api_url                    = var.f5xc_api_url
  f5xc_tenant                     = var.f5xc_tenant
  f5xc_aws_cred                   = var.f5xc_aws_cred
  aws_owner_tag                   = var.owner_tag
  f5xc_namespace                  = "system"
  f5xc_aws_region                 = "us-west-1"
  f5xc_aws_tgw_name               = "mw-aws-vif-1"
  f5xc_aws_tgw_no_worker_nodes    = true
  f5xc_aws_tgw_total_worker_nodes = 0
  f5xc_aws_tgw_primary_ipv4       = "192.168.168.0/22"
  f5xc_aws_tgw_az_nodes           = {
    node0 : {
      f5xc_aws_tgw_workload_subnet = "192.168.168.0/26", f5xc_aws_tgw_inside_subnet = "192.168.168.64/26",
      f5xc_aws_tgw_outside_subnet  = "192.168.168.128/26", f5xc_aws_tgw_az_name = "us-west-1a"
    },
    node1 : {
      f5xc_aws_tgw_workload_subnet = "192.168.169.0/26", f5xc_aws_tgw_inside_subnet = "192.168.169.64/26",
      f5xc_aws_tgw_outside_subnet  = "192.168.169.128/26", f5xc_aws_tgw_az_name = "us-west-1a"
    },
    node2 : {
      f5xc_aws_tgw_workload_subnet = "192.168.170.0/26", f5xc_aws_tgw_inside_subnet = "192.168.170.64/26",
      f5xc_aws_tgw_outside_subnet  = "192.168.170.128/26", f5xc_aws_tgw_az_name = "us-west-1a"
    }
  }
  f5xc_aws_default_ce_os_version       = true
  f5xc_aws_default_ce_sw_version       = true
  f5xc_aws_tgw_vpc_attach_label_deploy = ""
  public_ssh_key                       = "${file(var.ssh_public_key_file)}"
}

module "site1_status_check" {
  source            = "./modules/f5xc/status/site"
  f5xc_namespace    = "system"
  f5xc_site_name    = "mw-aws-vif-1"
  f5xc_api_url      = var.f5xc_api_url
  f5xc_api_token    = var.f5xc_api_token
  f5xc_tenant       = var.f5xc_tenant
  depends_on        = [module.site1]
}
