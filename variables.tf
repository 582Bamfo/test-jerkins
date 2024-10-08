variable "name" {
  type = list(string)
  default = [ "lin","lau", "kay", "pat" ]
}

 variable "ami" {
    default = "ami-053a617c6207ecc7b"
    type = string
    description = "ami for the new env"
 }

 variable "instance_type" {
  default =  "t2.micro"
  type = string
}

variable "tag_name" {
  default = "dan"
}

# variable "tag" {
#   type = map(object({
#     created_by = string
#     env = string
#     iac = bool

#   }))
#   default = {
#     "tag" = {
#       created_by ="terraform"
#       env = "dev"
#       iac = true
#     }
#   }
# }