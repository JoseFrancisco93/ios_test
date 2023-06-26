
import 'plugin_name_platform_interface.dart';

class PluginName {
  Future<String?> getPlatformVersion() {
    return PluginNamePlatform.instance.getPlatformVersion();
  }
}
