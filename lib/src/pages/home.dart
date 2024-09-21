import 'package:flutter/material.dart';

import '../utils/udp.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var _message = '';
  final _textEditingController = TextEditingController();

  void send() {
    var message = _textEditingController.text;
    sendMessage(message);
    _textEditingController.clear();
  }

  @override
  void initState() {
    super.initState();
    addMessageListener((message) {
      setState(() {
        _message = message;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copy Anywhere'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(labelText: 'Input Your Message:'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text('Send'),
            onPressed: () {
              send();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(_message),
        ],
      )),
    );
  }
}
