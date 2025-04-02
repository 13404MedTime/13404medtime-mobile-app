import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../bloc/main/main_bloc.dart';
import '../../../../bloc/main/treatments/treatments_bloc.dart';
import '../../../../components/bottom_sheet/bottom_sheet_app_bar.dart';

class AddTypeBottomSheet extends StatelessWidget {
  const AddTypeBottomSheet({
    super.key,
    required this.bloc,
  });

  final TreatmentsBloc bloc;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: AppUtils.kPaddingVertical24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BottomSheetAppBar(
                title: context.translate('add'),
              ),
            ),
            AppUtils.kBoxHeight32,
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                await Navigator.pushNamed(context, Routes.addMedicine).then(
                  (value) {
                    if (value == true) {
                      bloc.add(const UpdateMedicineTakingEvent());
                    }
                  },
                );
              },
              leading: Icon(
                Icons.medication,
                size: 30,
                color: context.color.black,
              ),
              title: Text(
                context.translate('medicament_s'),
                style: context.textStyle.buttonStyle.copyWith(
                  color: context.color.black,
                  fontSize: 18,
                ),
              ),
            ),
            // AppUtils.kDivider,
            const Padding(
              padding: AppUtils.kPaddingHorizontal16,
              child: AppUtils.kDividerBlack07,
            ),
            ListTile(
              onTap: () {
                context.read<MainBloc>().add(const MainEventChanged(BottomMenu.orders));
                Navigator.maybePop(context);
              },
              leading: Icon(
                Icons.video_call_rounded,
                size: 30,
                color: context.color.black,
              ),
              title: Text(
                context.translate('contacting_doctor'),
                style: context.textStyle.buttonStyle.copyWith(
                  color: context.color.black,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );
}
