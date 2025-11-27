resource "github_repository" "architecture_cloud" {
  name        = "terraform-demo-yanis"
  description = "Repo créé automatiquement avec Terraform"
  visibility  = "public"

  has_issues = true
  has_wiki   = false
  auto_init  = true
}
