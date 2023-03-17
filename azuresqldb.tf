resource "azurerm_storage_account" "storage_account" {
  name                     = "sc${var.nome_sistema}${local.ambiente}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = local.storage_account_tier
  account_replication_type = var.storage_account_repl_type
}

resource "azurerm_sql_server" "mssql_server" {
  name                         = "sqlserver-${var.nome_sistema}-${local.ambiente}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.admin_user_login
  administrator_login_password = var.admin_user_passwd

  tags                          = local.tags
}

resource "azurerm_sql_database" "mssql_db" {
    name                    = "sqldb-${var.nome_sistema}-${local.ambiente}"
    resource_group_name     = azurerm_resource_group.rg.name
    location                = azurerm_resource_group.rg.location
    server_name             = azurerm_sql_server.mssql_server.name
    collation               = var.db_collation


    tags                    = merge(local.tags)

}