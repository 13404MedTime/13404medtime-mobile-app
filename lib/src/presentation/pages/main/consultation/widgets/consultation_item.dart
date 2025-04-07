import 'package:flutter/material.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/base_functions.dart';
import '../../../../../data/models/consultation/doctors_types_response.dart';
import '../../../../components/custom_cached_network_image/custom_cached_network_image.dart';
import '../specialists/specialists_page.dart';

class ConsultationItem extends StatelessWidget {
  const ConsultationItem({
    super.key,
    required this.doctor,
  });

  final DoctorTypeModel? doctor;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: AppUtils.kBorderRadius8,
        ),
        child: Padding(
          padding: AppUtils.kPaddingAll6,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.specialists,
                arguments: SpecialistsPageArgs(
                  doctorsType: doctor,
                  title: getLocalText(
                    doctor?.categoryNameUz ?? '',
                    doctor?.categoryName ?? '',
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomCachedNetworkImage(
                      imageUrl: doctor?.icon ?? '',
                      borderRadius: AppUtils.kBorderRadius50,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      getLocalText(
                        doctor?.categoryNameUz ?? '',
                        doctor?.categoryName ?? '',
                      ),
                      style: context.textStyle.onBackground50FontSize15Weight500,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      getLocalText(
                        (doctor?.descriptionUz ?? '').removeHtmlTeg,
                        (doctor?.description ?? '').removeHtmlTeg,
                      ),
                      style: context.textStyle.regularFootnote.copyWith(
                        color: context.color.grey,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
