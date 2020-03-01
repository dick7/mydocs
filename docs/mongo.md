# Mongo Database

## Backup & Restore

### 1. backup mongodb

* bash:

  a.backup all dbs: 
>[mongodump --host HOST_NAME --port PORT_NUMBER --dbpath DB_PATH --out BACKUP_DIRECTORY]

  b.backup selected db: 
>[mongodump --collection COLLECTION --db DB_NAME]

* ig:

>[mongodump -h 127.0.0.1:27017] [ --dbpath /data/db --out /www/backup/database]

* exp:
```
mongodump
```

### 2. restore mongodb

* bash: 
>[mongorestore][ -h <hostname><:port>][ -d dbname][ --dir <path>]

* exp:
```
mongorestore
```

* exp:
```
echo "restart mongod"
killall -9 mongod
```
  a.without configuration ,NOT RECOMMENTED
```
nohup mongod &
```
  b.with conf
```
mongod -f /www/server/mongodb/config.conf
echo "waiting for 7s:using:[read -t 7]"
read -t 7
mongorestore --dir /www/backup/database/dump
```

