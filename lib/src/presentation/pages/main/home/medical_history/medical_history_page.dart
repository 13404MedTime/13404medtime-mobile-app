import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../components/buttons/card_button.dart';
import '../../../../components/custom_cached_network_image/custom_cached_network_image.dart';
import '../my_visit/purpose/widgets/purpose_item.dart';
import 'widgets/searching.dart';

part 'mixin/medical_history_mixin.dart';

class MedicalHistoryPage extends StatefulWidget {
  const MedicalHistoryPage({super.key});

  @override
  State<MedicalHistoryPage> createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> with MedicalHistoryMixin {
  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  @override
  Widget build(BuildContext context) => SearchingWidget(
        searchController: _searchController,
        searchFocusNode: _searchNode,
        title: context.translate('medical_history'),
        searchHintText: context.translate('search'),
        searchingBody: Padding(
          padding: AppUtils.kPaddingHorizontal16,
          child: CustomScrollView(
            slivers: [
              const SliverGap(16),
              for (int i = 0; i < list2.length.doubleTheListCount; i++)
                if (i.isOdd) ...[
                  const SliverGap(16),
                ] else ...[
                  SliverToBoxAdapter(
                    child: Text(
                      list2[i.exactIndex].title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SliverGap(8),
                  for (int y = 0; y < list2[i.exactIndex].list.length.doubleTheListCount; y++)
                    if (y.isOdd) ...[
                      const SliverGap(12),
                    ] else ...[
                      SliverToBoxAdapter(
                        child: ListTile(
                          onTap: () {},
                          contentPadding: AppUtils.kPaddingHorizontal16,
                          leading: CustomCachedNetworkImage(
                            imageUrl: list2[i.exactIndex].list[y.exactIndex].imageUrl,
                            borderRadius: AppUtils.kBorderRadius50,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            list2[i.exactIndex].list[y.exactIndex].name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            list2[i.exactIndex].list[y.exactIndex].description,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: context.theme.colorScheme.onSurface,
                            ),
                          ),
                          trailing: list2[i.exactIndex].list[y.exactIndex].isMember
                              ? CardButton(
                                  title: list2[i.exactIndex].list[y.exactIndex].experience,
                                )
                              : Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 20,
                                  color: context.theme.colorScheme.onBackground,
                                ),
                        ),
                      ),
                    ],
                ],
              const SliverGap(16),
            ],
          ),
        ),
        unSearchingBody: Padding(
          padding: AppUtils.kPaddingHorizontal16,
          child: CustomScrollView(
            slivers: [
              const SliverGap(16),
              for (int i = 0; i < list.length.doubleTheListCount; i++)
                if (i.isOdd) ...[
                  const SliverGap(16),
                ] else ...[
                  SliverToBoxAdapter(
                    child: PurposeItemWidget(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.subPurposePage,
                          arguments: context.translate('medical_history'),
                        );
                      },
                      title: list[i.exactIndex]['title'],
                      subtitle: list[i.exactIndex]['subtitle'],
                      items: list[i.exactIndex]['list'] as List<String>,
                      name: list[i.exactIndex]['name'],
                      imageUrl: list[i.exactIndex]['imageUrl'],
                    ),
                  ),
                ],
              const SliverGap(16),
            ],
          ),
        ),
      );
}
