## Architecture Overview

Client → API Management → Azure Function  
Azure Function → Cosmos DB (Transactions)  
Azure Function → Event Grid → Service Bus  
Service Bus → Databricks → Fabric Lakehouse  

This ensures:
- Low latency ingestion
- Loose coupling
- High fault tolerance
- Full auditability
