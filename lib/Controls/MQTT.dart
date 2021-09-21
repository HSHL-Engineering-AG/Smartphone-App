//import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MessageT {
  String topic;
  String message;

  MessageT({
    required this.topic,
    required this.message,
  });
}

MqttServerClient client = MqttServerClient('192.168.1.105', 'flutterApp');

var messages = [];

mqttConnect() {
  client = MqttServerClient('192.168.1.105', 'client1234');
  client.keepAlivePeriod = 60;
  client.autoReconnect = true;
  client.onConnected = onConnected;
  client.onDisconnected = onDisconnected;

  try {
    client.connect();
  } on NoConnectionException catch (e) {
    print(e.toString());
    client.disconnect();
  }

  // if (client.connectionStatus!.state == MqttConnectionState.connected) {
  //   print('client connected');
  // } else {
  //   /// Use status here rather than state if you also want the broker return code.
  //   print('status is ${client.connectionStatus}');
  //   client.disconnect();
  // }

  //SUBSCRIBE
  // if (client.connectionStatus!.state == MqttConnectionState.connected) {
  //   client.subscribe('home/#', MqttQos.atLeastOnce);
  // }

  client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    final recMess = c![0].payload as MqttPublishMessage;
    final pt =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print(
        'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
    print('');
  });
}

void publishMessage(String addressT, String payloadT) {
  print('SEND MESSAGE');
  //PUBLISH
  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    final payload = MqttClientPayloadBuilder();
    payload.addString(payloadT);
    client.publishMessage(addressT, MqttQos.atLeastOnce, payload.payload!);
  }
  messages.add(MessageT(topic: addressT, message: payloadT));
}

void onConnected() {
  print('Connected');
}

void onDisconnected() {
  print('Disconnected');
}
