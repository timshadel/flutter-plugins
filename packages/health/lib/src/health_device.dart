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

  /// Cache lowercase version of the type for `matches()`.
  late String _lowerType;

  HealthDevice({
    this.manufacturer,
    this.model,
    String? type,
  }): type = (type ?? "unknown") {
    _lowerType = this.type.toLowerCase();
  }

  /// Create a [HealthDataPoint] from json.
  factory HealthDevice.fromJson(Map<String, dynamic> json) =>
      _$HealthDeviceFromJson(json);

  /// Convert this [HealthDataPoint] to json.
  Map<String, dynamic> toJson() => _$HealthDeviceToJson(this);

  /// Check if this device matches the given type.
  /// Nulls allowed for call site simplicity.
  bool matches(String? otherType) => otherType?.toLowerCase() == _lowerType;
}
