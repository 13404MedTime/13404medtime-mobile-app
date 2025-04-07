// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purpose_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurposeEvent {
  String get doctorId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String doctorId) getMedicalByDoctor,
    required TResult Function(String doctorId) addMedicalByDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String doctorId)? getMedicalByDoctor,
    TResult? Function(String doctorId)? addMedicalByDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String doctorId)? getMedicalByDoctor,
    TResult Function(String doctorId)? addMedicalByDoctor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicalByDoctor value) getMedicalByDoctor,
    required TResult Function(AddMedicalByDoctor value) addMedicalByDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicalByDoctor value)? getMedicalByDoctor,
    TResult? Function(AddMedicalByDoctor value)? addMedicalByDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicalByDoctor value)? getMedicalByDoctor,
    TResult Function(AddMedicalByDoctor value)? addMedicalByDoctor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurposeEventCopyWith<PurposeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurposeEventCopyWith<$Res> {
  factory $PurposeEventCopyWith(
          PurposeEvent value, $Res Function(PurposeEvent) then) =
      _$PurposeEventCopyWithImpl<$Res, PurposeEvent>;
  @useResult
  $Res call({String doctorId});
}

/// @nodoc
class _$PurposeEventCopyWithImpl<$Res, $Val extends PurposeEvent>
    implements $PurposeEventCopyWith<$Res> {
  _$PurposeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
  }) {
    return _then(_value.copyWith(
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetMedicalByDoctorImplCopyWith<$Res>
    implements $PurposeEventCopyWith<$Res> {
  factory _$$GetMedicalByDoctorImplCopyWith(_$GetMedicalByDoctorImpl value,
          $Res Function(_$GetMedicalByDoctorImpl) then) =
      __$$GetMedicalByDoctorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String doctorId});
}

/// @nodoc
class __$$GetMedicalByDoctorImplCopyWithImpl<$Res>
    extends _$PurposeEventCopyWithImpl<$Res, _$GetMedicalByDoctorImpl>
    implements _$$GetMedicalByDoctorImplCopyWith<$Res> {
  __$$GetMedicalByDoctorImplCopyWithImpl(_$GetMedicalByDoctorImpl _value,
      $Res Function(_$GetMedicalByDoctorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
  }) {
    return _then(_$GetMedicalByDoctorImpl(
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetMedicalByDoctorImpl implements GetMedicalByDoctor {
  const _$GetMedicalByDoctorImpl({required this.doctorId});

  @override
  final String doctorId;

  @override
  String toString() {
    return 'PurposeEvent.getMedicalByDoctor(doctorId: $doctorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMedicalByDoctorImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, doctorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMedicalByDoctorImplCopyWith<_$GetMedicalByDoctorImpl> get copyWith =>
      __$$GetMedicalByDoctorImplCopyWithImpl<_$GetMedicalByDoctorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String doctorId) getMedicalByDoctor,
    required TResult Function(String doctorId) addMedicalByDoctor,
  }) {
    return getMedicalByDoctor(doctorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String doctorId)? getMedicalByDoctor,
    TResult? Function(String doctorId)? addMedicalByDoctor,
  }) {
    return getMedicalByDoctor?.call(doctorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String doctorId)? getMedicalByDoctor,
    TResult Function(String doctorId)? addMedicalByDoctor,
    required TResult orElse(),
  }) {
    if (getMedicalByDoctor != null) {
      return getMedicalByDoctor(doctorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicalByDoctor value) getMedicalByDoctor,
    required TResult Function(AddMedicalByDoctor value) addMedicalByDoctor,
  }) {
    return getMedicalByDoctor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicalByDoctor value)? getMedicalByDoctor,
    TResult? Function(AddMedicalByDoctor value)? addMedicalByDoctor,
  }) {
    return getMedicalByDoctor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicalByDoctor value)? getMedicalByDoctor,
    TResult Function(AddMedicalByDoctor value)? addMedicalByDoctor,
    required TResult orElse(),
  }) {
    if (getMedicalByDoctor != null) {
      return getMedicalByDoctor(this);
    }
    return orElse();
  }
}

