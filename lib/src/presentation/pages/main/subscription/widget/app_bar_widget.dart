import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../components/custom_texfield/custom_text_field.dart';

class SearchingWidget extends StatefulWidget {
  const SearchingWidget({
    required this.searchController,
    required this.searchFocusNode,
    this.onChanged,
    this.searchHintText = '',
    this.title = '',
    this.titleWidget,
    this.appBarHeight = 112,
    this.child,
    this.searchingBody,
    this.unSearchingBody,
    this.onFieldTap,
    this.bottomNavigationBar,
    super.key,
  });

  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final ValueChanged<String?>? onChanged;
  final String title;
  final String searchHintText;
  final Widget? child;
  final Widget? searchingBody;
  final Widget? unSearchingBody;
  final double appBarHeight;
  final Widget? titleWidget;
  final VoidCallback? onFieldTap;
  final Widget? bottomNavigationBar;

  @override
  State<SearchingWidget> createState() => _SearchingWidgetState();
}

class _SearchingWidgetState extends State<SearchingWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, widget.appBarHeight),
            child: Padding(
              padding: AppUtils.kPaddingHorizontal16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.titleWidget ??
                      Text(
                        widget.title,
                        style: context.textStyle.appBarTitle,
                      ),
                  AppUtils.kBoxHeight20,
                  CustomTextField(
                    controller: widget.searchController,
                    focusNode: widget.searchFocusNode,
                    onTap: widget.onFieldTap,
                    haveBorder: false,
                    contentPadding: AppUtils.kPaddingAll12,
                    fillColor: context.theme.colorScheme.background,
                    filled: true,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(Icons.search),
                    ),
                    prefixIconConstraints: const BoxConstraints(minWidth: 40, maxWidth: 40),
                    hintText: widget.searchHintText,
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: context.theme.colorScheme.onSurface,
                    ),
                    onChanged: (text) {
                      setState(() {});
                      widget.onChanged?.call(text);
                    },
                  ),
                  AppUtils.kBoxHeight12,
                ],
              ),
            ),
          ),
        ),
        body: widget.child ?? (widget.searchController.text.isNotEmpty ? widget.searchingBody : widget.unSearchingBody),
        bottomNavigationBar: widget.bottomNavigationBar,
      );
}
