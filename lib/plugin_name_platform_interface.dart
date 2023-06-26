import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_name_method_channel.dart';

abstract class PluginNamePlatform extends PlatformInterface {
  /// Constructs a PluginNamePlatform.
  PluginNamePlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginNamePlatform _instance = MethodChannelPluginName();

  /// The default instance of [PluginNamePlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginName].
  static PluginNamePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginNamePlatform] when
  /// they register themselves.
  static set instance(PluginNamePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
