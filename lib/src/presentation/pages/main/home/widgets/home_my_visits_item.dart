import 'package:flutter/material.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/base_functions.dart';
import '../../../../../data/models/home/get_visits/get_visits_response.dart';
import '../../../../additional_mixins/remote_like_mixin.dart';
import '../../../../components/custom_cached_network_image/custom_cached_network_image.dart';

class HomeMyVisitsItemWidget extends StatelessWidget with RemoteLikeMixin {
  HomeMyVisitsItemWidget({
    required this.onTap,
    required this.data,
    super.key,
  });

  final VoidCallback onTap;
  final MyVisitModel data;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll8,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            color: context.theme.colorScheme.surface,
          ),
          child: InkWell(
            borderRadius: AppUtils.kBorderRadius8,
            onTap: onTap,
            child: SizedBox(
              width: 200,
              child: Stack(
                children: [
                  ValueListenableBuilder(
                    valueListenable: localSource.prefes.listenable(
                      keys: [AppKeys.favouriteDoctors],
                    ),
                    builder: (context, box, widget) {
                      final bool isFavourite =
                          box.get(AppKeys.favouriteDoctors)?.contains(data.doctorIdData?.guid ?? '') ?? false;
                      return Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4, right: 4),
                          child: IconButton(
                            onPressed: () {
                              updateLike(doctorId: data.doctorIdData?.guid ?? '');
                            },
                            icon: Icon(
                              isFavourite ? Icons.favorite : Icons.favorite_border,
                              size: 24,
                              color:
                                  isFavourite ? context.theme.colorScheme.primary : context.theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: AppUtils.kPaddingAll16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: AppUtils.kBorderRadius50,
                            child: CustomCachedNetworkImage(
                              imageUrl: data.doctorIdData?.medicPhoto ?? '',
                              height: 32,
                              width: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                          AppUtils.kBoxHeight6,
                          Text(
                            data.doctorIdData?.doctorName ?? '',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppUtils.kBoxHeight2,
                          Text(
                            data.doctorIdData?.hospital ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: context.theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppUtils.kBoxHeight2,
                          Text(
                            data.date?.ddMMMM ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: context.theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppUtils.kSpacer,
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: AppUtils.kBorderRadius50,
                                  child: CustomCachedNetworkImage(
                                    imageUrl: data.doctorIdData?.categoryIdData?.icon ?? 'icon',
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                AppUtils.kBoxWidth6,
                                Expanded(
                                  child: Text(
                                    getLocalText(data.doctorIdData?.categoryIdData?.categoryNameUz ?? '',
                                        data.doctorIdData?.categoryIdData?.categoryName ?? ''),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      // color: context.theme
                                      //     .colorScheme.onSurface,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
