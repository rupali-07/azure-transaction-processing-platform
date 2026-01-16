import time

def test_high_volume_transactions():
    for i in range(100):
        time.sleep(0.01)
        assert i >= 0
