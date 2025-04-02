import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../bloc/main/profile/profile_bloc.dart';
import '../../../../bloc/main/profile/profile_edit/profile_edit_bloc.dart';
import '../../../../components/buttons/bottom_navigation_button.dart';
import '../../../../components/custom_texfield/custom_text_field.dart';
import '../../../../components/loading_widgets/modal_progress_hud.dart';
import '../../../auth/register/widgets/group_blood_widget.dart';
import '../widgets/custom_dialog.dart';

part 'mixin/edit_profile_mixin.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> with EditProfileMixin {
  @override
  Widget build(BuildContext context) => BlocConsumer<ProfileEditBloc, ProfileEditState>(
        listener: (context, state) {
          if (state.isProfileDeleted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.auth,
              (route) => false,
            );
          } else if (state.isProfileUpdated) {
            Navigator.pop(
              context,
              _telegramNicNameController.text.isEmpty ? true : false,
            );
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(
              context.translate('edit'),
              style: context.theme.appBarTheme.titleTextStyle,
              textAlign: TextAlign.start,
            ),
          ),
          body: ModalProgressHUD(
            inAsyncCall: state.status == ProfileEditStatus.loading,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: AppUtils.kPaddingAll16,
                  sliver: SliverList.list(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              showError: state.showNameError,
                              errorText: context.translate('enter_at_least_character'),
                              fillColor: context.color.disabledCard,
                              filled: true,
                              onChanged: (value) {
                                _bloc.add(const ProfileEditEvent.onFirstNameChanged());
                              },
                              controller: _firstNameController,
                              hintText: context.translate('first_name'),
                            ),
                          ),
                          AppUtils.kGap8,
                          Expanded(
                            child: CustomTextField(
                              showError: state.showSurnameError,
                              errorText: context.translate('enter_at_least_character'),
                              fillColor: context.color.disabledCard,
                              filled: true,
                              onChanged: (value) {
                                _bloc.add(const ProfileEditEvent.onLastNameChanged());
                              },
                              controller: _lastNameController,
                              hintText: context.translate('last_name'),
                            ),
                          ),
                        ],
                      ),
                      AppUtils.kGap12,
                      CustomTextField(
                        maxLength: 50,
                        showError: state.showAddressError,
                        errorText: context.translate('enter_address'),
                        fillColor: context.color.disabledCard,
                        filled: true,
                        onChanged: (value) {
                          _bloc.add(const ProfileEditEvent.onAddressChanged());
                        },
                        controller: _addressController,
                        hintText: context.translate('address'),
                      ),
                      AppUtils.kGap12,
                      CustomTextField(
                        fillColor: context.color.disabledCard,
                        showError: state.isValidPassportNumber,
                        errorText: 'Введите действительный номер паспорта',
                        filled: true,
                        onChanged: (value) {
                          _bloc.add(
                            PassportNumberChangeEvent(
                              passportNumber: value ?? state.passportNumber,
                            ),
                          );
                        },
                        controller: _passportNumberController,
                        hintText: 'AB 1221123',
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
                      ),
                      AppUtils.kGap12,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: selectedBloodGroup,
                            builder: (context, data, child) => BloodGroupSelectionWidget(
                              showError: state.showBloodGroupError,
                              onChanged: (value) {
                                if (value != null) {
                                  selectedBloodGroup.value = value;
                                  _bloc.add(const ProfileEditEvent.onBloodGroupChanged());
                                }
                              },
                              selectedBloodGroup: bloodGroups.contains(data) ? selectedBloodGroup.value : null,
                            ),
                          ),
                          AppUtils.kBoxWidth8,
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                // ignore: inference_failure_on_function_invocation
                                final DateTime? result = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(3000),
                                  builder: (context, child) => DatePickerDialog(
                                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(3000),
                                    currentDate: initialDateTime,
                                  ),
                                );
                                if (result != null) {
                                  initialDateTime = result;
                                  _dateController.text = initialDateTime.formatDateTime.date();
                                  dateTime = initialDateTime.formatDateTime.toApiDateTime;
                                }
                              },
                              child: CustomTextField(
                                onTap: () {},
                                controller: _dateController,
                                enabled: false,
                                fillColor: context.color.disabledCard,
                                filled: true,
                                hintText: context.translate('birth_date'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppUtils.kGap12,
                      CustomTextField(
                        fillColor: context.color.disabledCard,
                        filled: true,
                        controller: _telegramNicNameController,
                        onChanged: (value) {},
                        focusNode: _telegramNicNameFocusNode,
                        inputFormatters: [
                          TextInputFormatter.withFunction(
                            (oldValue, newValue) =>
                                !newValue.text.contains(' ') && newValue.text.length <= 32 ? newValue : oldValue,
                          ),
                          // TextInputFormatter.withFunction(
                          //   (oldValue, newValue) => RegExp(r'^(?!.*\d_)(?!.*_$)[a-zA-Z0-9_]{5,32}$').hasMatch(newValue.text)
                          //       ? newValue
                          //       : oldValue,
                          // ),
                        ],
                        prefixIcon: const Icon(Icons.telegram, size: 36),
                        hintText: '@${context.translate('user_name')}',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: context.theme.hintColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Material(
            child: BottomNavigationButton(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog<bool>(
                        context: context,
                        builder: (_) => CustomDialog(
                          changeColor: true,
                          cancelActionText: context.translate('no'),
                          defaultActionText: context.translate('yes'),
                          title: context.translate('delete_account_title'),
                          desc: context.translate('delete_account_desc'),
                        ),
                      ).then(
                        (value) {
                          if (value != null) {
                            if (value) {
                              _deleteProfile();
                            }
                          }
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.color.error10,
                    ),
                    child: Text(
                      context.translate('delete_account'),
                      style: context.textStyle.buttonStyle.copyWith(
                        color: context.theme.colorScheme.error,
                      ),
                    ),
                  ),
                  AppUtils.kBoxHeight16,
                  ElevatedButton(
                    onPressed: () {
                      if (state.status != ProfileEditStatus.loading) {
                        context.read<ProfileBloc>().add(
                              isVisibleItemEvent(
                                isVisibleItem: _telegramNicNameController.text.trim().isEmpty ? true : false,
                              ),
                            );
                        _updateProfile();
                      }
                    },
                    child: Text(context.translate('save')),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
