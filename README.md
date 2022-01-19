# hzn-install-scripts

## config Notes:

```bash
export GODEBUG=x509ignoreCN=0

cp agri-gaia.localhost.crt /usr/local/share/ca-certificates/
update-ca-certificates
systemctl restart horizon

```
