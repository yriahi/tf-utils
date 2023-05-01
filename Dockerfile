FROM alpine:latest

# Install dependencies
RUN apk add --no-cache git curl unzip bash python3 py-pip jq

# Install tfswitch
ARG TFSWITCH_VERSION=0.15.0
RUN curl -L -o /usr/local/bin/tfswitch https://github.com/warrensbox/terraform-switcher/releases/download/${TFSWITCH_VERSION}/terraform-switcher_${TFSWITCH_VERSION}_linux_amd64 \
    && chmod +x /usr/local/bin/tfswitch

# Install tfenv
ARG TFENV_VERSION=v2.2.2
RUN git clone https://github.com/tfutils/tfenv.git /usr/local/tfenv \
    && cd /usr/local/tfenv && git checkout ${TFENV_VERSION} \
    && ln -s /usr/local/tfenv/bin/* /usr/local/bin/

# Install tflint
ARG TFLINT_VERSION=0.31.0
RUN curl -L -o /tmp/tflint_linux_amd64.zip https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip \
    && unzip /tmp/tflint_linux_amd64.zip -d /usr/local/bin/ \
    && rm /tmp/tflint_linux_amd64.zip

# Install tfsec
ARG TFSEC_VERSION=0.58.3
RUN curl -L -o /usr/local/bin/tfsec https://github.com/tfsec/tfsec/releases/download/v${TFSEC_VERSION}/tfsec-linux-amd64 \
    && chmod +x /usr/local/bin/tfsec

# Install terraform-docs
ARG TERRAFORM_DOCS_VERSION=0.16.0
RUN curl -L -o /usr/local/bin/terraform-docs https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64 \
    && chmod +x /usr/local/bin/terraform-docs

# Install terragrunt
ARG TERRAGRUNT_VERSION=0.34.1
RUN curl -L -o /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
    && chmod +x /usr/local/bin/terragrunt

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]
