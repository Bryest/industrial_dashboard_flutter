import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/sensor.dart';

class DashboardState {
  final List<Sensor> sensors;

  const DashboardState({required this.sensors});

  DashboardState copyWith({List<Sensor>? sensors}) =>
      DashboardState(sensors: sensors ?? this.sensors);
}

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController()
      : super(DashboardState(sensors: const [
          Sensor(
              code: 'SRD',
              serial: 'SRD-000-AC00',
              status: SensorStatus.logging,
              enabled: true),
          Sensor(
              code: 'DVM',
              serial: 'DVM-000-GG00',
              status: SensorStatus.complete,
              enabled: false),
          Sensor(
              code: 'SRV',
              serial: 'SRV-000-RT00',
              status: SensorStatus.pending,
              enabled: false),
          Sensor(
              code: 'DVP',
              serial: 'DVP-000-WD00',
              status: SensorStatus.logging,
              enabled: true),
        ]));

  void toggleSensor(int index) {
    final sensors = [...state.sensors];
    final s = sensors[index];
    sensors[index] =
        Sensor(code: s.code, serial: s.serial, status: s.status, enabled: !s.enabled);
    state = state.copyWith(sensors: sensors);
  }
}

final dashboardControllerProvider =
    StateNotifierProvider<DashboardController, DashboardState>(
        (ref) => DashboardController());
