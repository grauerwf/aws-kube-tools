ARCH=$(uname -m)
case $ARCH in
  aarch64) ARCH="arm64" ;;
  x86_64) ARCH="amd64" ;;
  *) ARCH="NOT_SUPPORTED" ;;
esac
if [ "${ARCH}" != "NOT_SUPPORTED" ]; then
  wget "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${ARCH}/kubectl" -O /usr/local/bin/kubectl
  wget https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.6.14/aws-iam-authenticator_0.6.14_linux_${ARCH} -O /usr/local/bin/aws-iam-authenticator
  chmod +x /usr/local/bin/aws-iam-authenticator /usr/local/bin/kubectl
  curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
else
  echo "This CPU arch is not supported, exiting...."
  exit 1
fi
