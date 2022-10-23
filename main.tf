provider "google" {
  project = "aocs-devops-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

resource "google_folder" "Financeiro" {
  display_name = "Financeiro"
  parent       = "organizations/540829645030"
}

resource "google_folder" "Recursos Humanos" {
  display_name = "Recursos Humanos"
  parent       = google_folder.Financeiro.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.Recursos Humanos.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.Recursos Humanos.name
}


resource "google_project" "aocs-Recursos Humanos-dev" {
  name       = "Recursos Humanos-Dev"
  project_id = "aocs-Recursos Humanos-dev"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}

# resource "google_project" "barberosa-salesforce-prod" {
#   name       = "SalesForce-Prod"
#   project_id = "barberosa-salesforce-prod"
#   folder_id  = google_folder.Producao.name
#   auto_create_network=false
#   billing_account = "01B2C4-70459E-F53446"
# }
