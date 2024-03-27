
# Terraform resource to execute the Docker build command
resource "null_resource" "docker_build" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "docker build -t ${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact-reg-repo}/${var.image_name}:v1 ."
  }
}

# Terraform resource to execute the Docker push command
resource "null_resource" "docker_push" {
  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [null_resource.docker_build]

  provisioner "local-exec" {
    command = "docker push ${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact-reg-repo}/${var.image_name}:v1"
  }
}

#build cloud run service
resource "null_resource" "deploy" {
  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [null_resource.docker_push]

  provisioner "local-exec" {
    command = "gcloud beta run deploy nl2sql --image=${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact-reg-repo}/${var.image_name}:v1 --allow-unauthenticated --port=8080 --service-account=${var.cr-sa} --concurrency=200 --cpu=4 --memory=2Gi --max-instances=2 --network=${var.vpc} --subnet=${var.subnet} --vpc-egress=all-traffic --region=${var.region}"
  }
}
