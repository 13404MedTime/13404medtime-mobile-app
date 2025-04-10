import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../bloc/auth/register/register_bloc.dart';
import '../../../../components/buttons/bottom_navigation_button.dart';
import '../../../../components/custom_texfield/custom_text_field.dart';

part '../mixin/register_first_stage_mixin.dart';

class RegisterFirstStagePage extends StatefulWidget {
  const RegisterFirstStagePage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<RegisterFirstStagePage> createState() => _RegisterFirstStagePageState();
}

class _RegisterFirstStagePageState extends State<RegisterFirstStagePage> with RegisterFirstStageMixin {
  @override
  Widget build(BuildContext context) => BlocBuilder<RegisterBloc, RegisterState>(
        bloc: context.read<RegisterBloc>(),
        builder: (_, state) => Scaffold(
          backgroundColor: colorLightScheme.background,
          body: SingleChildScrollView(
            child: Padding(
              padding: AppUtils.kPaddingAll16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppUtils.kBoxHeight4,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _firstNameController,
                          fillColor: context.color.disabledCard,
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: context.theme.hintColor.withOpacity(0.5),
                          ),
                          errorText: context.translate('obligatory_field'),
                          showError: state.errorName,
                          filled: true,
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(
                                  NameChangeEvent(nameChanged: value ?? ''),
                                );
                          },
                          hintText: context.translate('first_name'),
                        ),
                      ),
                      AppUtils.kBoxWidth14,
                      Expanded(
                        child: CustomTextField(
                          controller: _lastNameController,
                          fillColor: context.color.disabledCard,
                          errorText: context.translate('obligatory_field'),
                          showError: state.errorSurname,
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: context.theme.hintColor.withOpacity(0.5),
                          ),
                          filled: true,
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(
                                  SurnameChangeEvent(surnameChanged: value ?? ''),
                                );
                          },
                          hintText: context.translate('last_name'),
                        ),
                      ),
                    ],
                  ),
                  AppUtils.kBoxHeight14,
                  CustomTextField(
                    maxLength: 50,
                    controller: _addressController,
                    errorText: context.translate('obligatory_field'),
                    showError: state.errorAddress,
                    fillColor: context.color.disabledCard,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: context.theme.hintColor.withOpacity(0.5),
                    ),
                    filled: true,
                    onChanged: (value) {
                      context.read<RegisterBloc>().add(
                            UserAddressChangeEvent(userAddress: value ?? ''),
                          );
                    },
                    hintText: context.translate('home_address'),
                  ),
                  AppUtils.kBoxHeight14,
                  GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      final DateTime? date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(3000),
                        builder: (context, child) => DatePickerDialog(
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(3000),
                        ),
                      );
                      if (date != null && date.isBefore(DateTime.now())) {
                        initialDateTime = date;
                        _dateController.text = DateFormat('dd.MM.yyyy').format(
                          date,
                        );
                        if (mounted) {
                          context.read<RegisterBloc>().add(
                                DateOfBirthChangeEvent(
                                  dateOfBirth: _dateController.text.trim(),
                                ),
                              );
                        }
                      } else {
                        initialDateTime = DateTime.now();
                        _dateController.text = DateFormat('dd.MM.yyyy').format(
                          DateTime.now(),
                        );
                        if (mounted) {
                          context.read<RegisterBloc>().add(
                                DateOfBirthChangeEvent(
                                  dateOfBirth: _dateController.text.trim(),
                                ),
                              );
                        }
                      }
                    },
                    child: CustomTextField(
                      controller: _dateController,
                      enabled: false,
                      errorText: context.translate('obligatory_field'),
                      showError: state.errorDate,
                      enabledShowError: state.errorDate,
                      fillColor: context.color.disabledCard,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: context.theme.hintColor.withOpacity(0.5),
                      ),
                      filled: true,
                      hintText: context.translate('birth_date'),
                    ),
                  ),
                  AppUtils.kBoxHeight14,
                  CustomTextField(
                    maxLength: 50,
                    controller: _passportController,
                    errorText: 'Введите действительный номер паспорта',
                    hintText: context.translate('passport_serial_number'),
                    filled: true,
                    fillColor: context.color.disabledCard,
                    inputFormatters: [
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (newValue.text.isEmpty) return newValue;
                        if (newValue.text.length > oldValue.text.length) {
                          if (RegExp(r'^[a-zA-Z]{1,2}$').hasMatch(newValue.text)) {
                            if (newValue.text.length == 2) {
                              return TextEditingValue(
                                text: '${newValue.text.toUpperCase()} ',
                                selection: TextSelection.collapsed(offset: newValue.text.length + 1),
                              );
                            } else {
                              return newValue.copyWith(text: newValue.text.toUpperCase());
                            }
                          } else if (RegExp(r'^[a-zA-Z]{2}\s[0-9]{1,7}$').hasMatch(newValue.text)) {
                            return newValue.copyWith(text: newValue.text.toUpperCase());
                          } else if (RegExp(r'^[a-zA-Z]{2}\s?[0-9]{1,7}$').hasMatch(newValue.text)) {
                            return TextEditingValue(
                              text: newValue.text.replaceRange(2, 2, ' ').toUpperCase(),
                              selection: TextSelection.collapsed(offset: newValue.text.length + 1),
                            );
                          } else {
                            return oldValue;
                          }
                        } else {
                          if (RegExp(r'^[A-Z]{2}\s[0-9]{0,7}$').hasMatch(newValue.text)) {
                            if (RegExp(r'^[A-Z]{2}\s$').hasMatch(newValue.text)) {
                              return TextEditingValue(
                                text: newValue.text.substring(0, 2),
                                selection: const TextSelection.collapsed(offset: 2),
                              );
                            } else {
                              return newValue;
                            }
                          } else if (RegExp(r'^[A-Z]{0,2}$').hasMatch(newValue.text)) {
                            return newValue;
                          } else {
                            return oldValue;
                          }
                        }
                      }),
                      // PassportTextInputFormatter(
                      //   mask: '## #######',
                      //   separator: ' ',
                      // ),
                    ],
                    showError: !state.isValidPassportNumber,
                    onChanged: (value) {
                      context.read<RegisterBloc>().add(
                            PassportNumberChangeEvent(
                              passportNumber: value ?? state.passportNumber,
                            ),
                          );
                    },
                    style: context.theme.textTheme.titleMedium!.copyWith(
                      fontSize: 14,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: context.theme.hintColor.withOpacity(0.5),
                    ),
                  ),
                  AppUtils.kBoxHeight14,
                  CustomTextField(
                    maxLength: 50,
                    controller: _tgUsernameController,
                    fillColor: context.color.disabledCard,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: context.theme.hintColor.withOpacity(0.5),
                    ),
                    filled: true,
                    inputFormatters: [
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) =>
                            !newValue.text.contains(' ') && newValue.text.length <= 32 ? newValue : oldValue,
                      ),
                    ],
                    onChanged: (value) {
                      context.read<RegisterBloc>().add(
                            TgUsernameChangeEvent(changedTgUsername: value ?? ''),
                          );
                    },
                    hintText: context.translate('telegram_username'),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationButton(
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) => ElevatedButton(
                onPressed: state.name.isNotEmpty &&
                        state.dateOfBirth.isNotEmpty &&
                        state.surname.isNotEmpty &&
                        state.userAddress.isNotEmpty &&
                        (RegExp(r'^[A-Z]{2} \d{7}$').hasMatch(state.passportNumber) || state.passportNumber.isEmpty)
                    ? () {
                        widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear,
                        );
                      }
                    : () {
                        context.read<RegisterBloc>()
                          ..add(
                            NameChangeEvent(
                              nameChanged: _firstNameController.text.trim(),
                            ),
                          )
                          ..add(
                            SurnameChangeEvent(
                              surnameChanged: _lastNameController.text.trim(),
                            ),
                          )
                          ..add(
                            DateOfBirthChangeEvent(
                              dateOfBirth: _dateController.text.trim(),
                            ),
                          )
                          ..add(
                            UserAddressChangeEvent(
                              userAddress: _addressController.text.trim(),
                            ),
                          );
                        if (!(RegExp(r'^[A-Z]{2} \d{7}$').hasMatch(state.passportNumber) ||
                            state.passportNumber.isEmpty)) {
                          context.read<RegisterBloc>().add(
                                const PassportNumberStatusEvent(isValidPassportNumber: false),
                              );
                        }
                      },
                child: Text(
                  context.translate('continue'),
                ),
              ),
            ),
          ),
        ),
      );
}
