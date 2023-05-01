# Terraform Utilities Docker Image

This Docker image is designed to provide a convenient environment for working with Terraform projects. It comes pre-installed with a variety of tools that help manage, lint, and document Terraform configurations.

## Included Tools

- **tfswitch**: A tool for managing multiple Terraform versions.
- **tfenv**: A Terraform version manager that helps manage and switch between different Terraform versions easily.
- **tflint**: A Terraform linter for detecting possible issues in Terraform configurations.
- **tfsec**: A static code analysis tool for identifying potential security vulnerabilities in Terraform code.
- **terraform-docs**: A tool for generating documentation from Terraform configurations.
- **terragrunt**: A thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules.

## Usage

### Pulling the Image

To use this Docker image, first pull the image from Docker Hub:

```bash
docker pull yriahi/tf-utils:latest
```

### Running a Container

After pulling the image, run a container with your desired command:

```bash
docker run -it --rm -v $(pwd):/workspace -w /workspace yriahi/tf-utils:latest <command>
```

Replace `tagname` with the tag you used when pulling the image, and `<command>` with the desired tool command (e.g., `terraform`, `tflint`, `terraform-docs`, etc.).

By mounting your working directory to the `/workspace` directory inside the container, you can directly work with your local Terraform configurations using the pre-installed tools.
