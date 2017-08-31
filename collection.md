## Java
```bash
cd /usr
mkdir java
cd java
mv /tmp/jdk-8u91-linux-x64.tar.gz .
tar -zxvf jdk-8u91-linux-x64.tar.gz
rm jdk-8u91-linux-x64.tar.gz
ln -s /usr/java/jdk1.8.0_112 latest
ln -s latest default
cd /usr/bin/
ln -s /usr/java/default/bin/java java
```
## Java keytool
```bash
keytool -genkey -alias <ALIAS> -keyalg RSA -keystore keystore.jks -keysize 2048
keytool -export -alias <ALIAS> -file <ALIAS>.crt -keystore keystore.jks
keytool -import -alias <ALIAS> -file <ALIAS>.cer -keystore /opt/jboss/etc/truststore.jts
keytool -delete -noprompt -alias <ALIAS> -keystore /opt/jboss/etc/truststore.jts
keytool -list -v -keystore /opt/jboss/etc/keystore.jks
keytool -importcert -alias utviklerproxy -file ./webproxy.cer -keystore /usr/java/jdk1.8.0_131/jre/lib/security/cacerts
```

## Maven
```bash
mvn process-sources -P sysdoc

mvn jgitflow:release-start

mvn versions:set -DnewVersion=<VERSION> -DgenerateBackupPoms=false

mvn -f build/config/ -Dflyway.url=jdbc:oracle:thin:@<HOST>:1521/<SID> -Dflyway.user=<USER> -Dflyway.password=<PWD> -Dflyway.locations=filesystem:<SQL-FOLDER> flyway:info
```

## Git
```bash
git format-patch origin/develop -o ./patch

git rebase -i HEAD~2

git fetch --prune

git reset --hard HEAD

git diff develop...<feature/BRANCHNAME>

git branch --no-merged master

git tag <VERSION>; git push origin --tag
```
### delete branch locally and remotely
```bash
branch=release/1.7.0
git branch -D $branch
git push origin :$branch
git fetch -p
```

## Oracle
```sql
SELECT 'DROP TABLE "' || table_name || '" CASCADE CONSTRAINTS;' FROM user_tables;
SELECT 'DROP SEQUENCE "' || sequence_name || '";' FROM USER_SEQUENCES;

BEGIN
   FOR cur_rec IN (SELECT object_name, object_type FROM user_objects WHERE object_type IN('TABLE', 'SEQUENCE'))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                 );
      END;
   END LOOP;
END;
/
exit;
```

```sql
drop user es_deploy_empty;
create user es_deploy_empty identified by es_deploy_empty;
grant connect, resource, create job, create table, create synonym, create view, create materialized view to es_deploy_empty; 
```
```sql
alter system set processes=150 scope=spfile;
alter database set TIME_ZONE='+00:00';
alter system set recyclebin=OFF DEFERRED;
alter profile default limit password_life_time unlimited;
CREATE USER vl_dba IDENTIFIED BY vl_dba;
GRANT CREATE USER, CONNECT, RESOURCE, DBA, ALTER SESSION TO vl_dba WITH ADMIN OPTION;
```
## Docker
```bash
curl -k https://<HOST_REGISTRY>:5000/v2/_catalog 
```

## Elasticsearch
```bash
curl -v -H "Content-Type: application/x-ndjson" -H "Accept:application/json, text/plain, */*" -H "kbn-version:5.2.2" -XPOST https://<IDENT>:<PASSORD>@logs.adeo.no/elasticsearch/_msearch --data-binary @DATA_FILE
```
