import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/extension/extension.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../components/buttons/bottom_navigation_button.dart';
import '../../components/custom_texfield/custom_text_field.dart';
import '../../components/custom_texfield/masked_text_input_formatter.dart';
import '../../components/loading_widgets/modal_progress_hud.dart';

part 'mixin/auth_mixin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with AuthMixin {
  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthSuccessState) {
            Navigator.pushNamed(
              context,
              Routes.confirmCode,
              arguments: state,
            );
            context.read<AuthBloc>().add(
                  AuthPhoneChangeEvent(phoneController.text),
                );
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF7F7F7),
          appBar: AppBar(
            backgroundColor: context.theme.colorScheme.onPrimary,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight + 5),
              child: Padding(
                padding: AppUtils.kPaddingHor16Ver12,
                child: Text(
                  context.translate('enter_your_phone_number_to_log_in_or_register'),
                  style: context.textStyle.appBarTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) => previous is AuthLaodingState != current is AuthLaodingState,
            builder: (_, state) => ModalProgressHUD(
              inAsyncCall: state is AuthLaodingState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppUtils.kGap20,
                  Padding(
                    padding: AppUtils.kPaddingHorizontal16,
                    child: CustomTextField(
                      controller: phoneController,
                      autofocus: true,
                      haveBorder: false,
                      fillColor: context.color.disabledCard,
                      filled: true,
                      onTap: () {},
                      inputFormatters: [
                        MaskedTextInputFormatter(
                          mask: '## ### ## ##',
                          separator: ' ',
                          filter: RegExp('[0-9]'),
                        ),
                      ],
                      onChanged: (value) {
                        context.read<AuthBloc>().add(
                              AuthPhoneChangeEvent(value ?? ''),
                            );
                      },
                      contentPadding: AppUtils.kPaddingHor14Ver16,
                      keyboardType: TextInputType.phone,
                      prefixIconConstraints: const BoxConstraints(),
                      hintText: '90 123 45 67',
                      hintStyle: const TextStyle(height: 1),
                      prefixIcon: Text('  +998  ', style: Theme.of(context).textTheme.titleMedium),
                      prefixStyle: Theme.of(context).textTheme.titleMedium,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  AppUtils.kGap12,
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (previous, current) => previous is AuthPhoneState != current is AuthPhoneState,
                    builder: (_, state) => BottomNavigationButton(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            maximumSize: const Size(double.infinity, 90)),
                        onPressed: state is AuthPhoneState
                            ? () {
                                context.read<AuthBloc>().add(
                                      AuthCheckMessageEvent(phoneController.text),
                                    );
                              }
                            : null,
                        child: Text(
                          context.translate('continue'),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(context, Routes.login),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(context.translate('are_doctor')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
