# reference: https://uk.mathworks.com/matlabcentral/answers/800901-interface-between-python-and-matlab-using-tcpserver
import socket
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
    sock.connect(('localhost', 1234))
    print("Connection to server established!")
    sock.sendall(b'Hello World')
    data = sock.recv(1024)
print('Received', repr(data))