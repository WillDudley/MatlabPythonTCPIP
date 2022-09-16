import json
import socket
import time

if __name__=="__main__":
    sock = socket.create_connection(('localhost', 1234), timeout=10)
    print("Connection to server established!")
    counter = 1
    while True:
        payload = {"counter": counter}
        sock.sendall(bytes(json.dumps(payload).ljust(1024, ' ').encode()))
        print(f"Sent some data")
        data = sock.recv(1024)
        print(data.strip())
        counter += 1
        time.sleep(5)
