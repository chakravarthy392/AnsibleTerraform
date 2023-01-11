#!/bin/bash

# Install & Start nginx server
  yum search nginx 
  amazon-linux-extras install nginx1 -y

  systemctl start nginx
  systemctl enable nginx
  
# Print the hostname which includes instance details on nginx homepage  
  sudo echo Hello World - from `hostname -f` > /usr/share/nginx/html/index.html

  
