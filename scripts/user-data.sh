#!/bin/bash

yum update -y

yum install nginx -y

systemctl enable nginx

systemctl start nginx

cat <<EOF >/usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Launch2Live AI</title>
</head>

<body style="font-family:Arial;text-align:center;margin-top:100px;">
<h1>🚀 Launch2Live AI</h1>

<p>Terraform deployed this server successfully.</p>

<p>Infrastructure managed with AWS + Terraform.</p>
</body>
</html>
EOF