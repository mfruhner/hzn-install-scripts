# hzn-install-scripts

## config Notes:

### make hzn trust the self signed CA Cert:

```bash
sudo cp ca.agri-gaia.localhost.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
sudo systemctl restart horizon
```
