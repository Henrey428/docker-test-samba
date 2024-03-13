FROM ubuntu:latest

RUN apt-get update && apt-get install -y samba

# Check if smbpasswd is installed, and install it if not
RUN command -v smbpasswd >/dev/null 2>&1 || { apt-get update && apt-get install -y samba-common-bin; }

RUN adduser --disabled-password --gecos "" admin && (echo 1234; echo 1234) | smbpasswd -a admin

COPY smb.conf /etc/samba/smb.conf

RUN mkdir -p /samba/share
RUN echo "Hello, Samba!" > /samba/share/test.txt

CMD ["smbd", "--foreground", "--no-process-group"]