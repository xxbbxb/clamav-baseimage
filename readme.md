# clamav-baseimage

Builds latest stable version of antivirus with actual databases

### Usage
```
sudo docker build --no-cache -t "clamav-baseimage:latest" .
```

or with hashicorp packer
```
sudo <packer> build clamav-baseimage.json
```

sudo docker run -it clamav-baseimage