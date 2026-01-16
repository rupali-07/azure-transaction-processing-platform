def test_transaction_payload():
    payload = {
        "transactionId": "txn-101",
        "amount": 500,
        "currency": "USD"
    }

    assert payload["amount"] > 0
    assert payload["currency"] in ["USD", "INR", "EUR"]
