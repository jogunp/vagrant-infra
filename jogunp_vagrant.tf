provider "vagrant" {
  verbose = true
}

resource "vagrant_vm" "jogunp_vagrant_vm" {
  vagrantfile_dir = "."
  env = {
    VAGRANTFILE_HASH = "${md5(file("./Vagrantfile"))}",
  }
}
