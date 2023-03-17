locals {
    ambiente                = lookup(var.ambiente,var.env)
    storage_account_tier    = var.env == "p" ? "Premium" : var.env
    read_replica_count      = var.env == "p" ? 1 : 0
    zone_redundant          = var.env == "p" ? true : false

    tags = {
        env         = var.env
        ambiente    = local.ambiente
    }
}