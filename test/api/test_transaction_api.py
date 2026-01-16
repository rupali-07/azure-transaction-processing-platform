import requests

def test_transaction_api():
    response = requests.post(
        "http://localhost:7071/api/TransactionAPI",
        json={"amount": 100, "currency": "INR"}
    )
    assert response.status_code == 200
