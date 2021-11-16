import 'package:assignment3/models/message.model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:assignment3/miscs/environment.misc.dart';
import 'package:http/http.dart' as http;

class Chat extends GetxController {
  //expect Array<Message>
  //expect topic to be named "alpha, beta, gamma"
  var alpha = [].obs;
  var beta = [].obs;
  var gamma = [].obs;
  final String broadcastUrl = Environment.broadcastUrl;

  void assignTopics(Message msg) {
    //expect processed form from the receiving end
    switch (msg.topic) {
      case 'alpha':
        alpha.add(msg);
        break;
      case 'beta':
        beta.add(msg);
        break;
      case 'gamma':
        gamma.add(msg);
        break;
      default:
        log(msg.topic, name: 'sussy wussy');
        break;
    }
  }

  void broadcast(Message msg) {
    Map<String, String> content = {
      'topic': msg.topic,
      'user': msg.sender,
      'content': msg.content,
    };

    http.post(
      Uri.parse(Environment.broadcastUrl),
      body: content,
    );
  }
}
