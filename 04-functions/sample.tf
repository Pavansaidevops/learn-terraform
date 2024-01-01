variable "fruits" {
  default = [ "banana", "kiwi" ]
}

output "fruit" {
  // value = var.fruits[1]
  value = element(var.fruits, 2)
}

variable "fruit_with_stock" {
  default = {
    banana = {
      stock = 1
    }
  }
}

output "fruit_stock" {
  value = try(var.fruit_with_stock["kiwi"], 0)
}

output "fruit_stock_price" {
  value = lookup(var.fruit_with_stock["banana"], "price", 2)
  // try(var.fruit_with_stock["banana"].price, 2)
}