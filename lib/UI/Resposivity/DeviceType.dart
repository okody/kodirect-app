import 'package:flutter/cupertino.dart';

enum DeviceType
{
  MobileDevice,
  TabletDevice,
  DisktopDevice,
}


DeviceType getDeviceType(MediaQueryData mediaQueryData) 
{

  // [1] -- Get Device orientation -- Define a variable for width
   Orientation orientation =  mediaQueryData.orientation;
  double width = mediaQueryData.size.width;

  // [2] -- Check if the device orientation landscape and asgin the hight the width if it is
  if(orientation == Orientation.landscape) 
  {
    width = mediaQueryData.size.height;
  }

  // [3] --  if check the width to determine the type of the device
  if(width >= 950)
    return DeviceType.DisktopDevice;
   else if(width >= 600)
    return DeviceType.TabletDevice;
  else
  return DeviceType.MobileDevice;




}