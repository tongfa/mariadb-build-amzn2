# MariaDB build for Amzn2 linux.

## prerequisites

1. bash
2. docker

## to build

Run `go.sh` to initiate build.  This will leave the rpm files in the root folder of this repo.

## to install

The following packages are required:
```yum install -y iproute lsof rsync libaio gnutls-c++ perl-DBI```

Then this is my favorite installation set:
```rpm -i MariaDB-10.3.8-amzn2-x86_64-common.rpm MariaDB-10.3.8-amzn2-x86_64-server.rpm MariaDB-10.3.8-amzn2-x86_64-client.rpm```
