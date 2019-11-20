resource "aws_key_pair" "samplekey" {
  key_name = "samplekey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
  lifecycle {
    ignore_changes = ["public_key"]
  }
}
