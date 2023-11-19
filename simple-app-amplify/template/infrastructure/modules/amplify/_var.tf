variable "name" {}
variable "repository" {}
variable "branch_name" {
    description = "Branch build and running application"
    default = "master"
}