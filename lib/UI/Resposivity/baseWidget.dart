import 'package:flutter/material.dart';

import 'DeviceInfo.dart';
import 'DeviceType.dart';

class BaseWidget extends StatelessWidget {
  final buidler;

  const BaseWidget({Key? key, this.buidler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      MediaQueryData mediaQueryData = MediaQuery.of(context);

      DeviceInfo deviceInfo = DeviceInfo(
        orientation: mediaQueryData.orientation,
        screenHeight: mediaQueryData.size.height,
        screenWidth: mediaQueryData.size.width,
        deviceType: getDeviceType(mediaQueryData),
        localHeight: constrains.maxHeight,
        localWidth: constrains.maxWidth,
      );

      return buidler(context, deviceInfo);
    });
  }

  // DeviceInfo(
  //     {Orientation? orientation,
  //     double? screenHeight,
  //     double? screenWidth,
  //     DeviceType? deviceType,
  //     double? localHeight,
  //     double? localWidth}) {}
}
