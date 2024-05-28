# kentik-custom-metrics

Repo for my blog post on [Kentik NMS Custom Metrics](https://net4fungr.github.io/posts/kustom-metrics/)

## Directory Structure
```
.
├── .gitignore
├── README.md
├── docker-compose.yml    >--- Fill in your CompanyID from the Portal
├── kagent-data
│   └── .gitkeep
└── override-data
    └── config
        ├── profiles
        │   ├── junos-fw-grpc.yml
        │   ├── junos-fw-snmp.yml
        │   └── xrv-fspec-grpc.yml
        ├── reports
        │   ├── junos-fw-grpc-counters.star
        │   ├── junos-fw-grpc-memory.star
        │   ├── junos-fw-grpc-policers.star
        │   ├── junos-fw-grpc.star
        │   ├── junos-fw-grpc.yml
        │   ├── junos-fw-snmp.yml
        │   ├── xrv-fspec-grpc.star
        │   └── xrv-fspec-grpc.yml
        └── sources
            ├── junos-fw-grpc.yml
            └── xrv-fspec-grpc.yml
```
