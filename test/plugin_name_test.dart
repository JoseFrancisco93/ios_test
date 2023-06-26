import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_name/plugin_name.dart';
import 'package:plugin_name/plugin_name_platform_interface.dart';
import 'package:plugin_name/plugin_name_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginNamePlatform
    with MockPlatformInterfaceMixin
    implements PluginNamePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PluginNamePlatform initialPlatform = PluginNamePlatform.instance;

  test('$MethodChannelPluginName is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginName>());
  });

  test('getPlatformVersion', () async {
    PluginName pluginNamePlugin = PluginName();
    MockPluginNamePlatform fakePlatform = MockPluginNamePlatform();
    PluginNamePlatform.instance = fakePlatform;

    expect(await pluginNamePlugin.getPlatformVersion(), '42');
  });
}
