part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.pageIndex = 0,
    this.name = '',
    this.isRegistering = false,
    this.surname = '',
    this.tgUsername = '',
    this.dateOfBirth = '',
    this.userAddress = '',
    this.registerStatus = RegisterStatus.initial,
    this.bloodType = '',
    this.height = '150 cm',
    this.weight = '50 кг',
    this.passportNumber = '',
    this.phoneNumber = '',
    this.isValidPassportNumber = true,
    this.errorName = false,
    this.errorSurname = false,
    this.errorDate = false,
    this.errorAddress = false,
    this.errorWeight = false,
    this.errorHeight = false,
    this.errorBloodType = false,
  });

  // for all
  final int pageIndex;
  final RegisterStatus registerStatus;
  final bool isRegistering;

  // first page data
  final String name;
  final String surname;
  final String tgUsername;
  final String dateOfBirth;
  final String userAddress;
  final bool errorName;
  final bool errorSurname;
  final bool errorDate;
  final bool errorAddress;

  //  second page data
  final String passportNumber;
  final String weight;
  final String height;
  final String bloodType;
  final String phoneNumber;
  final bool isValidPassportNumber;
  final bool errorWeight;
  final bool errorHeight;
  final bool errorBloodType;

  RegisterState copyWith({
    final int? pageIndex,
    final bool? isRegistering,
    final String? name,
    final String? surname,
    final String? tgUsername,
    final String? dateOfBirth,
    final String? userAddress,
    final RegisterStatus? registerStatus,
    final String? bloodType,
    final String? height,
    final String? weight,
    final String? passportNumber,
    final bool? isValidPassportNumber,
    final String? phoneNumber,
    final bool? errorName,
    final bool? errorSurname,
    final bool? errorDate,
    final bool? errorAddress,
    final bool? errorWeight,
    final bool? errorHeight,
    final bool? errorBloodType,
  }) =>
      RegisterState(
        pageIndex: pageIndex ?? this.pageIndex,
        isRegistering: isRegistering ?? this.isRegistering,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        tgUsername: tgUsername ?? this.tgUsername,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        registerStatus: registerStatus ?? RegisterStatus.initial,
        userAddress: userAddress ?? this.userAddress,
        bloodType: bloodType ?? this.bloodType,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        passportNumber: passportNumber ?? this.passportNumber,
        isValidPassportNumber: isValidPassportNumber ?? this.isValidPassportNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        errorName: errorName ?? this.errorName,
        errorSurname: errorSurname ?? this.errorSurname,
        errorDate: errorDate ?? this.errorDate,
        errorAddress: errorAddress ?? this.errorAddress,
        errorWeight: errorWeight ?? this.errorWeight,
        errorHeight: errorHeight ?? this.errorHeight,
        errorBloodType: errorBloodType ?? this.errorBloodType,
      );

  @override
  List<Object> get props => [
        pageIndex,
        isRegistering,
        name,
        surname,
        tgUsername,
        dateOfBirth,
        registerStatus,
        userAddress,
        bloodType,
        height,
        weight,
        passportNumber,
        isValidPassportNumber,
        phoneNumber,
        errorName,
        errorSurname,
        errorDate,
        errorAddress,
        errorWeight,
        errorHeight,
        errorBloodType,
      ];
}

enum RegisterStatus { initial, error, loading, success }

extension RegisterStatusX on RegisterStatus {
  bool get isInitial => this == RegisterStatus.initial;

  bool get isError => this == RegisterStatus.error;

  bool get isLoading => this == RegisterStatus.loading;

  bool get isSuccess => this == RegisterStatus.success;
}
