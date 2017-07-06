import socket
s=socket.socket()
host=socket.gethostname()
port=1234
s.bind((host,port))
s.listen(5)
