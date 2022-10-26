docker exec -it gel sh

/usr/bin/enterprise-logs -config.file=/cfg/config.yml --target=tokengen --tokengen.token-file=/data/gel-admin-token.txt

exit

token=X19hZG1pbl9fLTA3YzMyZWJhZmI4MjU3ZjU6YjEiKVw5MGwtSDY5PDY/LTJdIzkvNmU4

curl -u :$token http://localhost:3100/admin/api/v3/clusters

curl -u :$token http://localhost:3100/admin/api/v3/tenants -X POST -d '
{
  "name": "tenant-01",
  "display_name": "Tenant 01",
  "cluster": "gel-pov"
}
'

curl -u :$token http://localhost:3100/admin/api/v3/accesspolicies -X POST -d '
{
  "name": "tenant-01-reader",
  "display_name": "Tenant 01 reader",
  "realms": [
    {
      "cluster": "gel-pov",
      "tenant": "tenant-01"
    }
  ],
  "scopes": [
    "logs:read",
    "rules:read",
    "alerts:read",
    "rules:write",
    "alerts:write"
  ]
}
'

curl -u :$token http://localhost:3100/admin/api/v3/tokens -X POST -d '
{
  "name": "grafana-data-source",
  "display_name": "Grafana data source",
  "access_policy": "tenant-01-reader"
}
'

readertoken=Z3JhZmFuYS1kYXRhLXNvdXJjZTo/ODItLDYpOHowQChLNCRqcF9+NC8zMzc=

curl -u :$token http://localhost:3100/admin/api/v3/accesspolicies -X POST -d '
{
  "name": "tenant-01-writer",
  "display_name": "Tenant 01 writer",
  "realms": [
    {
      "cluster": "gel-pov",
      "tenant": "tenant-01"
    }
  ],
  "scopes": [
    "logs:write",
    "rules:write",
    "alerts:write"
  ]
}
'

curl -u :$token http://localhost:3100/admin/api/v3/tokens -X POST -d '
{
  "name": "grafana-agent-logs-write",
  "display_name": "Grafana Agent logs write",
  "access_policy": "tenant-01-writerr"
}
'

writertoken=Z3JhZmFuYS1hZ2VudC1sb2dzLXdyaXRlOjU2TXw1WzYzKCxaQX5wOTMvNi17NT44LA==