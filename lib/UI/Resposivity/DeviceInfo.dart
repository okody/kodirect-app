import 'package:flutter/cupertino.dart';

import 'DeviceType.dart';

class DeviceInfo {
  final Orientation? orientation;
  final DeviceType? deviceType;
  final double? screenWidth;
  final double? screenHeight;
  final double? localWidth;
  final double? localHeight;

  DeviceInfo(
      {this.orientation,
      this.deviceType,
      this.screenHeight,
      this.screenWidth,
      this.localHeight,
      this.localWidth});
}
