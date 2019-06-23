#!/usr/bin/env bash

# Run this script with nohup when running on remove server, i.e: nohup bash sync_folder_to_s3_bucket &
s3cmd sync /home/user/media s3://BUCKET_NAME
