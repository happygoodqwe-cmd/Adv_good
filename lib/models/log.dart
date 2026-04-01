enum LogType {
  INFO,
  WARNING,
  ERROR,
  DEBUG,
}

class MachineLog {
  LogType logType;
  String message;
  DateTime timestamp;

  MachineLog(this.logType, this.message) : timestamp = DateTime.now();

  @override
  String toString() {
    return '[$timestamp] ${logType.toString().split('.').last}: $message';
  }
}