import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/extension/extension.dart';
import '../../../bloc/doctor/login/login_bloc.dart';
import '../../../components/custom_texfield/custom_text_field.dart';

part 'mixin/login_page_mixin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: colorLightScheme.background,
        appBar: AppBar(
          backgroundColor: context.theme.colorScheme.background,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: BlocBuilder<LoginBloc, LoginState>(
              bloc: context.read<LoginBloc>(),
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Image(
                    image: AssetImage(Assets.logoLogoFront),
                    height: 300,
                  ),
                  CustomTextField(
                    prefixIcon: Icon(
                      Icons.person,
                      color: context.theme.hintColor.withOpacity(0.5),
                    ),
                    controller: _usernameController,
                    filled: true,
                    fillColor: context.color.disabledCard,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: context.theme.hintColor.withOpacity(0.5),
                    ),
                    onChanged: (p0) => context.read<LoginBloc>().add(
                          UsernameChanged$LoginEvent(username: p0 ?? ''),
                        ),
                    errorText:
                        !state.emptyUsername ? context.translate('error_login') : context.translate('obligatory_field'),
                    hintText: context.translate('username'),
                    showError: state.errorUsername || state.emptyUsername,
                  ),
                  AppUtils.kBoxHeight24,
                  CustomTextField(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: context.theme.hintColor.withOpacity(0.5),
                    ),
                    controller: _passwordController,
                    obscureText: state.obscureText,
                    filled: true,
                    fillColor: context.color.disabledCard,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: context.theme.hintColor.withOpacity(0.5),
                    ),
                    errorText:
                        !state.emptyPassword ? context.translate('error_login') : context.translate('obligatory_field'),
                    hintText: context.translate('password'),
                    onChanged: (p0) => context.read<LoginBloc>().add(
                          PasswordChanged$LoginEvent(password: p0 ?? ''),
                        ),
                    showError: state.errorPassword || state.emptyPassword,
                    suffixIcon: Padding(
                      padding: AppUtils.kPaddingHor8Ver4,
                      child: IconButton(
                        style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                        onPressed: () => context.read<LoginBloc>().add(
                              const ObscureTextChanged$LoginEvent(),
                            ),
                        icon: Icon(
                          state.obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  AppUtils.kBoxHeight24,
                  ElevatedButton(
                    onPressed: () {
                      if (!state.isLoading) {
                        context.read<LoginBloc>().add(
                              LoginButtonPressed$LoginEvent(context),
                            );
                      }
                    },
                    child: state.isLoading
                        ? CircularProgressIndicator(
                            color: context.colorScheme.onPrimary,
                          )
                        : Text(context.translate('login')),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
