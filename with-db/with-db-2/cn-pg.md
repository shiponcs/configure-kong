### Add the repo
```bash
helm repo add cnpg https://cloudnative-pg.github.io/charts
helm upgrade --install cnpg \
  --namespace cnpg \
  --create-namespace \
  cnpg/cloudnative-pg
```
### create PG cluster
Apply this file

```yaml
echo 'apiVersion: postgresql.cnpg.io/v1
kind: Cluster
metadata:
  name: kong-cp-db
  namespace: kong
spec:
  instances: 1
  bootstrap:
    initdb:
      database: kong
      owner: kong
      secret:
        name: kong-db-secret
  storage:
    size: 10Gi
---
apiVersion: v1
kind: Secret
metadata:
  name: kong-db-secret
  namespace: kong
type: Opaque
stringData:
  username: kong
  password: demo123' | kubectl apply -f -
```