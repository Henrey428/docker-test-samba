# docker-test-samba

A Docker image to start a Test-Samba share with a dummy user

## How to use?
1. Create Docker image with:
```bash
docker build -t <image-name> .
```
e.g.
```bash
docker build -t samba-test .
```

2. Run the image:
```bash
docker run -it -p 445:445 --name samba-container <image-name>
```

## Configuration
With the Docker image a dummy user is being created:

username: admin<br>
password: 1234

If you want to edit the samba configuration, edit the smb.conf and recreate the image.

