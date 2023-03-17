variable "rg" {
    description = "Resource Group que será criado|utilizado na criação dos recursos de banco de dados"
}

variable "regiao" {
    description = "Região ao qual os recursos serão criados"
}

variable "ambiente" {
    type = map
    default = {
        d = "dev",
        h = "hml",
        p = "prd"
    }
}

variable "env" {
    default = "d"

    validation {
        condition = contains(["d","h","p"],var.env)
        error_message = "Argument 'env' must be either 'd' (dev), 'h' (hml) or 'p' (prd)"
    }
}

variable "nome_sistema" {
    description = "Nome do sistema ao qual os recursos serão destinados"
}

variable "storage_account_tier" {
    description = "Tipo de Storage Account que pode ser Standard ou Premium. Por padrão será Standard"
    default = "Standard"
}

variable "storage_account_repl_type" {
    description = "Tipo de Replicação de Storage Account que pode ser LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Por padrão será LRS"
    default = "LRS"
}

variable "admin_user_login" {
    description = "Usuario para logar no servidor e banco de dados"
    default = "admindb"
}

variable "admin_user_passwd" {
    description = "Senha do usuario para logar no servidor e banco de dados"
    sensitive = true
}

variable "db_collation" {
    description = "Collation do banco de dados."
    default = "SQL_Latin1_General_CP1_CI_AS"
}

variable "db_max_size" {
    description = "Tamanho máximo do banco de dados. Por padrão 10GB"
    default = 10
}

variable "db_sku_name" {
    description = "Especifica o tipo de perfil de banco de dados que será criado. As opções são: GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. Por padrão será Basic. https://azure.microsoft.com/en-us/pricing/details/azure-sql-database/single/"
    default = "Basic"
}
