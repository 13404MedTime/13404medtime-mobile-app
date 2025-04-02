import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extension.dart';
import '../../../bloc/auth/register/register_bloc.dart';
import 'sub_pages/register_first_stage.dart';
import 'sub_pages/register_second_stage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    this.phone = '',
  });

  final String phone;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<RegisterBloc>().add(
          PhoneNumberChangeEvent(phoneNumber: widget.phone),
        );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: colorLightScheme.background,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => context.read<RegisterBloc>().state.registerStatus.isLoading ||
                    context.read<RegisterBloc>().state.registerStatus.isSuccess
                ? {}
                : pageController.page == 1
                    ? pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                      )
                    : Navigator.maybePop(context),
          ),
          title: Text(context.translate('create_an_account')),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            context.read<RegisterBloc>().add(
                  PageChangeEvent(pageIndex: index),
                );
          },
          children: [
            BlocProvider.value(
              value: BlocProvider.of<RegisterBloc>(context),
              child: RegisterFirstStagePage(
                pageController: pageController,
              ),
            ),
            BlocProvider.value(
              value: BlocProvider.of<RegisterBloc>(context),
              child: RegisterSecondStagePage(
                pageController: pageController,
                phoneNumber: widget.phone,
              ),
            ),
          ],
        ),
      );
}