abstract class GetMedicalByDoctor implements PurposeEvent {
  const factory GetMedicalByDoctor({required final String doctorId}) =
      _$GetMedicalByDoctorImpl;

  @override
  String get doctorId;
  @override
  @JsonKey(ignore: true)
  _$$GetMedicalByDoctorImplCopyWith<_$GetMedicalByDoctorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddMedicalByDoctorImplCopyWith<$Res>
    implements $PurposeEventCopyWith<$Res> {
  factory _$$AddMedicalByDoctorImplCopyWith(_$AddMedicalByDoctorImpl value,
          $Res Function(_$AddMedicalByDoctorImpl) then) =
      __$$AddMedicalByDoctorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String doctorId});
}

/// @nodoc
class __$$AddMedicalByDoctorImplCopyWithImpl<$Res>
    extends _$PurposeEventCopyWithImpl<$Res, _$AddMedicalByDoctorImpl>
    implements _$$AddMedicalByDoctorImplCopyWith<$Res> {
  __$$AddMedicalByDoctorImplCopyWithImpl(_$AddMedicalByDoctorImpl _value,
      $Res Function(_$AddMedicalByDoctorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
  }) {
    return _then(_$AddMedicalByDoctorImpl(
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddMedicalByDoctorImpl implements AddMedicalByDoctor {
  const _$AddMedicalByDoctorImpl({required this.doctorId});

  @override
  final String doctorId;

  @override
  String toString() {
    return 'PurposeEvent.addMedicalByDoctor(doctorId: $doctorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMedicalByDoctorImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, doctorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMedicalByDoctorImplCopyWith<_$AddMedicalByDoctorImpl> get copyWith =>
      __$$AddMedicalByDoctorImplCopyWithImpl<_$AddMedicalByDoctorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String doctorId) getMedicalByDoctor,
    required TResult Function(String doctorId) addMedicalByDoctor,
  }) {
    return addMedicalByDoctor(doctorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String doctorId)? getMedicalByDoctor,
    TResult? Function(String doctorId)? addMedicalByDoctor,
  }) {
    return addMedicalByDoctor?.call(doctorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String doctorId)? getMedicalByDoctor,
    TResult Function(String doctorId)? addMedicalByDoctor,
    required TResult orElse(),
  }) {
    if (addMedicalByDoctor != null) {
      return addMedicalByDoctor(doctorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicalByDoctor value) getMedicalByDoctor,
    required TResult Function(AddMedicalByDoctor value) addMedicalByDoctor,
  }) {
    return addMedicalByDoctor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicalByDoctor value)? getMedicalByDoctor,
    TResult? Function(AddMedicalByDoctor value)? addMedicalByDoctor,
  }) {
    return addMedicalByDoctor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicalByDoctor value)? getMedicalByDoctor,
    TResult Function(AddMedicalByDoctor value)? addMedicalByDoctor,
    required TResult orElse(),
  }) {
    if (addMedicalByDoctor != null) {
      return addMedicalByDoctor(this);
    }
    return orElse();
  }
}

abstract class AddMedicalByDoctor implements PurposeEvent {
  const factory AddMedicalByDoctor({required final String doctorId}) =
      _$AddMedicalByDoctorImpl;

