part of 'extension.dart';

extension MapExtention on Map {
  Map<K, V> subMap<K, V>(int start) => {for (final key in keys.skip(start)) key: this[key]};
}
