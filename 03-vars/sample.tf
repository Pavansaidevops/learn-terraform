# Plain Variable
variable "fruit_name" {
  default = 'banana'
}

output "fruit_name" {
  value = var.fruit_name
}

# List Variable
variable "fruits" {
  default = [
    "banana" ,
    "kiwi"
  ]
  // default = [ "banana", "kiwi" ] // single line syntax
}

# Map Variable , Plain
variable "fruit_stock" {
  default = {
    banana = 200
    kiwi = 100
  }
}

# Map Variable , Map of Maps
variable "fruit_stock_with_price" {
  default = {
    banana = {
      stock = 400
      price = 1
    }
    kiwi = {
      stock = 100
      price = 1
    }
  }
}

## Access a list variable, list index starts from zero
output "fruits_first" {
  value = var.fruits[0]
}

output "fruits_second" {
  value = var.fruits[1]
}

## Access a Map variable
output "fruit_stock_banana" {
  value = var.fruit_stock["banana"]
}

output "fruit_stock_with_price_of_banana" {
  value = var.fruit_stock_with_price["banana"].stock
}