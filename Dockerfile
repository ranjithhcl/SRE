FROM golang:alpine as builder
ENV TERRAFORM_VERSION=1.2.8
RUN apk add --update git bash jq coreutils curl
ENV TF_DEV=true
ENV TF_RELEASE=true
WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh
WORKDIR /terraform
COPY aws_terraform /terraform
RUN /go/bin/terraform init

FROM alpine
RUN apk add --no-cache  git
COPY --from=builder /go/bin/terraform  /bin/terraform
COPY --from=builder /terraform/.terraform/plugins/linux_amd64/terraform-provider-*  /plugins/
WORKDIR /terraform
CMD ["/bin/terraform "]
