enum SensorStatus { logging, complete, pending }

class Sensor {
  final String code;
  final String serial;
  final SensorStatus status;
  final bool enabled;

  const Sensor({
    required this.code,
    required this.serial,
    required this.status,
    required this.enabled,
  });
}
