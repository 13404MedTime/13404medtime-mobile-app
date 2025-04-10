import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../bloc/auth/register/register_bloc.dart';
import '../../../../bloc/main/main_bloc.dart';
import '../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../components/buttons/bottom_navigation_button.dart';
import '../../../../components/loading_widgets/modal_progress_hud.dart';
import 'widgets/bottom_sheets/blood_group_sheet.dart';
import 'widgets/bottom_sheets/choose_height_weight.dart';

part '../mixin/register_second_stage_mixin.dart';

class RegisterSecondStagePage extends StatefulWidget {
  const RegisterSecondStagePage({
    super.key,
    required this.pageController,
    required this.phoneNumber,
  });

  final PageController pageController;
  final String phoneNumber;

  @override
  State<RegisterSecondStagePage> createState() => _RegisterSecondStagePageState();
}

class _RegisterSecondStagePageState extends State<RegisterSecondStagePage> with RegisterSecondStageMixin {
  double currentHeight = 150;
  double currentWeight = 50;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          await widget.pageController.previousPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
          return false;
        },
        child: Scaffold(
          body: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (_, state) {
              if (state.registerStatus.isSuccess) {
                localSource.setHasProfile(true);
                context.read<MainBloc>().add(const MainEventChanged(BottomMenu.search));
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.main,
                  (route) => false,
                );
              }
            },
            builder: (context, state) => ModalProgressHUD(
              inAsyncCall: state.registerStatus.isLoading,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: AppUtils.kPaddingAll16,
                    sliver: SliverList.list(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.color.disabledCard,
                            borderRadius: AppUtils.kBorderRadius8,
                          ),
                          child: Padding(
                            padding: AppUtils.kPaddingAll8,
                            child: Column(
                              children: [
                                Text(
                                  context.translate('height'),
                                ),
                                AppUtils.kGap4,
                                Text(
                                  state.height,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Slider(
                                  min: 80,
                                  max: 220,
                                  divisions: 140,
                                  value: currentHeight,
                                  onChanged: (value) {
                                    currentHeight = value;
                                    context.read<RegisterBloc>().add(
                                          UserHeightChangeEvent(
                                            userHeight: '${value.formatNum} cm',
                                          ),
                                        );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppUtils.kBoxHeight8,
                        Row(
                          children: [
                            Expanded(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: context.color.disabledCard,
                                  borderRadius: AppUtils.kBorderRadius8,
                                ),
                                child: Padding(
                                  padding: AppUtils.kPaddingAll8,
                                  child: Column(
                                    children: [
                                      Text(
                                        context.translate('weight'),
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final result = await customModalBottomSheet<Object?>(
                                            context: context,
                                            builder: (_, controller) => ChoseHeightOrWeightBottomSheet(
                                              sheetName: context.translate('weight'),
                                              isHeight: false,
                                            ),
                                          );
                                          if (result != null && result is String && context.mounted) {
                                            currentWeight = double.parse(result);
                                            context.read<RegisterBloc>().add(
                                                  UserWeightChangeEvent(
                                                    userWeight:
                                                        '${(num.tryParse(currentWeight.toString()) ?? 0).formatNum} кг',
                                                  ),
                                                );
                                          }
                                        },
                                        child: Text(
                                          state.weight,
                                          style: const TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            style: IconButton.styleFrom(
                                              backgroundColor: context.colorScheme.primary,
                                            ),
                                            onPressed: () {
                                              currentWeight -= 0.5;
                                              context.read<RegisterBloc>().add(
                                                    UserWeightChangeEvent(
                                                      userWeight:
                                                          '${(num.tryParse(currentWeight.toString()) ?? 0).formatNum} кг',
                                                    ),
                                                  );
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              size: 30,
                                              color: context.colorScheme.onPrimary,
                                            ),
                                          ),
                                          AppUtils.kGap20,
                                          IconButton(
                                            style: IconButton.styleFrom(
                                              backgroundColor: context.colorScheme.primary,
                                            ),
                                            onPressed: () {
                                              currentWeight += 0.5;
                                              context.read<RegisterBloc>().add(
                                                    UserWeightChangeEvent(
                                                      userWeight:
                                                          '${(num.tryParse(currentWeight.toString()) ?? 0).formatNum} кг',
                                                    ),
                                                  );
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 30,
                                              color: context.colorScheme.onPrimary,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            AppUtils.kBoxWidth8,
                            Expanded(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: context.color.disabledCard,
                                  borderRadius: AppUtils.kBorderRadius8,
                                ),
                                child: Padding(
                                  padding: AppUtils.kPaddingAll8,
                                  child: Column(
                                    children: [
                                      Text(
                                        context.translate('blood_type'),
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        state.bloodType,
                                        style: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      IconButton(
                                        style: IconButton.styleFrom(
                                          backgroundColor: context.colorScheme.primary,
                                        ),
                                        onPressed: () async {
                                          // ignore: inference_failure_on_function_invocation
                                          final result = await customModalBottomSheet<Object?>(
                                            height: 350,
                                            context: context,
                                            builder: (_, controller) => ChoseBloodGroupBottomSheet(),
                                          );
                                          if (result != null && result is String) {
                                            // ignore: use_build_context_synchronously
                                            context.read<RegisterBloc>().add(
                                                  BloodTypeChangeEvent(
                                                    bloodType: result,
                                                  ),
                                                );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 30,
                                          color: context.colorScheme.onPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationButton(
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) => ElevatedButton(
                onPressed: state.height.isNotEmpty && state.weight.isNotEmpty
                    ? () => context.read<RegisterBloc>().add(const UserRegisterEvent())
                    : () {
                        _bloc
                          ..add(UserWeightChangeEvent(userWeight: _bloc.state.weight))
                          ..add(UserHeightChangeEvent(userHeight: _bloc.state.height));
                        // ..add(BloodTypeChangeEvent(
                        //     bloodType: _bloc.state.bloodType));
                      },
                child: Text(context.translate('continue')),
              ),
            ),
          ),
        ),
      );
}
