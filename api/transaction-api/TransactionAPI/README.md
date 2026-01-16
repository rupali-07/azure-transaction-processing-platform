# Transaction API – Azure Function

This module implements the **Transaction Ingestion API** for the
Azure Serverless Transaction Processing Platform.

It is built using **Azure Functions (Python)** and is responsible for:
- Accepting incoming transaction requests
- Validating payloads
- Persisting transactions to Cosmos DB
- Publishing transaction events to Event Grid

---

## API Endpoint

### POST `/api/TransactionAPI`

#### Request Payload
```json
{
  "amount": 1000,
  "currency": "INR"
}
