curl -XPOST 'localhost:9200/_snapshot/s3_elk_backup/test/_restore' -d '{
    "indices": "tomcat-2017.08.06",
    "ignore_unavailable": "true",
    "include_global_state": false
}'
