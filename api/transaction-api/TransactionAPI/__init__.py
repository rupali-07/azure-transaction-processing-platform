import json
import uuid
import datetime
import os
import azure.functions as func
from azure.cosmos import CosmosClient
from azure.eventgrid import EventGridPublisherClient, EventGridEvent
from azure.core.credentials import AzureKeyCredential

COSMOS_URI = os.getenv("COSMOS_URI")
COSMOS_KEY = os.getenv("COSMOS_KEY")
EVENTGRID_ENDPOINT = os.getenv("EVENTGRID_ENDPOINT")
EVENTGRID_KEY = os.getenv("EVENTGRID_KEY")

cosmos_client = CosmosClient(COSMOS_URI, COSMOS_KEY)
db = cosmos_client.get_database_client("transactions_db")
container = db.get_container_client("transactions")

event_client = EventGridPublisherClient(
    EVENTGRID_ENDPOINT,
    AzureKeyCredential(EVENTGRID_KEY)
)

def main(req: func.HttpRequest):
    try:
        body = req.get_json()
        txn_id = str(uuid.uuid4())
        timestamp = datetime.datetime.utcnow().isoformat()

        record = {
            "id": txn_id,
            "transactionId": txn_id,
            "amount": body["amount"],
            "currency": body["currency"],
            "status": "RECEIVED",
            "createdAt": timestamp
        }

        container.create_item(record)

        event = EventGridEvent(
            subject="transaction.created",
            event_type="TransactionCreated",
            data=record,
            data_version="1.0"
        )

        event_client.send([event])

        return func.HttpResponse(
            json.dumps({"transactionId": txn_id}),
            status_code=200
        )

    except Exception as e:
        return func.HttpResponse(
            json.dumps({"error": str(e)}),
            status_code=500
        )
