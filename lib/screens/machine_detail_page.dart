import 'package:flutter/material.dart';

class MachineDetailPage extends StatefulWidget {
  @override
  _MachineDetailPageState createState() => _MachineDetailPageState();
}

class _MachineDetailPageState extends State<MachineDetailPage> {
  final TextEditingController _notesController = TextEditingController();
  int _counter = 0;
  List<String> _logs = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _addLog(String log) {
    setState(() {
      _logs.add(log);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machine Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _notesController,
              decoration: InputDecoration(labelText: 'Notes'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Counter:'),
                    Text('$_counter'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: Text('+'),
                    ),
                    ElevatedButton(
                      onPressed: _decrementCounter,
                      child: Text('-'),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Implement ink maintenance logic
                    _addLog('Ink maintenance action performed.');
                  },
                  child: Text('Ink Maintenance'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement parts action logic
                    _addLog('Parts action performed.');
                  },
                  child: Text('Parts'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _logs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_logs[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}