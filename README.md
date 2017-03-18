# debian-repository-docker



add package to repository and start
```
cp package-file.deb ./repo/debian/dists/jessie/stable/packages/
./start.sh
```


To add repository to source list on host
```
echo "deb http://hostname/debian jessie stable" >  /etc/apt/sources.list.d/mylist.list
"
```
