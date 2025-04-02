import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/utils/base_functions.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/confirm/confirm_code_bloc.dart';
import '../../../components/buttons/bottom_navigation_button.dart';
import '../../../components/loading_widgets/modal_progress_hud.dart';
import '../../../components/snack/snack.dart';
import 'widgets/timer_widget.dart';

part 'mixin/confirm_code_mixin.dart';

class ConfirmCodePage extends StatefulWidget {
  const ConfirmCodePage({
    super.key,
    required this.state,
  });

  final AuthSuccessState state;

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage> with ConfirmCodeMixin {
  @override
  Widget build(BuildContext context) => BlocListener<ConfirmCodeBloc, ConfirmCodeState>(
        listener: (context, confirmState) async {
          if (confirmState.confirmCodeStatus == ConfirmCodeStatus.error) {
            Snack.showSnackBar(
              context,
              context.translate('try_again'),
              hasError: true,
            );
            controller.clear();
          }
          if (confirmState.confirmCodeStatus == ConfirmCodeStatus.confirimed) {
            if (confirmState.isUserFound) {
              if (confirmState.shouldUpdateFcmTokenAndPlatformType) {
                context.read<ConfirmCodeBloc>().add(const ConfirmCodeEvent.updateFcmTokenAndPlatformType());
              } else {
                localSource.setHasProfile(true);
                await sendAnalyticsEvent(
                    tag: FirebaseAnalyticsEvents.signInAccount,
                    parameters: {'user_name': localSource.firstName}).then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.main,
                    (route) => false,
                  );
                });

                return;
              }
            } else {
              await Navigator.pushReplacementNamed(
                context,
                Routes.register,
                arguments: widget.state.phone,
              );
            }
          }
        },
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight + 32),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.translate('enter_the_confirmation_code'),
                      textAlign: TextAlign.center,
                    ),
                    AppUtils.kBoxHeight8,
                    Text(
                      context.translate('four_digit_confirmation_code'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA4A4A4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
            builder: (_, confirmState) => ModalProgressHUD(
              inAsyncCall: confirmState.confirmCodeStatus == ConfirmCodeStatus.loading,
              child: Column(
                children: [
                  AppUtils.kBoxHeight16,
                  Center(
                    child: Pinput(
                      autofocus: true,
                      controller: controller,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      errorPinTheme: errorPinTheme,
                      onCompleted: (pin) {
                        if (pin.length == 4) {
                          context.read<ConfirmCodeBloc>().add(
                                ConfirmCodeCheckMessageEvent(
                                  smsId:
                                      confirmState.isReverseSendCode == true ? confirmState.smsId : widget.state.smsId,
                                  otp: pin,
                                  phone: widget.state.phone,
                                  data: confirmState.isReverseSendCode ? confirmState.data : widget.state.data,
                                ),
                              );
                        }
                      },
                      errorText: context.translate('incorrect_code'),
                      forceErrorState: confirmState.confirmCodeStatus == ConfirmCodeStatus.error,
                      // androidSmsAutofillMethod:
                      //     AndroidSmsAutofillMethod.smsUserConsentApi,
                      // listenForMultipleSmsOnAndroid: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'\d'),
                        ),
                      ],
                    ),
                  ),
                  AppUtils.kBoxHeight16,
                  TimerWidget(
                    onTap: () {
                      context.read<ConfirmCodeBloc>().add(
                            ConfirmCodeEvent.sendAgain(
                              widget.state.phone,
                            ),
                          );
                    },
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
            buildWhen: (previous, current) => previous.confirmCodeStatus != current.confirmCodeStatus,
            builder: (_, state) => BottomNavigationButton(
              child: ElevatedButton(
                onPressed: state is AuthPhoneState
                    ? () {
                        context.read<ConfirmCodeBloc>().add(
                              ConfirmCodeCheckMessageEvent(
                                smsId: state.isReverseSendCode == true ? state.smsId : widget.state.smsId,
                                otp: controller.text,
                                phone: widget.state.phone,
                                data: state.isReverseSendCode ? state.data : widget.state.data,
                              ),
                            );
                      }
                    : null,
                child: Text(context.translate('continue')),
              ),
            ),
          ),
        ),
      );
}
