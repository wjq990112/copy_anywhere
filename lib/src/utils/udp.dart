import 'dart:io';

var host = '224.0.0.167';
var port = 58888;

void addMessageListener(Function(String message) callback) async {
  var interfaces = await NetworkInterface.list();
  for (var itf in interfaces) {
    var skt = await RawDatagramSocket.bind(InternetAddress.anyIPv4, port);
    skt.joinMulticast(InternetAddress(host), itf);
    skt.listen((event) {
      if (event != RawSocketEvent.read) {
        return;
      }
      var datagram = skt.receive();
      if (datagram == null) {
        return;
      }
      var msg = String.fromCharCodes(datagram.data);
      callback(msg);
    });
  }
}

void sendMessage(String message) async {
  var interfaces = await NetworkInterface.list();
  for (var itf in interfaces) {
    var skt = await RawDatagramSocket.bind(InternetAddress.anyIPv4, port);
    skt.joinMulticast(InternetAddress(host), itf);
    skt.send(message.codeUnits, InternetAddress(host), port);
  }
}
