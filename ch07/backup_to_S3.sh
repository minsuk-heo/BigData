curl -XPUT 'http://localhost:9200/_snapshot/s3_elk_backup/test?wait_for_completion=true' -d '{
    "indices": "tomcat-2017.08.06",
    "ignore_unavailable": "true",
    "include_global_state": false
}'
