import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';

Future<T?> customCupertinoModalPopup<T>(
  BuildContext context, {
  String title = '',
  String actionTitleOne = '',
  String actionTitleTwo = '',
  required void Function() actionOne,
  required void Function() actionTwo,
}) async =>
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: Text(title),
        actions: [
          CupertinoActionSheetAction(
            onPressed: actionOne,
            child: Text(actionTitleOne),
          ),
          CupertinoActionSheetAction(
            onPressed: actionTwo,
            child: Text(actionTitleTwo),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );

typedef WidgetScrollBuilder = Widget Function(
  BuildContext context,
  ScrollController? controller,
);

// Future<T?> customBottomSheet<T>(
//   BuildContext context, {
//   bool? isShowBackButton,
//   required WidgetBuilder builder,
//   bool? isDismissible,
//   bool? enableDrag,
// }) {
//   return showModalBottomSheet(
//     isDismissible: isDismissible ?? true,
//     isScrollControlled: true,
//     enableDrag: enableDrag ?? true,
//     context: context,
//     constraints: BoxConstraints(
//       maxHeight: context.mediaQuery.size.height * 0.9,
//     ),
//     builder: (context) {
//       return Material(
//         color: Colors.white,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Visibility(
//               visible: isShowBackButton ?? true,
//               child: Positioned(
//                 top: -75,
//                 left: -6,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 8,
//                   ),
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 24,
//                     child: IconButton(
//                       splashColor: Colors.transparent,
//                       highlightColor: Colors.transparent,
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.arrow_back),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Center(
//                   child: Container(
//                     width: 40,
//                     height: 4,
//                     margin: const EdgeInsets.only(top: 8, bottom: 8),
//                     decoration: BoxDecoration(
//                       color: ThemeColors.light.secondary10,
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   child: builder(context),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
//
// Future<T?> customModalBottomShee<T>({
//   required BuildContext context,
//   required WidgetScrollBuilder builder,
//   bool isScrollControlled = false,
// }) async {
//   return showModalBottomSheet(
//     context: context,
//     elevation: 0,
//     isScrollControlled: true,
//     constraints: BoxConstraints(
//       maxHeight: context.mediaQuery.size.height * 0.9,
//       minHeight: context.mediaQuery.size.height * 0.2,
//     ),
//     builder: (_) {
//       if (isScrollControlled) {
//         return DraggableScrollableSheet(
//           initialChildSize: 1,
//           minChildSize: 0.5,
//           expand: false,
//           snap: true,
//           builder: (context, controller) {
//             return builder(context, controller);
//           },
//         );
//       } else {
//         return builder(context, null);
//       }
//     },
//   );
// }

Future<T?> customModalBottomSheet<T>({
  required BuildContext context,
  required WidgetScrollBuilder builder,
  double? height,
  bool isDismissible = true,
}) async =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      clipBehavior: Clip.antiAlias,
      isDismissible: isDismissible,
      constraints: height != null
          ? BoxConstraints(
              minHeight: height,
            )
          : null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(bottom: context.mediaQuery.viewInsets.bottom),
        child: SizedBox(
          height: height,
          child: builder(context, ScrollController()),
        ),
      ),
    );
