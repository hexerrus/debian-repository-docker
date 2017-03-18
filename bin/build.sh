#!/bin/sh
#set +x

#DIST="jessie"
#echo "echo 'deb http://repo.x812.ru/debian wheezy stable testing' > /etc/apt/sources.list.d/itroof.list"

#mkdir -p /var/www/debian/dists/$DIST/testing/packages
#mkdir -p /var/www/debian/dists/$DIST/testing/binary-i386
#mkdir -p /var/www/debian/dists/$DIST/testing/binary-amd64
#cd /var/www/debian/

#dpkg-scanpackages -m --arch amd64 dists/$DIST/testing/packages /dev/null | gzip -9c > /var/www/debian/dists/$DIST/testing/binary-amd64/Packages.gz
#dpkg-scanpackages -m --arch i386 dists/$DIST/testing/packages /dev/null | gzip -9c > /var/www/debian/dists/$DIST/testing/binary-i386/Packages.gz


cp -pr /repo/* /var/www/

for collection in `find /var/www/*/*/*/* -type d -maxdepth 0`; do
  echo $collection
  mkdir -p $collection/packages
  mkdir -p $collection/binary-i386
  mkdir -p $collection/binary-amd64

  dpkg-scanpackages -m --arch amd64 $collection/packages /dev/null | gzip -9c > $collection/binary-amd64/Packages.gz
  dpkg-scanpackages -m --arch i386 $collection/packages /dev/null | gzip -9c > $collection/binary-i386/Packages.gz
done 
