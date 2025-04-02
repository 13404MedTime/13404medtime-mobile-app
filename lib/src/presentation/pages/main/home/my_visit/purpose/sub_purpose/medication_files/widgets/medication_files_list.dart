import 'package:flutter/material.dart';

import '../../../../../../../../../config/router/app_routes.dart';
import '../../../../../../../../../core/extension/extension.dart';
import '../../../../../../../../../core/services/url_launcher.dart';
import '../../../../../../../../../data/models/purpose/files_response.dart';
import '../../../../../../../../components/custom_cached_network_image/custom_cached_network_image.dart';

class MedicationFilesListWidget extends StatelessWidget {
  const MedicationFilesListWidget({
    super.key,
    this.files = const [],
    required this.itemSize,
  });

  final List<FileModel> files;
  final double itemSize;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUtils.kBoxWidth16,
            for (final FileModel file in files) ...[
              GestureDetector(
                onTap: () => file.photo?.isNotEmpty ?? false
                    ? Navigator.pushNamed(context, Routes.photoView, arguments: file.photo ?? '')
                    : UrlLauncher.getUrl(file.file ?? ''),
                child: SizedBox(
                  width: itemSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: itemSize,
                        child: file.photo?.isNotEmpty ?? false
                            ? CustomCachedNetworkImage(
                                imageUrl: file.photo!,
                                width: itemSize,
                                height: itemSize,
                                fit: BoxFit.cover,
                                backgroundColor: context.color.onSurface20,
                                borderRadius: AppUtils.kBorderRadius8,
                              )
                            : ClipRRect(
                                borderRadius: AppUtils.kBorderRadius8,
                                child: ColoredBox(
                                  color: context.color.onSurface20,
                                  child: Image(
                                    image: const AssetImage('assets/png/file.png'),
                                    fit: BoxFit.cover,
                                    width: itemSize,
                                    height: itemSize,
                                  ),
                                ),
                              ),
                      ),
                      AppUtils.kBoxHeight6,
                      Text(
                        (file.photo?.isNotEmpty ?? false ? file.photo! : file.file ?? '').substring(
                            (file.photo?.isNotEmpty ?? false ? file.photo! : file.file ?? '').indexOf('_') + 1),
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (file.guid != files.last.guid) AppUtils.kBoxWidth12,
            ],
            AppUtils.kBoxWidth16,
          ],
        ),
      );
}
