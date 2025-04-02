// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEditEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditEventCopyWith<$Res> {
  factory $ProfileEditEventCopyWith(
          ProfileEditEvent value, $Res Function(ProfileEditEvent) then) =
      _$ProfileEditEventCopyWithImpl<$Res, ProfileEditEvent>;
}

/// @nodoc
class _$ProfileEditEventCopyWithImpl<$Res, $Val extends ProfileEditEvent>
    implements $ProfileEditEventCopyWith<$Res> {
  _$ProfileEditEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl with DiagnosticableTreeMixin implements _Started {
  const _$StartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ProfileEditEvent.started'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProfileEditEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$UserProfileEditEventImplCopyWith<$Res> {
  factory _$$UserProfileEditEventImplCopyWith(_$UserProfileEditEventImpl value,
          $Res Function(_$UserProfileEditEventImpl) then) =
      __$$UserProfileEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String address,
      String passportNumber,
      String bloodGroup,
      String dateOfBirth,
      String telegramNicName});
}

/// @nodoc
class __$$UserProfileEditEventImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$UserProfileEditEventImpl>
    implements _$$UserProfileEditEventImplCopyWith<$Res> {
  __$$UserProfileEditEventImplCopyWithImpl(_$UserProfileEditEventImpl _value,
      $Res Function(_$UserProfileEditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? address = null,
    Object? passportNumber = null,
    Object? bloodGroup = null,
    Object? dateOfBirth = null,
    Object? telegramNicName = null,
  }) {
    return _then(_$UserProfileEditEventImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      passportNumber: null == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bloodGroup: null == bloodGroup
          ? _value.bloodGroup
          : bloodGroup // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      telegramNicName: null == telegramNicName
          ? _value.telegramNicName
          : telegramNicName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserProfileEditEventImpl
    with DiagnosticableTreeMixin
    implements UserProfileEditEvent {
  const _$UserProfileEditEventImpl(
      {required this.firstName,
      required this.lastName,
      required this.address,
      required this.passportNumber,
      required this.bloodGroup,
      required this.dateOfBirth,
      required this.telegramNicName});

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String address;
  @override
  final String passportNumber;
  @override
  final String bloodGroup;
  @override
  final String dateOfBirth;
  @override
  final String telegramNicName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditEvent.updateProfile(firstName: $firstName, lastName: $lastName, address: $address, passportNumber: $passportNumber, bloodGroup: $bloodGroup, dateOfBirth: $dateOfBirth, telegramNicName: $telegramNicName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEditEvent.updateProfile'))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('passportNumber', passportNumber))
      ..add(DiagnosticsProperty('bloodGroup', bloodGroup))
      ..add(DiagnosticsProperty('dateOfBirth', dateOfBirth))
      ..add(DiagnosticsProperty('telegramNicName', telegramNicName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileEditEventImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.passportNumber, passportNumber) ||
                other.passportNumber == passportNumber) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.telegramNicName, telegramNicName) ||
                other.telegramNicName == telegramNicName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, address,
      passportNumber, bloodGroup, dateOfBirth, telegramNicName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileEditEventImplCopyWith<_$UserProfileEditEventImpl>
      get copyWith =>
          __$$UserProfileEditEventImplCopyWithImpl<_$UserProfileEditEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) {
    return updateProfile(firstName, lastName, address, passportNumber,
        bloodGroup, dateOfBirth, telegramNicName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) {
    return updateProfile?.call(firstName, lastName, address, passportNumber,
        bloodGroup, dateOfBirth, telegramNicName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(firstName, lastName, address, passportNumber,
          bloodGroup, dateOfBirth, telegramNicName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) {
    return updateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(this);
    }
    return orElse();
  }
}

abstract class UserProfileEditEvent implements ProfileEditEvent {
  const factory UserProfileEditEvent(
      {required final String firstName,
      required final String lastName,
      required final String address,
      required final String passportNumber,
      required final String bloodGroup,
      required final String dateOfBirth,
      required final String telegramNicName}) = _$UserProfileEditEventImpl;

  String get firstName;
  String get lastName;
  String get address;
  String get passportNumber;
  String get bloodGroup;
  String get dateOfBirth;
  String get telegramNicName;
  @JsonKey(ignore: true)
  _$$UserProfileEditEventImplCopyWith<_$UserProfileEditEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirstNameChangedEventImplCopyWith<$Res> {
  factory _$$FirstNameChangedEventImplCopyWith(
          _$FirstNameChangedEventImpl value,
          $Res Function(_$FirstNameChangedEventImpl) then) =
      __$$FirstNameChangedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FirstNameChangedEventImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$FirstNameChangedEventImpl>
    implements _$$FirstNameChangedEventImplCopyWith<$Res> {
  __$$FirstNameChangedEventImplCopyWithImpl(_$FirstNameChangedEventImpl _value,
      $Res Function(_$FirstNameChangedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FirstNameChangedEventImpl
    with DiagnosticableTreeMixin
    implements FirstNameChangedEvent {
  const _$FirstNameChangedEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditEvent.onFirstNameChanged()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'ProfileEditEvent.onFirstNameChanged'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstNameChangedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) {
    return onFirstNameChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) {
    return onFirstNameChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (onFirstNameChanged != null) {
      return onFirstNameChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) {
    return onFirstNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) {
    return onFirstNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (onFirstNameChanged != null) {
      return onFirstNameChanged(this);
    }
    return orElse();
  }
}

abstract class FirstNameChangedEvent implements ProfileEditEvent {
  const factory FirstNameChangedEvent() = _$FirstNameChangedEventImpl;
}

/// @nodoc
abstract class _$$LastNameChangedEventImplCopyWith<$Res> {
  factory _$$LastNameChangedEventImplCopyWith(_$LastNameChangedEventImpl value,
          $Res Function(_$LastNameChangedEventImpl) then) =
      __$$LastNameChangedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LastNameChangedEventImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$LastNameChangedEventImpl>
    implements _$$LastNameChangedEventImplCopyWith<$Res> {
  __$$LastNameChangedEventImplCopyWithImpl(_$LastNameChangedEventImpl _value,
      $Res Function(_$LastNameChangedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LastNameChangedEventImpl
    with DiagnosticableTreeMixin
    implements LastNameChangedEvent {
  const _$LastNameChangedEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditEvent.onLastNameChanged()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ProfileEditEvent.onLastNameChanged'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastNameChangedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) {
    return onLastNameChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) {
    return onLastNameChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (onLastNameChanged != null) {
      return onLastNameChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) {
    return onLastNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) {
    return onLastNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (onLastNameChanged != null) {
      return onLastNameChanged(this);
    }
    return orElse();
  }
}

abstract class LastNameChangedEvent implements ProfileEditEvent {
  const factory LastNameChangedEvent() = _$LastNameChangedEventImpl;
}

/// @nodoc
abstract class _$$AddressChangedEventImplCopyWith<$Res> {
  factory _$$AddressChangedEventImplCopyWith(_$AddressChangedEventImpl value,
          $Res Function(_$AddressChangedEventImpl) then) =
      __$$AddressChangedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddressChangedEventImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$AddressChangedEventImpl>
    implements _$$AddressChangedEventImplCopyWith<$Res> {
  __$$AddressChangedEventImplCopyWithImpl(_$AddressChangedEventImpl _value,
      $Res Function(_$AddressChangedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddressChangedEventImpl
    with DiagnosticableTreeMixin
    implements AddressChangedEvent {
  const _$AddressChangedEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditEvent.onAddressChanged()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ProfileEditEvent.onAddressChanged'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressChangedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) {
    return onAddressChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) {
    return onAddressChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (onAddressChanged != null) {
      return onAddressChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) {
    return onAddressChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) {
    return onAddressChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (onAddressChanged != null) {
      return onAddressChanged(this);
    }
    return orElse();
  }
}

abstract class AddressChangedEvent implements ProfileEditEvent {
  const factory AddressChangedEvent() = _$AddressChangedEventImpl;
}

/// @nodoc
abstract class _$$PassportNumberChangedEventImplCopyWith<$Res> {
  factory _$$PassportNumberChangedEventImplCopyWith(
          _$PassportNumberChangedEventImpl value,
          $Res Function(_$PassportNumberChangedEventImpl) then) =
      __$$PassportNumberChangedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PassportNumberChangedEventImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res,
        _$PassportNumberChangedEventImpl>
    implements _$$PassportNumberChangedEventImplCopyWith<$Res> {
  __$$PassportNumberChangedEventImplCopyWithImpl(
      _$PassportNumberChangedEventImpl _value,
      $Res Function(_$PassportNumberChangedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PassportNumberChangedEventImpl
    with DiagnosticableTreeMixin
    implements PassportNumberChangedEvent {
  const _$PassportNumberChangedEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditEvent.onPassportNumberChanged()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty(
        'type', 'ProfileEditEvent.onPassportNumberChanged'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassportNumberChangedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) {
    return onPassportNumberChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) {
    return onPassportNumberChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (onPassportNumberChanged != null) {
      return onPassportNumberChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) {
    return onPassportNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) {
    return onPassportNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (onPassportNumberChanged != null) {
      return onPassportNumberChanged(this);
    }
    return orElse();
  }
}

abstract class PassportNumberChangedEvent implements ProfileEditEvent {
  const factory PassportNumberChangedEvent() = _$PassportNumberChangedEventImpl;
}

/// @nodoc
abstract class _$$BloodGroupChangedEventImplCopyWith<$Res> {
  factory _$$BloodGroupChangedEventImplCopyWith(
          _$BloodGroupChangedEventImpl value,
          $Res Function(_$BloodGroupChangedEventImpl) then) =
      __$$BloodGroupChangedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BloodGroupChangedEventImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$BloodGroupChangedEventImpl>
    implements _$$BloodGroupChangedEventImplCopyWith<$Res> {
  __$$BloodGroupChangedEventImplCopyWithImpl(
      _$BloodGroupChangedEventImpl _value,
      $Res Function(_$BloodGroupChangedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BloodGroupChangedEventImpl
    with DiagnosticableTreeMixin
    implements BloodGroupChangedEvent {
  const _$BloodGroupChangedEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditEvent.onBloodGroupChanged()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'ProfileEditEvent.onBloodGroupChanged'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodGroupChangedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) {
    return onBloodGroupChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) {
    return onBloodGroupChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (onBloodGroupChanged != null) {
      return onBloodGroupChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) {
    return onBloodGroupChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) {
    return onBloodGroupChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (onBloodGroupChanged != null) {
      return onBloodGroupChanged(this);
    }
    return orElse();
  }
}

abstract class BloodGroupChangedEvent implements ProfileEditEvent {
  const factory BloodGroupChangedEvent() = _$BloodGroupChangedEventImpl;
}

/// @nodoc
abstract class _$$DeleteProfileEventImplCopyWith<$Res> {
  factory _$$DeleteProfileEventImplCopyWith(_$DeleteProfileEventImpl value,
          $Res Function(_$DeleteProfileEventImpl) then) =
      __$$DeleteProfileEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteProfileEventImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$DeleteProfileEventImpl>
    implements _$$DeleteProfileEventImplCopyWith<$Res> {
  __$$DeleteProfileEventImplCopyWithImpl(_$DeleteProfileEventImpl _value,
      $Res Function(_$DeleteProfileEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteProfileEventImpl
    with DiagnosticableTreeMixin
    implements DeleteProfileEvent {
  const _$DeleteProfileEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditEvent.deleteProfile()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ProfileEditEvent.deleteProfile'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteProfileEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) {
    return deleteProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) {
    return deleteProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (deleteProfile != null) {
      return deleteProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) {
    return deleteProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) {
    return deleteProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (deleteProfile != null) {
      return deleteProfile(this);
    }
    return orElse();
  }
}

abstract class DeleteProfileEvent implements ProfileEditEvent {
  const factory DeleteProfileEvent() = _$DeleteProfileEventImpl;
}

/// @nodoc
abstract class _$$UpdateUserLangImplCopyWith<$Res> {
  factory _$$UpdateUserLangImplCopyWith(_$UpdateUserLangImpl value,
          $Res Function(_$UpdateUserLangImpl) then) =
      __$$UpdateUserLangImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userLang});
}

/// @nodoc
class __$$UpdateUserLangImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$UpdateUserLangImpl>
    implements _$$UpdateUserLangImplCopyWith<$Res> {
  __$$UpdateUserLangImplCopyWithImpl(
      _$UpdateUserLangImpl _value, $Res Function(_$UpdateUserLangImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLang = null,
  }) {
    return _then(_$UpdateUserLangImpl(
      userLang: null == userLang
          ? _value.userLang
          : userLang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateUserLangImpl
    with DiagnosticableTreeMixin
    implements UpdateUserLang {
  const _$UpdateUserLangImpl({this.userLang = ''});

  @override
  @JsonKey()
  final String userLang;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditEvent.updateUserLang(userLang: $userLang)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEditEvent.updateUserLang'))
      ..add(DiagnosticsProperty('userLang', userLang));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserLangImpl &&
            (identical(other.userLang, userLang) ||
                other.userLang == userLang));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userLang);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserLangImplCopyWith<_$UpdateUserLangImpl> get copyWith =>
      __$$UpdateUserLangImplCopyWithImpl<_$UpdateUserLangImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) {
    return updateUserLang(userLang);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) {
    return updateUserLang?.call(userLang);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (updateUserLang != null) {
      return updateUserLang(userLang);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) {
    return updateUserLang(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) {
    return updateUserLang?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (updateUserLang != null) {
      return updateUserLang(this);
    }
    return orElse();
  }
}

abstract class UpdateUserLang implements ProfileEditEvent {
  const factory UpdateUserLang({final String userLang}) = _$UpdateUserLangImpl;

  String get userLang;
  @JsonKey(ignore: true)
  _$$UpdateUserLangImplCopyWith<_$UpdateUserLangImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PassportNumberChangeEventImplCopyWith<$Res> {
  factory _$$PassportNumberChangeEventImplCopyWith(
          _$PassportNumberChangeEventImpl value,
          $Res Function(_$PassportNumberChangeEventImpl) then) =
      __$$PassportNumberChangeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String passportNumber});
}

/// @nodoc
class __$$PassportNumberChangeEventImplCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res,
        _$PassportNumberChangeEventImpl>
    implements _$$PassportNumberChangeEventImplCopyWith<$Res> {
  __$$PassportNumberChangeEventImplCopyWithImpl(
      _$PassportNumberChangeEventImpl _value,
      $Res Function(_$PassportNumberChangeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passportNumber = null,
  }) {
    return _then(_$PassportNumberChangeEventImpl(
      passportNumber: null == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PassportNumberChangeEventImpl
    with DiagnosticableTreeMixin
    implements PassportNumberChangeEvent {
  const _$PassportNumberChangeEventImpl({this.passportNumber = ''});

  @override
  @JsonKey()
  final String passportNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditEvent.passportNumberChangeEvent(passportNumber: $passportNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ProfileEditEvent.passportNumberChangeEvent'))
      ..add(DiagnosticsProperty('passportNumber', passportNumber));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassportNumberChangeEventImpl &&
            (identical(other.passportNumber, passportNumber) ||
                other.passportNumber == passportNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passportNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PassportNumberChangeEventImplCopyWith<_$PassportNumberChangeEventImpl>
      get copyWith => __$$PassportNumberChangeEventImplCopyWithImpl<
          _$PassportNumberChangeEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)
        updateProfile,
    required TResult Function() onFirstNameChanged,
    required TResult Function() onLastNameChanged,
    required TResult Function() onAddressChanged,
    required TResult Function() onPassportNumberChanged,
    required TResult Function() onBloodGroupChanged,
    required TResult Function() deleteProfile,
    required TResult Function(String userLang) updateUserLang,
    required TResult Function(String passportNumber) passportNumberChangeEvent,
  }) {
    return passportNumberChangeEvent(passportNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult? Function()? onFirstNameChanged,
    TResult? Function()? onLastNameChanged,
    TResult? Function()? onAddressChanged,
    TResult? Function()? onPassportNumberChanged,
    TResult? Function()? onBloodGroupChanged,
    TResult? Function()? deleteProfile,
    TResult? Function(String userLang)? updateUserLang,
    TResult? Function(String passportNumber)? passportNumberChangeEvent,
  }) {
    return passportNumberChangeEvent?.call(passportNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String firstName,
            String lastName,
            String address,
            String passportNumber,
            String bloodGroup,
            String dateOfBirth,
            String telegramNicName)?
        updateProfile,
    TResult Function()? onFirstNameChanged,
    TResult Function()? onLastNameChanged,
    TResult Function()? onAddressChanged,
    TResult Function()? onPassportNumberChanged,
    TResult Function()? onBloodGroupChanged,
    TResult Function()? deleteProfile,
    TResult Function(String userLang)? updateUserLang,
    TResult Function(String passportNumber)? passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (passportNumberChangeEvent != null) {
      return passportNumberChangeEvent(passportNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserProfileEditEvent value) updateProfile,
    required TResult Function(FirstNameChangedEvent value) onFirstNameChanged,
    required TResult Function(LastNameChangedEvent value) onLastNameChanged,
    required TResult Function(AddressChangedEvent value) onAddressChanged,
    required TResult Function(PassportNumberChangedEvent value)
        onPassportNumberChanged,
    required TResult Function(BloodGroupChangedEvent value) onBloodGroupChanged,
    required TResult Function(DeleteProfileEvent value) deleteProfile,
    required TResult Function(UpdateUserLang value) updateUserLang,
    required TResult Function(PassportNumberChangeEvent value)
        passportNumberChangeEvent,
  }) {
    return passportNumberChangeEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserProfileEditEvent value)? updateProfile,
    TResult? Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult? Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult? Function(AddressChangedEvent value)? onAddressChanged,
    TResult? Function(PassportNumberChangedEvent value)?
        onPassportNumberChanged,
    TResult? Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult? Function(DeleteProfileEvent value)? deleteProfile,
    TResult? Function(UpdateUserLang value)? updateUserLang,
    TResult? Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
  }) {
    return passportNumberChangeEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserProfileEditEvent value)? updateProfile,
    TResult Function(FirstNameChangedEvent value)? onFirstNameChanged,
    TResult Function(LastNameChangedEvent value)? onLastNameChanged,
    TResult Function(AddressChangedEvent value)? onAddressChanged,
    TResult Function(PassportNumberChangedEvent value)? onPassportNumberChanged,
    TResult Function(BloodGroupChangedEvent value)? onBloodGroupChanged,
    TResult Function(DeleteProfileEvent value)? deleteProfile,
    TResult Function(UpdateUserLang value)? updateUserLang,
    TResult Function(PassportNumberChangeEvent value)?
        passportNumberChangeEvent,
    required TResult orElse(),
  }) {
    if (passportNumberChangeEvent != null) {
      return passportNumberChangeEvent(this);
    }
    return orElse();
  }
}

abstract class PassportNumberChangeEvent implements ProfileEditEvent {
  const factory PassportNumberChangeEvent({final String passportNumber}) =
      _$PassportNumberChangeEventImpl;

  String get passportNumber;
  @JsonKey(ignore: true)
  _$$PassportNumberChangeEventImplCopyWith<_$PassportNumberChangeEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileEditState {
  bool get showNameError => throw _privateConstructorUsedError;
  bool get showSurnameError => throw _privateConstructorUsedError;
  bool get showAddressError => throw _privateConstructorUsedError;
  bool get showBloodGroupError => throw _privateConstructorUsedError;
  ProfileEditStatus get status => throw _privateConstructorUsedError;
  bool get isProfileUpdated => throw _privateConstructorUsedError;
  bool get isProfileDeleted => throw _privateConstructorUsedError;
  bool get isValidPassportNumber => throw _privateConstructorUsedError;
  String get passportNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEditStateCopyWith<ProfileEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditStateCopyWith(
          ProfileEditState value, $Res Function(ProfileEditState) then) =
      _$ProfileEditStateCopyWithImpl<$Res, ProfileEditState>;
  @useResult
  $Res call(
      {bool showNameError,
      bool showSurnameError,
      bool showAddressError,
      bool showBloodGroupError,
      ProfileEditStatus status,
      bool isProfileUpdated,
      bool isProfileDeleted,
      bool isValidPassportNumber,
      String passportNumber});
}

/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res, $Val extends ProfileEditState>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showNameError = null,
    Object? showSurnameError = null,
    Object? showAddressError = null,
    Object? showBloodGroupError = null,
    Object? status = null,
    Object? isProfileUpdated = null,
    Object? isProfileDeleted = null,
    Object? isValidPassportNumber = null,
    Object? passportNumber = null,
  }) {
    return _then(_value.copyWith(
      showNameError: null == showNameError
          ? _value.showNameError
          : showNameError // ignore: cast_nullable_to_non_nullable
              as bool,
      showSurnameError: null == showSurnameError
          ? _value.showSurnameError
          : showSurnameError // ignore: cast_nullable_to_non_nullable
              as bool,
      showAddressError: null == showAddressError
          ? _value.showAddressError
          : showAddressError // ignore: cast_nullable_to_non_nullable
              as bool,
      showBloodGroupError: null == showBloodGroupError
          ? _value.showBloodGroupError
          : showBloodGroupError // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileEditStatus,
      isProfileUpdated: null == isProfileUpdated
          ? _value.isProfileUpdated
          : isProfileUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      isProfileDeleted: null == isProfileDeleted
          ? _value.isProfileDeleted
          : isProfileDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidPassportNumber: null == isValidPassportNumber
          ? _value.isValidPassportNumber
          : isValidPassportNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      passportNumber: null == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileEditStateImplCopyWith<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  factory _$$ProfileEditStateImplCopyWith(_$ProfileEditStateImpl value,
          $Res Function(_$ProfileEditStateImpl) then) =
      __$$ProfileEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showNameError,
      bool showSurnameError,
      bool showAddressError,
      bool showBloodGroupError,
      ProfileEditStatus status,
      bool isProfileUpdated,
      bool isProfileDeleted,
      bool isValidPassportNumber,
      String passportNumber});
}

/// @nodoc
class __$$ProfileEditStateImplCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res, _$ProfileEditStateImpl>
    implements _$$ProfileEditStateImplCopyWith<$Res> {
  __$$ProfileEditStateImplCopyWithImpl(_$ProfileEditStateImpl _value,
      $Res Function(_$ProfileEditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showNameError = null,
    Object? showSurnameError = null,
    Object? showAddressError = null,
    Object? showBloodGroupError = null,
    Object? status = null,
    Object? isProfileUpdated = null,
    Object? isProfileDeleted = null,
    Object? isValidPassportNumber = null,
    Object? passportNumber = null,
  }) {
    return _then(_$ProfileEditStateImpl(
      showNameError: null == showNameError
          ? _value.showNameError
          : showNameError // ignore: cast_nullable_to_non_nullable
              as bool,
      showSurnameError: null == showSurnameError
          ? _value.showSurnameError
          : showSurnameError // ignore: cast_nullable_to_non_nullable
              as bool,
      showAddressError: null == showAddressError
          ? _value.showAddressError
          : showAddressError // ignore: cast_nullable_to_non_nullable
              as bool,
      showBloodGroupError: null == showBloodGroupError
          ? _value.showBloodGroupError
          : showBloodGroupError // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileEditStatus,
      isProfileUpdated: null == isProfileUpdated
          ? _value.isProfileUpdated
          : isProfileUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      isProfileDeleted: null == isProfileDeleted
          ? _value.isProfileDeleted
          : isProfileDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidPassportNumber: null == isValidPassportNumber
          ? _value.isValidPassportNumber
          : isValidPassportNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      passportNumber: null == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileEditStateImpl
    with DiagnosticableTreeMixin
    implements _ProfileEditState {
  const _$ProfileEditStateImpl(
      {this.showNameError = false,
      this.showSurnameError = false,
      this.showAddressError = false,
      this.showBloodGroupError = false,
      this.status = ProfileEditStatus.initial,
      this.isProfileUpdated = false,
      this.isProfileDeleted = false,
      this.isValidPassportNumber = false,
      this.passportNumber = ''});

  @override
  @JsonKey()
  final bool showNameError;
  @override
  @JsonKey()
  final bool showSurnameError;
  @override
  @JsonKey()
  final bool showAddressError;
  @override
  @JsonKey()
  final bool showBloodGroupError;
  @override
  @JsonKey()
  final ProfileEditStatus status;
  @override
  @JsonKey()
  final bool isProfileUpdated;
  @override
  @JsonKey()
  final bool isProfileDeleted;
  @override
  @JsonKey()
  final bool isValidPassportNumber;
  @override
  @JsonKey()
  final String passportNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEditState(showNameError: $showNameError, showSurnameError: $showSurnameError, showAddressError: $showAddressError, showBloodGroupError: $showBloodGroupError, status: $status, isProfileUpdated: $isProfileUpdated, isProfileDeleted: $isProfileDeleted, isValidPassportNumber: $isValidPassportNumber, passportNumber: $passportNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEditState'))
      ..add(DiagnosticsProperty('showNameError', showNameError))
      ..add(DiagnosticsProperty('showSurnameError', showSurnameError))
      ..add(DiagnosticsProperty('showAddressError', showAddressError))
      ..add(DiagnosticsProperty('showBloodGroupError', showBloodGroupError))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('isProfileUpdated', isProfileUpdated))
      ..add(DiagnosticsProperty('isProfileDeleted', isProfileDeleted))
      ..add(DiagnosticsProperty('isValidPassportNumber', isValidPassportNumber))
      ..add(DiagnosticsProperty('passportNumber', passportNumber));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditStateImpl &&
            (identical(other.showNameError, showNameError) ||
                other.showNameError == showNameError) &&
            (identical(other.showSurnameError, showSurnameError) ||
                other.showSurnameError == showSurnameError) &&
            (identical(other.showAddressError, showAddressError) ||
                other.showAddressError == showAddressError) &&
            (identical(other.showBloodGroupError, showBloodGroupError) ||
                other.showBloodGroupError == showBloodGroupError) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isProfileUpdated, isProfileUpdated) ||
                other.isProfileUpdated == isProfileUpdated) &&
            (identical(other.isProfileDeleted, isProfileDeleted) ||
                other.isProfileDeleted == isProfileDeleted) &&
            (identical(other.isValidPassportNumber, isValidPassportNumber) ||
                other.isValidPassportNumber == isValidPassportNumber) &&
            (identical(other.passportNumber, passportNumber) ||
                other.passportNumber == passportNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      showNameError,
      showSurnameError,
      showAddressError,
      showBloodGroupError,
      status,
      isProfileUpdated,
      isProfileDeleted,
      isValidPassportNumber,
      passportNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditStateImplCopyWith<_$ProfileEditStateImpl> get copyWith =>
      __$$ProfileEditStateImplCopyWithImpl<_$ProfileEditStateImpl>(
          this, _$identity);
}

abstract class _ProfileEditState implements ProfileEditState {
  const factory _ProfileEditState(
      {final bool showNameError,
      final bool showSurnameError,
      final bool showAddressError,
      final bool showBloodGroupError,
      final ProfileEditStatus status,
      final bool isProfileUpdated,
      final bool isProfileDeleted,
      final bool isValidPassportNumber,
      final String passportNumber}) = _$ProfileEditStateImpl;

  @override
  bool get showNameError;
  @override
  bool get showSurnameError;
  @override
  bool get showAddressError;
  @override
  bool get showBloodGroupError;
  @override
  ProfileEditStatus get status;
  @override
  bool get isProfileUpdated;
  @override
  bool get isProfileDeleted;
  @override
  bool get isValidPassportNumber;
  @override
  String get passportNumber;
  @override
  @JsonKey(ignore: true)
  _$$ProfileEditStateImplCopyWith<_$ProfileEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
