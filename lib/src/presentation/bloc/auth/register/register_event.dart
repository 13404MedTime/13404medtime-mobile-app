part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class PageChangeEvent extends RegisterEvent {
  const PageChangeEvent({required this.pageIndex});

  final int pageIndex;

  @override
  List<Object?> get props => [pageIndex];
}

class PhoneNumberChangeEvent extends RegisterEvent {
  const PhoneNumberChangeEvent({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class NameChangeEvent extends RegisterEvent {
  const NameChangeEvent({required this.nameChanged});

  final String nameChanged;

  @override
  List<Object?> get props => [nameChanged];
}

class SurnameChangeEvent extends RegisterEvent {
  const SurnameChangeEvent({required this.surnameChanged});

  final String surnameChanged;

  @override
  List<Object?> get props => [surnameChanged];
}

class TgUsernameChangeEvent extends RegisterEvent {
  const TgUsernameChangeEvent({required this.changedTgUsername});

  final String changedTgUsername;

  @override
  List<Object?> get props => [changedTgUsername];
}

class DateOfBirthChangeEvent extends RegisterEvent {
  const DateOfBirthChangeEvent({required this.dateOfBirth});

  final String dateOfBirth;

  @override
  List<Object?> get props => [dateOfBirth];
}

class UserAddressChangeEvent extends RegisterEvent {
  const UserAddressChangeEvent({required this.userAddress});

  final String userAddress;

  @override
  List<Object?> get props => [userAddress];
}

class BloodTypeChangeEvent extends RegisterEvent {
  const BloodTypeChangeEvent({required this.bloodType});

  final String bloodType;

  @override
  List<Object?> get props => [bloodType];
}

class PassportNumberChangeEvent extends RegisterEvent {
  const PassportNumberChangeEvent({required this.passportNumber});

  final String passportNumber;

  @override
  List<Object?> get props => [passportNumber];
}

class PassportNumberStatusEvent extends RegisterEvent {
  const PassportNumberStatusEvent({required this.isValidPassportNumber});

  final bool isValidPassportNumber;

  @override
  List<Object?> get props => [isValidPassportNumber];
}

class UserHeightChangeEvent extends RegisterEvent {
  const UserHeightChangeEvent({required this.userHeight});

  final String userHeight;

  @override
  List<Object?> get props => [userHeight];
}

class UserWeightChangeEvent extends RegisterEvent {
  const UserWeightChangeEvent({required this.userWeight});

  final String userWeight;

  @override
  List<Object?> get props => [userWeight];
}

class UserRegisterEvent extends RegisterEvent {
  const UserRegisterEvent();
  @override
  List<Object?> get props => [];
}
