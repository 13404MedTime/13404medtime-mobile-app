// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../../../components/buttons/card_button.dart';
import '../../../../../components/custom_cached_network_image/custom_cached_network_image.dart';

class SearchedDoctorDiseaseItem extends StatelessWidget {
  const SearchedDoctorDiseaseItem({
    super.key,
    this.data,
    required this.onTap,
  });

  final DoctorIdData? data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onTap,
        contentPadding: AppUtils.kPaddingHorizontal16,
        leading: CustomCachedNetworkImage(
          imageUrl: data?.medicPhoto ?? 'photo',
          borderRadius: AppUtils.kBorderRadius50,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        ),
        title: Text(
          data?.doctorName ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          (data?.desc ?? '').removeHtmlTeg.trim(),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: context.theme.colorScheme.onSurface,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: CardButton(
            title:
                '${data?.experience ?? 0} ${context.translate('years_of_experience').replaceFirst('\${i}', (data?.experience ?? 0).numberToWordRussian(context.translate('years_s'), context.translate('years_g'), context.translate('years_m')))}'),
      );
}
