import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/mixin/cache_mixin.dart';
import '../../../../core/utils/base_functions.dart';
import '../../../../domain/repositories/register/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> with CacheMixin {
  RegisterBloc({required this.registerUserRepository}) : super(const RegisterState()) {
    on<PageChangeEvent>(_pageIndex);
    on<NameChangeEvent>(_nameChange);
    on<SurnameChangeEvent>(_surnameChange);
    on<TgUsernameChangeEvent>(_tgUsurnameChange);
    on<DateOfBirthChangeEvent>(_dateOfBirthChange);
    on<UserAddressChangeEvent>(_userAddressChange);
    on<PassportNumberChangeEvent>(_passportNumberChange);
    on<PassportNumberStatusEvent>(_passportNumberStatus);
    on<BloodTypeChangeEvent>(_bloodTypeChange);
    on<UserWeightChangeEvent>(_userWeightChange);
    on<UserHeightChangeEvent>(_userHeightChange);
    on<PhoneNumberChangeEvent>(_phoneNumberChange);
    on<UserRegisterEvent>(_userRegister);
  }

  final RegisterUserRepository registerUserRepository;

  void _pageIndex(PageChangeEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(pageIndex: event.pageIndex),
    );
  }

  void _nameChange(NameChangeEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        name: event.nameChanged,
        errorName: event.nameChanged.isEmpty,
      ),
    );
  }

  void _phoneNumberChange(PhoneNumberChangeEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        phoneNumber: event.phoneNumber,
      ),
    );
  }

  void _surnameChange(SurnameChangeEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        surname: event.surnameChanged,
        errorSurname: event.surnameChanged.isEmpty,
      ),
    );
  }

  void _tgUsurnameChange(TgUsernameChangeEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(tgUsername: event.changedTgUsername),
    );
  }

  void _dateOfBirthChange(DateOfBirthChangeEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        dateOfBirth: event.dateOfBirth,
        errorDate: event.dateOfBirth.isEmpty,
      ),
    );
  }

  void _userAddressChange(UserAddressChangeEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      userAddress: event.userAddress,
      errorAddress: event.userAddress.isEmpty,
    ));
  }

  void _bloodTypeChange(BloodTypeChangeEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        bloodType: event.bloodType,
        errorBloodType: event.bloodType.isEmpty,
      ),
    );
  }

  void _passportNumberChange(PassportNumberChangeEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        passportNumber: event.passportNumber,
        isValidPassportNumber: true,
      ),
    );
  }

  void _passportNumberStatus(PassportNumberStatusEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isValidPassportNumber: event.isValidPassportNumber));
  }

  void _userWeightChange(UserWeightChangeEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        weight: event.userWeight,
        errorWeight: event.userWeight.isEmpty,
      ),
    );
  }

  void _userHeightChange(UserHeightChangeEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        height: event.userHeight,
        errorHeight: event.userHeight.isEmpty,
      ),
    );
  }

  Future<void> _userRegister(
    UserRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    final isIOS = Platform.isIOS;
    emit(state.copyWith(registerStatus: RegisterStatus.loading));
    final result = await registerUserRepository.registerUser(
      request: {
        'data': {
          'client_name': state.name.trim(),
          'cleint_lastname': state.surname.trim(),
          if (state.bloodType.trim().isNotEmpty)
            'bloods_group': [state.bloodType.trim().substring(0, state.bloodType.trim().length - 1)],
          if (state.bloodType.trim().isNotEmpty) 'rh_factor': [state.bloodType.trim().split('').last],
          'adres': state.userAddress.trim(),
          if (state.passportNumber.trim().length == 10) 'pasport': state.passportNumber.trim(),
          'birth_date': state.dateOfBirth.ddmmyyyyToDateTime?.formatDateTime,
          'phone_number': state.phoneNumber.trim(),
          'phone': state.phoneNumber.trim(),
          if (state.tgUsername.isNotEmpty) 'telegram_nick': state.tgUsername.trim(),
          'fcm_token': fcmToken,
          'user_lang': localSource.locale,
          'platform': isIOS ? 0 : 1,
          'weight': state.weight.trim().substring(0, state.weight.length - 3),
          'height': state.height.trim().substring(0, state.height.length - 3),
          'client_type_id': Constants.clientTypeId,
          'company_id': Constants.companyId,
          'expires_at': Constants.expiresAt,
          'name': state.name.trim(),
          'role_id': Constants.roleId,
          'active': 1,
          'type': 'phone',
          'balance_id': state.phoneNumber.trim().replaceAll('+', ''),
        }
      },
    );
    await result.fold(
      (left) {
        emit(state.copyWith(registerStatus: RegisterStatus.error));
      },
      (r) async {
        if (r.status == 'CREATED') {
          await setUserInfo(
            printId: '2',
            firstName: state.name.trim(),
            password: r.data?.user?.password ?? '',
            dateOfBirht: state.dateOfBirth.ddmmyyyyToDateTime?.formatDateTime,
            id: r.data?.userId ?? '',
            login: '',
            email: '',
            phoneNumber: r.data?.user?.phone ?? '',
            accessToken: r.data?.token?.accessToken ?? '',
            refreshToken: r.data?.token?.refreshToken ?? '',
            imageUrl: '',
            bloodGroup: state.bloodType.trim(),
            passportNumber: state.passportNumber.trim().replaceAll(' ', '').length == 9 ? state.passportNumber : null,
            weight: double.parse(
              state.weight.trim().substring(0, state.weight.length - 3),
            ).toInt(),
            height: double.parse(
              state.height.trim().substring(0, state.height.length - 3),
            ).toInt(),
            address: state.userAddress.trim(),
            lastName: state.surname.trim(),
            telegramNick: state.tgUsername,
          );
          await sendAnalyticsEvent(
            tag: FirebaseAnalyticsEvents.registerUser,
            parameters: {'user_name': state.name},
          );
          emit(state.copyWith(registerStatus: RegisterStatus.success));
        }
      },
    );
  }
}
