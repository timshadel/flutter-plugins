part of '../health.dart';

/// A [HealthDevice] object corresponds to the actual device which
/// is the source of a HealthDataPoint.
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class HealthDevice {
  /// A way of representing the manufacturer of the device.
  String? manufacturer;

  /// A way of representing the model of the device.
  String? model;

  /// A way of identifying the type of device.
  String type;

  HealthDevice({
    this.manufacturer,
    this.model,
    String? type,
  }): type = type ?? "unknown";

  /// Create a [HealthDataPoint] from json.
  factory HealthDevice.fromJson(Map<String, dynamic> json) =>
      _$HealthDeviceFromJson(json);

  /// Convert this [HealthDataPoint] to json.
  Map<String, dynamic> toJson() => _$HealthDeviceToJson(this);
}
