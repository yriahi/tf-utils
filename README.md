[![Docker](https://github.com/yriahi/tf-utils/actions/workflows/docker.yml/badge.svg)](https://github.com/yriahi/tf-utils/actions/workflows/docker.yml)

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

This command runs a Docker container using the `yriahi/tf-utils:latest` image in an interactive mode with a pseudo-TTY (-it), and removes the container after it has been stopped (--rm). It mounts the current working directory on your host system ($(pwd)) to the /workspace directory inside the container (-v $(pwd):/workspace). It sets the working directory inside the container to /workspace (-w /workspace). Finally, it runs a specified <command> within the container.

Here's a breakdown of the options used in the command:

- -it: Allocates a pseudo-TTY and runs the container in interactive mode, which allows you to interact with the container's shell or any interactive programs running inside the container.
- --rm: Automatically removes the container when it exits. This helps to keep your system clean, as it prevents the accumulation of stopped containers.
- -v $(pwd):/workspace: Mounts a volume from the host system to the container. In this case, it mounts the current working directory ($(pwd)) on the host to the /workspace - directory in the container. This allows you to share files and directories between the host and the container.
- -w /workspace: Sets the working directory inside the container. All subsequent commands executed in the container will run in this directory. In this case, it's set to /workspace.
- yriahi/tf-utils:latest: Specifies the Docker image to use for the container. In this case, it's the latest version of the yriahi/tf-utils image.
- <command>: Represents the command that will be executed within the container. Replace `tagname` with the tag you used when pulling the image, and `<command>` with the desired tool command (e.g., `terraform`, `tflint`, `terraform-docs`, etc.).

By mounting your working directory to the `/workspace` directory inside the container, you can directly work with your local Terraform configurations using the pre-installed tools.
