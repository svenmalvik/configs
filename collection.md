## Oracle: delete
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

## Maven
```
mvn process-sources -P sysdoc

mvn jgitflow:release-start

mvn versions:set -DnewVersion=<VERSION> -DgenerateBackupPoms=false

mvn -f build/config/ -Dflyway.url=jdbc:oracle:thin:@<HOST>:1521/<SID> -Dflyway.user=<USER> -Dflyway.password=<PWD> -Dflyway.locations=filesystem:<SQL-FOLDER> flyway:info
```
