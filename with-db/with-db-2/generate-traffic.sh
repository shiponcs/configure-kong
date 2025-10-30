#!/bin/bash

# filepath: /Users/matin/office/kong/with-db/with-db-2/traffic-generator.sh

while true; do
  # Generate gRPC traffic
  grpcurl -plaintext -d '{"name": "fitzgerald", "author": "gatsby"}' localhost:8080 bookstore.BookStore.PostBook
  
  # Generate HTTP traffic
  curl http://localhost:8080/worldagain
  curl http://localhost:8080/world
  curl http://localhost:8080/world1
  curl http://localhost:8080/world2
  
  # Wait for 2 seconds before repeating
  sleep 2
done