  @override
  String get doctorId;
  @override
  @JsonKey(ignore: true)
  _$$AddMedicalByDoctorImplCopyWith<_$AddMedicalByDoctorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurposeState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAdding => throw _privateConstructorUsedError;
  List<NaznachenieIdData> get medicalHistory =>
      throw _privateConstructorUsedError;
  Map<String, List<SubPurposeMedicationTimesItem>> get medicationTimes =>
      throw _privateConstructorUsedError;
  Map<String, List<String>> get medicalHistoryDrugNames =>
      throw _privateConstructorUsedError;
  Map<String, MedicineTakingModel> get medicalHistoryDrugs =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurposeStateCopyWith<PurposeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurposeStateCopyWith<$Res> {
  factory $PurposeStateCopyWith(
          PurposeState value, $Res Function(PurposeState) then) =
      _$PurposeStateCopyWithImpl<$Res, PurposeState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isAdding,
      List<NaznachenieIdData> medicalHistory,
      Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
      Map<String, List<String>> medicalHistoryDrugNames,
      Map<String, MedicineTakingModel> medicalHistoryDrugs});
}

/// @nodoc
class _$PurposeStateCopyWithImpl<$Res, $Val extends PurposeState>
    implements $PurposeStateCopyWith<$Res> {
  _$PurposeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isAdding = null,
    Object? medicalHistory = null,
    Object? medicationTimes = null,
    Object? medicalHistoryDrugNames = null,
    Object? medicalHistoryDrugs = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdding: null == isAdding
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
      medicalHistory: null == medicalHistory
          ? _value.medicalHistory
          : medicalHistory // ignore: cast_nullable_to_non_nullable
              as List<NaznachenieIdData>,
      medicationTimes: null == medicationTimes
          ? _value.medicationTimes
          : medicationTimes // ignore: cast_nullable_to_non_nullable
              as Map<String, List<SubPurposeMedicationTimesItem>>,
      medicalHistoryDrugNames: null == medicalHistoryDrugNames
          ? _value.medicalHistoryDrugNames
          : medicalHistoryDrugNames // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      medicalHistoryDrugs: null == medicalHistoryDrugs
          ? _value.medicalHistoryDrugs
          : medicalHistoryDrugs // ignore: cast_nullable_to_non_nullable
              as Map<String, MedicineTakingModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurposeStateImplCopyWith<$Res>
    implements $PurposeStateCopyWith<$Res> {
  factory _$$PurposeStateImplCopyWith(
          _$PurposeStateImpl value, $Res Function(_$PurposeStateImpl) then) =
      __$$PurposeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isAdding,
      List<NaznachenieIdData> medicalHistory,
      Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
      Map<String, List<String>> medicalHistoryDrugNames,
      Map<String, MedicineTakingModel> medicalHistoryDrugs});
}

/// @nodoc
class __$$PurposeStateImplCopyWithImpl<$Res>
    extends _$PurposeStateCopyWithImpl<$Res, _$PurposeStateImpl>
    implements _$$PurposeStateImplCopyWith<$Res> {
  __$$PurposeStateImplCopyWithImpl(
      _$PurposeStateImpl _value, $Res Function(_$PurposeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isAdding = null,
    Object? medicalHistory = null,
    Object? medicationTimes = null,
    Object? medicalHistoryDrugNames = null,
    Object? medicalHistoryDrugs = null,
  }) {
    return _then(_$PurposeStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdding: null == isAdding
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
      medicalHistory: null == medicalHistory
          ? _value._medicalHistory
          : medicalHistory // ignore: cast_nullable_to_non_nullable
              as List<NaznachenieIdData>,
      medicationTimes: null == medicationTimes
          ? _value._medicationTimes
          : medicationTimes // ignore: cast_nullable_to_non_nullable
              as Map<String, List<SubPurposeMedicationTimesItem>>,
      medicalHistoryDrugNames: null == medicalHistoryDrugNames
          ? _value._medicalHistoryDrugNames
          : medicalHistoryDrugNames // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      medicalHistoryDrugs: null == medicalHistoryDrugs
          ? _value._medicalHistoryDrugs
          : medicalHistoryDrugs // ignore: cast_nullable_to_non_nullable
              as Map<String, MedicineTakingModel>,
    ));
  }
}

/// @nodoc

