import socket
import os


try:
    os.unlink('/tmp/client.sock')
except:
    pass
cli = socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM)
cli.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
cli.bind('/tmp/client.sock')  # address of the client
cli.connect('/var/run/shadowsocks-manager.sock')  # address of Shadowsocks manager

cli.send(b'ping')
print(cli.recv(1506))  # You'll receive 'pong'

cli.send(b'add: {"server_port":8001, "password":"7cd308cc059"}')
print(cli.recv(1506))  # You'll receive 'ok'