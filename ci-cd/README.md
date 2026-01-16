# CI/CD Pipelines

This folder contains GitHub Actions workflows for:

- Infrastructure deployment (Azure Bicep)
- Azure Function API deployment
- Databricks / Fabric pipeline execution

## Secrets Required

- `AZURE_CREDENTIALS` – Service Principal JSON

## Pipelines

| Pipeline | Purpose |
|--------|--------|
deploy-infra.yml | Provision Azure resources |
deploy-function.yml | Deploy API code |
databricks-job.yml | Trigger data pipelines |
