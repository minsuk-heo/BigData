TODAY=$(date +'%Y.%m.%d')
YESTERDAY=$(date --date="1 days ago" +'%Y.%m.%d')
echo Today is $TODAY
echo Yesterday $YESTERDAY indices will be stored in S3

INDEX_PREFIXES=''
INDEX_PREFIXES+='tomcat- '
#INDEX_PREFIXES+='filebeat- '
#INDEX_PREFIXES+='database- '

for prefix in $INDEX_PREFIXES;
do
	INDEX_NAME=${prefix}$YESTERDAY
	SNAPSHOT_NAME=$INDEX_NAME"-snapshot"
	echo Start Snapshot $INDEX_NAME
	curl -XPUT "http://localhost:9200/_snapshot/s3_elk_backup/$SNAPSHOT_NAME?wait_for_completion=true" -d '{
		"indices": "'"$INDEX_NAME"'",
		"ignore_unavailable": "true",
		"include_global_state": false
	}'
	echo Successfully completed storing "$INDEX_NAME" in S3
done
