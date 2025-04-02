import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../config/router/app_routes.dart';
import '../../core/connectivity/network_info.dart';
import '../../core/constants/app_keys.dart';
import '../../core/constants/constants.dart';
import '../../domain/network/api_client.dart';
import '../../injector_container.dart';

mixin RemoteLikeMixin {
  late final ApiClient api = sl();
  late final NetworkInfo networkInfo = sl();

  // void likeInit(ApiClient api, NetworkInfo networkInfo) {
  //   this.api = api;
  //   this.networkInfo = networkInfo;
  // }

  Future<void> getFavouriteDoctors() async {
    if (await networkInfo.isConnected) {
      try {
        final FavouriteDoctorsResponse response = await api.getFavouriteDoctors(
          jsonEncode({
            'with_relations': true,
            'is_favourite': true,
            'cleints_id': localSource.userId,
          }),
          Constants.projectId,
        );
        unawaited(localSource.prefes.put(AppKeys.favouriteDoctors, response.doctorsGuids ?? []));
      } on Exception catch (e, s) {
        debugPrint('e: $e | $s');
      }
    }
  }

  Future<void> updateLike({
    required String doctorId,
  }) async {
    final List favouriteList = localSource.prefes.get(AppKeys.favouriteDoctors) ?? [];
    final bool isFavourite = !favouriteList.contains(doctorId);
    if (await networkInfo.isConnected) {
      if (isFavourite) {
        unawaited(
          localSource.prefes.put(
            AppKeys.favouriteDoctors,
            [...favouriteList, doctorId],
          ),
        );
      } else {
        favouriteList.remove(doctorId);
        unawaited(localSource.prefes.put(AppKeys.favouriteDoctors, favouriteList));
      }
      try {
        await api.likeDoctor({
          'data': {
            'objects': [
              {
                'cleints_id': localSource.userId,
                'doctor_id': doctorId,
                'is_favourite': isFavourite,
              }
            ]
          },
          'updated_fields': [
            'cleints_id',
            'doctor_id',
          ]
        });
      } on Exception {
        if (isFavourite) {
          favouriteList.remove(doctorId);
          unawaited(localSource.prefes.put(AppKeys.favouriteDoctors, favouriteList));
        } else {
          unawaited(localSource.prefes.put(AppKeys.favouriteDoctors, [...favouriteList, doctorId]));
        }
      }
    } else {
      if (isFavourite) {
        favouriteList.remove(doctorId);
        unawaited(localSource.prefes.put(AppKeys.favouriteDoctors, favouriteList));
      } else {
        unawaited(localSource.prefes.put(AppKeys.favouriteDoctors, [...favouriteList, doctorId]));
      }
    }
  }
}

class FavouriteDoctorsResponse {
  FavouriteDoctorsResponse({
    this.doctorsGuids,
  });

  FavouriteDoctorsResponse.fromJson(Map json) {
    doctorsGuids = json['data']['data']['response'] is List
        ? List.generate((json['data']['data']['response'] as List).length,
            (index) => (json['data']['data']['response'] as List)[index]['doctor_id_data']?['guid'] ?? '')
        : const [];
  }

  List<String>? doctorsGuids;
}

class IsFavouriteDoctorResponse {
  IsFavouriteDoctorResponse();

  IsFavouriteDoctorResponse.fromJson(Map json);
}
