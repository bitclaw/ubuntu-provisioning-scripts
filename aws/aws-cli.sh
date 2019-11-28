#!/usr/bin/env bash

# s3 make bucket (create bucket)
aws s3 mb s3://cdn.site.com --region us-east-2
# Sync images from test-web bucket to new cdn.site.com  bucket
aws s3 cp s3://existing_bucket s3://cdn.site.com --recursive

# Setup same media directory structure so we only have to add a new host
# in our environment variables (EDGE_URL)
aws s3 mv s3://existing_bucket/images s3://cdn.site.com /images --recursive
