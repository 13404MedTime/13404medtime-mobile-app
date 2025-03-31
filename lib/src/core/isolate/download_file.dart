import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Future<String> downloadFile({
  required String url,
  required String path,
}) =>
    Isolate.run<String>(
      () async {
        final Dio dio = Dio();
        try {
          await dio.download(url, path);
        } on Exception catch (e, s) {
          log('Exception $e $s $path');
          rethrow;
        }
        return path;
      },
    );

Future<String> getFilePath(
  String filename,
  String type,
) async {
  late Directory dir;
  try {
    dir = await getApplicationDocumentsDirectory();
  } on Exception catch (err, s) {
    log('Cannot get download folder path $err $s');
    return '';
  }
  if (type.isEmpty) return '${dir.path}/$filename';
  return '${dir.path}/$filename.$type';
}
