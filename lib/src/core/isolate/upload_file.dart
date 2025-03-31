import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import '../constants/constants.dart';

Future<String> uploadFile({
  required File file,
  String? selectedFileName,
}) async =>
    Isolate.run<String>(
      () async {
        try {
          RequestOptions setStreamType<T>(RequestOptions requestOptions) {
            if (T != dynamic &&
                !(requestOptions.responseType == ResponseType.bytes ||
                    requestOptions.responseType == ResponseType.stream)) {
              if (T == String) {
                requestOptions.responseType = ResponseType.plain;
              } else {
                requestOptions.responseType = ResponseType.json;
              }
            }
            return requestOptions;
          }

          final Dio dio = Dio();
          final extra = <String, dynamic>{};
          final data = FormData();

          final String fileName = (selectedFileName != null) ? selectedFileName : file.path.split('/').last;

          final String type = file.path.split('.').last;
          data.files.addAll(
            [
              MapEntry(
                'file',
                MultipartFile.fromBytes(
                  file.readAsBytesSync(),
                  filename: '$fileName.$type',
                  contentType: MediaType(
                    type == 'jpg' || type == 'png' ? 'image' : 'document',
                    type,
                  ),
                ),
              ),
            ],
          );
          final result = await dio.fetch<Map<String, dynamic>>(
            setStreamType<void>(
              Options(
                method: 'POST',
                headers: {
                  'Authorization': 'API-KEY',
                  'x-api-key': 'P-JV2nVIRUtgyPO5xRNeYll2mT4F5QG4bS',
                },
                extra: extra,
              )
                  .compose(
                    dio.options,
                    'upload',
                    queryParameters: {'project-id': Constants.projectId},
                    data: data,
                  )
                  .copyWith(baseUrl: Constants.uploadUrl),
            ),
          );
          if (result.statusCode == 200 || result.statusCode == 201) {
            return type == 'jpg' || type == 'png'
                ? (Constants.cdnImage + result.data?['data']['filename'])
                : (Constants.cdnDocs + result.data?['data']['filename']);
          } else {
            return '';
          }
        } on Exception catch (e, s) {
          log('uploadFile error: $e $s');
          return '';
        }
      },
    );
