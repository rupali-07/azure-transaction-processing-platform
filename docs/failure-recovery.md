# Failure Handling & Recovery Design

This system is designed to gracefully handle failures without data loss.

---

## Failure Scenarios

### 1. API Failure
- Handled via retry logic at client level
- Azure Function auto-retries transient errors

### 2. Event Grid Delivery Failure
- Automatic retry by Event Grid
- Events moved to dead-letter storage if delivery fails

### 3. Service Bus Consumer Failure
- Message retried up to MaxDeliveryCount
- Failed messages moved to Dead Letter Queue (DLQ)

### 4. Databricks Job Failure
- Job retries configured
- Failed batches logged for reprocessing

---

## Dead Letter Queue (DLQ)

- Stores unprocessable messages
- Prevents system-wide failure
- DLQ messages can be:
  - Inspected
  - Replayed
  - Permanently discarded

---

## Data Consistency

- Cosmos DB ensures strong consistency per transaction
- Event-driven architecture avoids tight coupling
- Audit logs guarantee traceability

---

## Recovery Strategy

| Component | Recovery |
|--------|---------|
Azure Function | Auto-restart |
Service Bus | Replay DLQ |
Databricks | Job re-run |
Fabric Lakehouse | Delta version rollback |

---

## Availability Target

- Designed for **99.9% uptime**
- No single point of failure
