import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/utils/base_functions.dart';
import '../../../bloc/main/home/home_bloc.dart';
import '../../../bloc/main/main_bloc.dart';
import '../../../bloc/main/profile/profile_bloc.dart';
import '../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../components/loading_widgets/modal_progress_hud.dart';
import 'disease_history/args/disease_history_args.dart';
import 'widgets/change_language_bottom_sheet.dart';
import 'widgets/custom_dialog.dart';
import 'widgets/profile_doctor_item.dart';
import 'widgets/settings_item.dart';

part 'package:madadio_client_mobile/src/presentation/pages/main/profile/mixin/profile_mixin.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfileMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(context.translate('profile')),
          actions: [
            IconButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(context.color.primary10),
                shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: AppUtils.kBorderRadius16,
                  ),
                ),
              ),
              onPressed: () async {
                final result = await Navigator.pushNamed(context, Routes.editProfile);
                if (result != null && result == false) {
                  // ignore: use_build_context_synchronously
                  context.read<ProfileBloc>().add(
                        const isVisibleItemEvent(isVisibleItem: false),
                      );
                } else if (result != null && result == true) {
                  // ignore: use_build_context_synchronously
                  context.read<ProfileBloc>().add(
                        const isVisibleItemEvent(isVisibleItem: true),
                      );
                }
              },
              icon: Icon(
                Icons.edit,
                color: context.theme.colorScheme.primary,
              ),
            ),
            AppUtils.kBoxWidth12,
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(42),
            child: Padding(
              padding: AppUtils.kPaddingAll16,
              child: ValueListenableBuilder(
                valueListenable: localSource.prefes.listenable(
                  keys: [
                    AppKeys.firstName,
                    AppKeys.lastName,
                    AppKeys.dateOfBirth,
                    AppKeys.address,
                    AppKeys.bloodGroup,
                    AppKeys.passportNumber,
                  ],
                ),
                builder: (context, value, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${localSource.firstName} ' '${localSource.lastName}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          toolbarHeight: 80,
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) => ModalProgressHUD(
            inAsyncCall: state.isLoading,
            child: Padding(
              padding: AppUtils.kPaddingHorizontal16,
              child: CustomScrollView(
                slivers: [
                  const SliverGap(16),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 225,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProfileDoctorItem(
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.upcomingVisits,
                              ),
                              title: context.translate('visits'),
                              buttonTitle: '${state.upcomingVisits} ${context.translate('visits').toLowerCase()}',
                            ),
                          ),
                          const Gap(16),
                          Expanded(
                            child: ValueListenableBuilder(
                              valueListenable: localSource.prefes.listenable(
                                keys: [AppKeys.favouriteDoctors],
                              ),
                              builder: (context, value, child) {
                                final doctorCount = (value.get(AppKeys.favouriteDoctors) ?? <dynamic>[]).length;
                                return ProfileDoctorItem(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.selectedDoctors,
                                      );
                                    },
                                    title: context.translate('selected_doctors'),
                                    buttonTitle:
                                        '$doctorCount ${int.parse(doctorCount.toString()).numberToWordRussian(context.translate('doctor_s').toLowerCase(), context.translate('doctor_g').toLowerCase(), context.translate('doctor_m').toLowerCase())}');
                              },
                            ),
                          ),
                          const Gap(16),
                          Expanded(
                            child: ProfileDoctorItem(
                              onTap: () async {
                                await sendAnalyticsEvent(
                                  tag: FirebaseAnalyticsEvents.onProfileMedicalHistoryBtn,
                                  parameters: {'user_name': localSource.firstName},
                                ).then(
                                  (value) {
                                    final state = context.read<HomeBloc>().state;
                                    Navigator.pushNamed(
                                      context,
                                      Routes.diseaseHistory,
                                      arguments: DiseaseHistoryArgs(
                                        diseaseItemsList: state.medicalHistory,
                                        medicalHistoryDrugNames: state.medicalHistoryDrugNames,
                                        medicalHistoryDrugs: state.medicalHistoryDrugs,
                                        medicationTimes: state.medicationTimes,
                                      ),
                                    );
                                  },
                                );
                              },
                              title: context.translate('medical_history'),
                              buttonTitle:
                                  '${context.watch<HomeBloc>().state.medicalHistory.length} ${context.watch<HomeBloc>().state.medicalHistory.length.numberToWordRussian(context.translate('appointments_s').toLowerCase(), context.translate('appointments_g').toLowerCase(), context.translate('appointments_m').toLowerCase())}',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverGap(16),
                  SliverToBoxAdapter(
                    child: Material(
                      borderRadius: AppUtils.kBorderRadius8,
                      color: Colors.white,
                      child: Padding(
                        padding: AppUtils.kPaddingAll16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              context.translate('settings'),
                              style: context.theme.textTheme.bodyLarge,
                            ),
                            AppUtils.kBoxHeight16,
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                SettingsItem(
                                  icon: Icons.notifications,
                                  title: context.translate('alerts'),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.notifications,
                                      arguments: context.read<HomeBloc>(),
                                    );
                                  },
                                ),
                                SettingsItem(
                                  icon: Icons.language,
                                  title: context.translate('language'),
                                  onTap: () {
                                    customModalBottomSheet<void>(
                                      context: context,
                                      builder: (_, controller) => const ChangeLanguageBottomSheet(),
                                    );
                                  },
                                ),
                                // SettingsItem(
                                //   icon: Icons.call,
                                //   title: context.translate('contact_us'),
                                //   onTap: () async {
                                //     await sendAnalyticsEvent(
                                //         tag: FirebaseAnalyticsEvents
                                //             .contactUsBtn,
                                //         parameters: {
                                //           'user_name': localSource.firstName
                                //         }).then(
                                //       (value) {
                                //         Navigator.push(
                                //           context,
                                //           MaterialPageRoute<AboutUsPage>(
                                //             builder: (_) => const AboutUsPage(),
                                //           ),
                                //         );
                                //       },
                                //     );
                                //   },
                                // ),
                                // SettingsItem(
                                //   icon: Icons.article_outlined,
                                //   title: context.translate('about_the_app'),
                                //   onTap: () {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute<AboutUsPage>(
                                //         builder: (_) => const AboutAppPage(),
                                //       ),
                                //     );
                                //   },
                                // ),
                              ],
                            ),
                            AppUtils.kBoxHeight12,
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(context.colorScheme.error),
                                foregroundColor: MaterialStatePropertyAll(context.theme.colorScheme.error),
                                overlayColor: MaterialStatePropertyAll(context.colorScheme.error),
                                surfaceTintColor: MaterialStatePropertyAll(context.colorScheme.error),
                              ),
                              onPressed: () {
                                showDialog<bool>(
                                  context: context,
                                  builder: (_) => CustomDialog(
                                    changeColor: true,
                                    cancelActionText: context.translate('no'),
                                    defaultActionText: context.translate('yes'),
                                    desc: context.translate('logout_desc'),
                                    title: context.translate('out'),
                                  ),
                                ).then(
                                  (value) async {
                                    if (value != null) {
                                      if (value) {
                                        context.read<HomeBloc>().add(const LogoutAccountEvent());
                                        localSource.setHasProfile(false);
                                        final locale = localSource.locale;
                                        // await localSource.clearProfile();
                                        // await localSource
                                        //     .deleteTelegramUserName();
                                        await localSource.clear();
                                        await localSource.setLocale(locale);
                                        cancelAllNotifications();
                                        await sendAnalyticsEvent(
                                            tag: FirebaseAnalyticsEvents.logOutBtn,
                                            parameters: {'user_name': localSource.firstName});
                                        if (context.mounted) {
                                          context.read<MainBloc>().add(
                                                const MainEventChanged(BottomMenu.search),
                                              );
                                          unawaited(Navigator.pushNamedAndRemoveUntil(
                                              context, Routes.auth, (route) => false));
                                        }
                                      }
                                    }
                                  },
                                );
                              },
                              child: Text(
                                context.translate('logout_account'),
                                style: TextStyle(
                                  color: context.colorScheme.onError,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SliverGap(16),
                ],
              ),
            ),
          ),
        ),
      );
}