class _$PurposeStateImpl implements _PurposeState {
  const _$PurposeStateImpl(
      {this.isLoading = false,
      this.isAdding = false,
      final List<NaznachenieIdData> medicalHistory = const [],
      final Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes =
          const {},
      final Map<String, List<String>> medicalHistoryDrugNames = const {},
      final Map<String, MedicineTakingModel> medicalHistoryDrugs = const {}})
      : _medicalHistory = medicalHistory,
        _medicationTimes = medicationTimes,
        _medicalHistoryDrugNames = medicalHistoryDrugNames,
        _medicalHistoryDrugs = medicalHistoryDrugs;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isAdding;
  final List<NaznachenieIdData> _medicalHistory;
  @override
  @JsonKey()
  List<NaznachenieIdData> get medicalHistory {
    if (_medicalHistory is EqualUnmodifiableListView) return _medicalHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicalHistory);
  }

  final Map<String, List<SubPurposeMedicationTimesItem>> _medicationTimes;
  @override
  @JsonKey()
  Map<String, List<SubPurposeMedicationTimesItem>> get medicationTimes {
    if (_medicationTimes is EqualUnmodifiableMapView) return _medicationTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_medicationTimes);
  }

  final Map<String, List<String>> _medicalHistoryDrugNames;
  @override
  @JsonKey()
  Map<String, List<String>> get medicalHistoryDrugNames {
    if (_medicalHistoryDrugNames is EqualUnmodifiableMapView)
      return _medicalHistoryDrugNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_medicalHistoryDrugNames);
  }

  final Map<String, MedicineTakingModel> _medicalHistoryDrugs;
  @override
  @JsonKey()
  Map<String, MedicineTakingModel> get medicalHistoryDrugs {
    if (_medicalHistoryDrugs is EqualUnmodifiableMapView)
      return _medicalHistoryDrugs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_medicalHistoryDrugs);
  }

  @override
  String toString() {
    return 'PurposeState(isLoading: $isLoading, isAdding: $isAdding, medicalHistory: $medicalHistory, medicationTimes: $medicationTimes, medicalHistoryDrugNames: $medicalHistoryDrugNames, medicalHistoryDrugs: $medicalHistoryDrugs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurposeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAdding, isAdding) ||
                other.isAdding == isAdding) &&
            const DeepCollectionEquality()
                .equals(other._medicalHistory, _medicalHistory) &&
            const DeepCollectionEquality()
                .equals(other._medicationTimes, _medicationTimes) &&
            const DeepCollectionEquality().equals(
                other._medicalHistoryDrugNames, _medicalHistoryDrugNames) &&
            const DeepCollectionEquality()
                .equals(other._medicalHistoryDrugs, _medicalHistoryDrugs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isAdding,
      const DeepCollectionEquality().hash(_medicalHistory),
      const DeepCollectionEquality().hash(_medicationTimes),
      const DeepCollectionEquality().hash(_medicalHistoryDrugNames),
      const DeepCollectionEquality().hash(_medicalHistoryDrugs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurposeStateImplCopyWith<_$PurposeStateImpl> get copyWith =>
      __$$PurposeStateImplCopyWithImpl<_$PurposeStateImpl>(this, _$identity);
}

abstract class _PurposeState implements PurposeState {
  const factory _PurposeState(
      {final bool isLoading,
      final bool isAdding,
      final List<NaznachenieIdData> medicalHistory,
      final Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
      final Map<String, List<String>> medicalHistoryDrugNames,
      final Map<String, MedicineTakingModel>
          medicalHistoryDrugs}) = _$PurposeStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isAdding;
  @override
  List<NaznachenieIdData> get medicalHistory;
  @override
  Map<String, List<SubPurposeMedicationTimesItem>> get medicationTimes;
  @override
  Map<String, List<String>> get medicalHistoryDrugNames;
  @override
  Map<String, MedicineTakingModel> get medicalHistoryDrugs;
  @override
  @JsonKey(ignore: true)
  _$$PurposeStateImplCopyWith<_$PurposeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
