if [[ $# -ne 1 ]] ; then
    echo "Missing argument. Please provide index name"
    echo "Usage: elk_restore.sh tomcat-2017.08.05"
    exit 1
fi
# Store environment from command argument which will be used for S3 location
INDEX_NAME=$1
echo "INDEX_NAME: $1"

curl -XPOST "localhost:9200/_snapshot/s3_elk_backup/$INDEX_NAME-snapshot/_restore" -d '{
    "indices": "'"$INDEX_NAME"'",
    "ignore_unavailable": "true",
    "include_global_state": false
}'
