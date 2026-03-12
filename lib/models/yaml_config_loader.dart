import 'dart:io';
import 'package:yaml/yaml.dart';

/// Charge la configuration depuis privateConfig.yaml
Future<Map<String, int>> loadConfig(String path) async {
  final file = File(path);
  final contents = await file.readAsString();
  final yamlMap = loadYaml(contents) as YamlMap;

  // Conversion en Map<String, int>
  return yamlMap.map((key, value) => MapEntry(key.toString(), value as int));
}

/// Sers à retourner les variables stockés dans le fichier privateConfig.yaml
/*
void main() async {
  final config = await loadConfig('config/PrivateConfig.yaml');
  print(config['darkChocolateCocoaButter']); // devrait afficher 18
}
*/