FROM debian:testing
COPY sources.list /etc/apt/sources.list 
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends git build-essential ca-certificates
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends gnu-efi sbsigntool openssl libelf-dev gcc-9 pesign
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends bsdmainutils
RUN git clone https://github.com/rhboot/shim
#COPY shim /shim
RUN cd /shim && git checkout 15
WORKDIR /shim
COPY uos-uefi-ca.der /shim/uos-uefi-ca.der
COPY gcc-9-fix.patch /shim/gcc-9-fix.patch
RUN patch -Np1 -i ./gcc-9-fix.patch
RUN make RELEASE=15 ENABLE_HTTPBOOT=true EFI_PATH=/usr/lib \
    VENDOR_CERT_FILE=uos-uefi-ca.der EFIDIR=uos
WORKDIR /
RUN hexdump -Cv /shim/shim*.efi > build
