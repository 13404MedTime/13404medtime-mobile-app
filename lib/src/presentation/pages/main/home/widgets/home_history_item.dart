import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../../components/custom_cached_network_image/custom_cached_network_image.dart';

class HomeHistoryItemWidget extends StatelessWidget {
  const HomeHistoryItemWidget({
    required this.onTap,
    required this.data,
    required this.names,
    super.key,
  });

  final VoidCallback onTap;
  final NaznachenieIdData data;
  final List<String> names;

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
              child: Padding(
                padding: AppUtils.kPaddingAll16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.illIdData?.illnessName ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.error,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppUtils.kBoxHeight2,
                    Text(
                      names.isNotEmpty ? names.join(', ') : context.translate('no_drugs'),
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
                      data.createdTime?.ddMMMM ?? '',
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
                      height: 32,
                      child: Row(
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
                          AppUtils.kBoxWidth8,
                          Expanded(
                            child: Text(
                              data.doctorIdData?.doctorName ?? '',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: context.theme.colorScheme.onSurface,
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
          ),
        ),
      );
}
