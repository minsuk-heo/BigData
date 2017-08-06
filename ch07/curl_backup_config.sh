curl -XPUT 'http://localhost:9200/_snapshot/s3_elk_backup' -d '{
    "type": "s3",
    "settings": {
        "access_key": "[YOUR_ACCESS_KEY]",
        "secret_key": "YOUR_SECRET_KEY",
        "bucket": "YOUR_BUCKET",
        "region": "YOUR_REGION",
        "base_path": "elasticsearch",
        "max_retries": 3
    }
}'
