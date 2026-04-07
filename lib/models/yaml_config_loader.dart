import 'dart:io';
import 'package:yaml/yaml.dart';

/// Loads the configuration from privateConfig.yaml
Future<Map<String, int>> loadConfig(String path) async {
  final file = File(path);
  final contents = await file.readAsString();
  final yamlMap = loadYaml(contents) as YamlMap;

  // Conversion to Map<String, int>
  return yamlMap.map((key, value) => MapEntry(key.toString(), value as int));
}

/// Used to return the variables stored in the privateConfig.yaml file
/*
void main() async {
  final config = await loadConfig('config/PrivateConfig.yaml');
  print(config['darkChocolateCocoaButter']); // should display 18
}
*/