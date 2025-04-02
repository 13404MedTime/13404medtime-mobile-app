// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../components/custom_cached_network_image/custom_cached_network_image.dart';

class SearchedDiseaseItem extends StatelessWidget {
  const SearchedDiseaseItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.onTap,
  });

  final String imageUrl;
  final String title;
  final String desc;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onTap,
        contentPadding: AppUtils.kPaddingHorizontal16,
        leading: CustomCachedNetworkImage(
          imageUrl: imageUrl,
          borderRadius: AppUtils.kBorderRadius50,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
          errorWidget: SvgPicture.asset('assets/svg/ic_naznachenie.svg'),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          desc.removeHtmlTeg.trim(),
          // (appointment.comment ?? '').removeHtmlTeg.trim(),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: context.theme.colorScheme.onSurface,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: context.theme.colorScheme.onBackground,
        ),
      );
}
