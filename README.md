# Infrastructure as a Code

## About project
This project represents Infrastructure as a Code (IaaC) for Golang project pizza-delivery-web app. \
It consists of 2 parts:

### Terraform
Terraform code is in <i>./terraform</i> directory. It contains <i>main.tf</i> file which defines modules that describe resources used to provision infrastructure on Google Cloud Platform. \ 
Each module is described in a separate directory within <i>./modules</i> directory, and each directory consists of 3 terraform files: <i>outputs.tf</i>, <i>variables.tf</i> and one <i>.tf</i> file for certain resource. \
Resources used in this project are: google_compute_instance, google_artifact_registry_repository, google_compute_subnetwork, google_compute_network and google_compute_firewall.
Terraform state is managed as a remote file on GCP Cloud Storage bucket, and it is specified in the backend configuration in <i>main.tf</i> file.

### Ansible
Using terraform, 4 GCP compute instances are provisioned: for mongodb, mongo-express, server application and additional instance for building Docker image from application source code. \
Using ansible playbooks, on those instances are installed Docker