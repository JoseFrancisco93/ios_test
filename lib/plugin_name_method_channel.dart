import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_name_platform_interface.dart';

/// An implementation of [PluginNamePlatform] that uses method channels.
class MethodChannelPluginName extends PluginNamePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_name');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
