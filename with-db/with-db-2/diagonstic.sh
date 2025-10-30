#!/bin/bash
echo "=== Kong gRPC Route Diagnostic ==="

echo "1. Current services:"
curl -s http://localhost:8001/services | jq '.data[] | {name, protocol, host, port}'

echo "2. Current routes:"
curl -s http://localhost:8001/routes | jq '.data[] | {name, protocols, paths, hosts}'

echo "3. Testing direct gRPC:"
grpcurl -plaintext localhost:50051 list

echo "4. Testing through Kong:"
timeout 5 grpcurl -plaintext -v localhost:8080 list 2>&1 | head -20
