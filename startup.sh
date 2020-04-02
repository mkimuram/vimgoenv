#! /bin/bash

groupadd -g $gid mygrp
useradd -u $uid -g $gid -d /home/user user
cp -rT /home/tmp /home/user
ln -s /go /home/user/
chown -R user:mygrp /home/user /go
cd /home/user

sudo -u user HOME=/home/user PATH=${PATH}:/usr/local/go/bin GOPATH=/home/user/go bash
