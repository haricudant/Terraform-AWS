variable "REGION" {
  default = "eu-west-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "samplekey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "samplekey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    eu-west-1 = "ami-040ba9174949f6de4"
  }
}
