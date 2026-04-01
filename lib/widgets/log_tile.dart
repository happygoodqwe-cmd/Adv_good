import 'package:flutter/material.dart';

class LogTile extends StatelessWidget {
  final String message;
  final String logType;
  final DateTime timestamp;

  LogTile({required this.message, required this.logType, required this.timestamp});

  Color _getAvatarColor() {
    switch (logType) {
      case 'INFO':
        return Colors.blue;
      case 'WARNING':
        return Colors.orange;
      case 'ERROR':
        return Colors.red;
      case 'DEBUG':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _getAvatarColor(),
        child: Text(logType[0]),
      ),
      title: Text('${timestamp.toIso8601String()} - $message'),
    );
  }
}