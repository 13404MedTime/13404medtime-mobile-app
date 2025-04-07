// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_purpose_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubPurposeEvent {
  String get naznachenieId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String naznachenieId) getMedicationData,
    required TResult Function(String naznachenieId) getFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String naznachenieId)? getMedicationData,
    TResult? Function(String naznachenieId)? getFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String naznachenieId)? getMedicationData,
    TResult Function(String naznachenieId)? getFiles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicationDataEvent value) getMedicationData,
    required TResult Function(GetFilesEvent value) getFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicationDataEvent value)? getMedicationData,
    TResult? Function(GetFilesEvent value)? getFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicationDataEvent value)? getMedicationData,
    TResult Function(GetFilesEvent value)? getFiles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubPurposeEventCopyWith<SubPurposeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubPurposeEventCopyWith<$Res> {
  factory $SubPurposeEventCopyWith(
          SubPurposeEvent value, $Res Function(SubPurposeEvent) then) =
      _$SubPurposeEventCopyWithImpl<$Res, SubPurposeEvent>;
  @useResult
  $Res call({String naznachenieId});
}

/// @nodoc
class _$SubPurposeEventCopyWithImpl<$Res, $Val extends SubPurposeEvent>
    implements $SubPurposeEventCopyWith<$Res> {
  _$SubPurposeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? naznachenieId = null,
  }) {
    return _then(_value.copyWith(
      naznachenieId: null == naznachenieId
          ? _value.naznachenieId
          : naznachenieId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetMedicationDataEventImplCopyWith<$Res>
    implements $SubPurposeEventCopyWith<$Res> {
  factory _$$GetMedicationDataEventImplCopyWith(
          _$GetMedicationDataEventImpl value,
          $Res Function(_$GetMedicationDataEventImpl) then) =
      __$$GetMedicationDataEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String naznachenieId});
}

/// @nodoc
class __$$GetMedicationDataEventImplCopyWithImpl<$Res>
    extends _$SubPurposeEventCopyWithImpl<$Res, _$GetMedicationDataEventImpl>
    implements _$$GetMedicationDataEventImplCopyWith<$Res> {
  __$$GetMedicationDataEventImplCopyWithImpl(
      _$GetMedicationDataEventImpl _value,
      $Res Function(_$GetMedicationDataEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? naznachenieId = null,
  }) {
    return _then(_$GetMedicationDataEventImpl(
      naznachenieId: null == naznachenieId
          ? _value.naznachenieId
          : naznachenieId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetMedicationDataEventImpl implements GetMedicationDataEvent {
  const _$GetMedicationDataEventImpl({required this.naznachenieId});

  @override
  final String naznachenieId;

  @override
  String toString() {
    return 'SubPurposeEvent.getMedicationData(naznachenieId: $naznachenieId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMedicationDataEventImpl &&
            (identical(other.naznachenieId, naznachenieId) ||
                other.naznachenieId == naznachenieId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, naznachenieId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMedicationDataEventImplCopyWith<_$GetMedicationDataEventImpl>
      get copyWith => __$$GetMedicationDataEventImplCopyWithImpl<
          _$GetMedicationDataEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String naznachenieId) getMedicationData,
    required TResult Function(String naznachenieId) getFiles,
  }) {
    return getMedicationData(naznachenieId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String naznachenieId)? getMedicationData,
    TResult? Function(String naznachenieId)? getFiles,
  }) {
    return getMedicationData?.call(naznachenieId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String naznachenieId)? getMedicationData,
    TResult Function(String naznachenieId)? getFiles,
    required TResult orElse(),
  }) {
    if (getMedicationData != null) {
      return getMedicationData(naznachenieId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicationDataEvent value) getMedicationData,
    required TResult Function(GetFilesEvent value) getFiles,
  }) {
    return getMedicationData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicationDataEvent value)? getMedicationData,
    TResult? Function(GetFilesEvent value)? getFiles,
  }) {
    return getMedicationData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicationDataEvent value)? getMedicationData,
    TResult Function(GetFilesEvent value)? getFiles,
    required TResult orElse(),
  }) {
    if (getMedicationData != null) {
      return getMedicationData(this);
    }
    return orElse();
  }
}

abstract class GetMedicationDataEvent implements SubPurposeEvent {
  const factory GetMedicationDataEvent({required final String naznachenieId}) =
      _$GetMedicationDataEventImpl;

  @override
  String get naznachenieId;
  @override
  @JsonKey(ignore: true)
  _$$GetMedicationDataEventImplCopyWith<_$GetMedicationDataEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetFilesEventImplCopyWith<$Res>
    implements $SubPurposeEventCopyWith<$Res> {
  factory _$$GetFilesEventImplCopyWith(
          _$GetFilesEventImpl value, $Res Function(_$GetFilesEventImpl) then) =
      __$$GetFilesEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String naznachenieId});
}

/// @nodoc
class __$$GetFilesEventImplCopyWithImpl<$Res>
    extends _$SubPurposeEventCopyWithImpl<$Res, _$GetFilesEventImpl>
    implements _$$GetFilesEventImplCopyWith<$Res> {
  __$$GetFilesEventImplCopyWithImpl(
      _$GetFilesEventImpl _value, $Res Function(_$GetFilesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? naznachenieId = null,
  }) {
    return _then(_$GetFilesEventImpl(
      naznachenieId: null == naznachenieId
          ? _value.naznachenieId
          : naznachenieId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetFilesEventImpl implements GetFilesEvent {
  const _$GetFilesEventImpl({required this.naznachenieId});

  @override
  final String naznachenieId;

  @override
  String toString() {
    return 'SubPurposeEvent.getFiles(naznachenieId: $naznachenieId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFilesEventImpl &&
            (identical(other.naznachenieId, naznachenieId) ||
                other.naznachenieId == naznachenieId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, naznachenieId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFilesEventImplCopyWith<_$GetFilesEventImpl> get copyWith =>
      __$$GetFilesEventImplCopyWithImpl<_$GetFilesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String naznachenieId) getMedicationData,
    required TResult Function(String naznachenieId) getFiles,
  }) {
    return getFiles(naznachenieId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String naznachenieId)? getMedicationData,
    TResult? Function(String naznachenieId)? getFiles,
  }) {
    return getFiles?.call(naznachenieId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String naznachenieId)? getMedicationData,
    TResult Function(String naznachenieId)? getFiles,
    required TResult orElse(),
  }) {
    if (getFiles != null) {
      return getFiles(naznachenieId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicationDataEvent value) getMedicationData,
    required TResult Function(GetFilesEvent value) getFiles,
  }) {
    return getFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicationDataEvent value)? getMedicationData,
    TResult? Function(GetFilesEvent value)? getFiles,
  }) {
    return getFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicationDataEvent value)? getMedicationData,
    TResult Function(GetFilesEvent value)? getFiles,
    required TResult orElse(),
  }) {
    if (getFiles != null) {
      return getFiles(this);
    }
    return orElse();
  }
}

abstract class GetFilesEvent implements SubPurposeEvent {
  const factory GetFilesEvent({required final String naznachenieId}) =
      _$GetFilesEventImpl;

  @override
  String get naznachenieId;
  @override
  @JsonKey(ignore: true)
  _$$GetFilesEventImplCopyWith<_$GetFilesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubPurposeState {
  List<MedicineTakingModel> get allPreparatsOfNaznachenie =>
      throw _privateConstructorUsedError;
  Map<String, SubPurposeMedicationTimes> get medicationTimes =>
      throw _privateConstructorUsedError;
  SubPurposeStatus get status => throw _privateConstructorUsedError;
  Map<String, List<FileModel>> get files => throw _privateConstructorUsedError;
  bool get isLoadingFiles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubPurposeStateCopyWith<SubPurposeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubPurposeStateCopyWith<$Res> {
  factory $SubPurposeStateCopyWith(
          SubPurposeState value, $Res Function(SubPurposeState) then) =
      _$SubPurposeStateCopyWithImpl<$Res, SubPurposeState>;
  @useResult
  $Res call(
      {List<MedicineTakingModel> allPreparatsOfNaznachenie,
      Map<String, SubPurposeMedicationTimes> medicationTimes,
      SubPurposeStatus status,
      Map<String, List<FileModel>> files,
      bool isLoadingFiles});
}

/// @nodoc
class _$SubPurposeStateCopyWithImpl<$Res, $Val extends SubPurposeState>
    implements $SubPurposeStateCopyWith<$Res> {
  _$SubPurposeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allPreparatsOfNaznachenie = null,
    Object? medicationTimes = null,
    Object? status = null,
    Object? files = null,
    Object? isLoadingFiles = null,
  }) {
    return _then(_value.copyWith(
      allPreparatsOfNaznachenie: null == allPreparatsOfNaznachenie
          ? _value.allPreparatsOfNaznachenie
          : allPreparatsOfNaznachenie // ignore: cast_nullable_to_non_nullable
              as List<MedicineTakingModel>,
      medicationTimes: null == medicationTimes
          ? _value.medicationTimes
          : medicationTimes // ignore: cast_nullable_to_non_nullable
              as Map<String, SubPurposeMedicationTimes>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SubPurposeStatus,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FileModel>>,
      isLoadingFiles: null == isLoadingFiles
          ? _value.isLoadingFiles
          : isLoadingFiles // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubPurposeStateImplCopyWith<$Res>
    implements $SubPurposeStateCopyWith<$Res> {
  factory _$$SubPurposeStateImplCopyWith(_$SubPurposeStateImpl value,
          $Res Function(_$SubPurposeStateImpl) then) =
      __$$SubPurposeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MedicineTakingModel> allPreparatsOfNaznachenie,
      Map<String, SubPurposeMedicationTimes> medicationTimes,
      SubPurposeStatus status,
      Map<String, List<FileModel>> files,
      bool isLoadingFiles});
}

/// @nodoc
class __$$SubPurposeStateImplCopyWithImpl<$Res>
    extends _$SubPurposeStateCopyWithImpl<$Res, _$SubPurposeStateImpl>
    implements _$$SubPurposeStateImplCopyWith<$Res> {
  __$$SubPurposeStateImplCopyWithImpl(
      _$SubPurposeStateImpl _value, $Res Function(_$SubPurposeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allPreparatsOfNaznachenie = null,
    Object? medicationTimes = null,
    Object? status = null,
    Object? files = null,
    Object? isLoadingFiles = null,
  }) {
    return _then(_$SubPurposeStateImpl(
      allPreparatsOfNaznachenie: null == allPreparatsOfNaznachenie
          ? _value._allPreparatsOfNaznachenie
          : allPreparatsOfNaznachenie // ignore: cast_nullable_to_non_nullable
              as List<MedicineTakingModel>,
      medicationTimes: null == medicationTimes
          ? _value._medicationTimes
          : medicationTimes // ignore: cast_nullable_to_non_nullable
              as Map<String, SubPurposeMedicationTimes>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SubPurposeStatus,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FileModel>>,
      isLoadingFiles: null == isLoadingFiles
          ? _value.isLoadingFiles
          : isLoadingFiles // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SubPurposeStateImpl implements _SubPurposeState {
  const _$SubPurposeStateImpl(
      {final List<MedicineTakingModel> allPreparatsOfNaznachenie = const [],
      final Map<String, SubPurposeMedicationTimes> medicationTimes = const {},
      this.status = SubPurposeStatus.inital,
      final Map<String, List<FileModel>> files = const {},
      this.isLoadingFiles = false})
      : _allPreparatsOfNaznachenie = allPreparatsOfNaznachenie,
        _medicationTimes = medicationTimes,
        _files = files;

  final List<MedicineTakingModel> _allPreparatsOfNaznachenie;
  @override
  @JsonKey()
  List<MedicineTakingModel> get allPreparatsOfNaznachenie {
    if (_allPreparatsOfNaznachenie is EqualUnmodifiableListView)
      return _allPreparatsOfNaznachenie;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allPreparatsOfNaznachenie);
  }

  final Map<String, SubPurposeMedicationTimes> _medicationTimes;
  @override
  @JsonKey()
  Map<String, SubPurposeMedicationTimes> get medicationTimes {
    if (_medicationTimes is EqualUnmodifiableMapView) return _medicationTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_medicationTimes);
  }

  @override
  @JsonKey()
  final SubPurposeStatus status;
  final Map<String, List<FileModel>> _files;
  @override
  @JsonKey()
  Map<String, List<FileModel>> get files {
    if (_files is EqualUnmodifiableMapView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_files);
  }

  @override
  @JsonKey()
  final bool isLoadingFiles;

  @override
  String toString() {
    return 'SubPurposeState(allPreparatsOfNaznachenie: $allPreparatsOfNaznachenie, medicationTimes: $medicationTimes, status: $status, files: $files, isLoadingFiles: $isLoadingFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubPurposeStateImpl &&
            const DeepCollectionEquality().equals(
                other._allPreparatsOfNaznachenie, _allPreparatsOfNaznachenie) &&
            const DeepCollectionEquality()
                .equals(other._medicationTimes, _medicationTimes) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.isLoadingFiles, isLoadingFiles) ||
                other.isLoadingFiles == isLoadingFiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allPreparatsOfNaznachenie),
      const DeepCollectionEquality().hash(_medicationTimes),
      status,
      const DeepCollectionEquality().hash(_files),
      isLoadingFiles);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubPurposeStateImplCopyWith<_$SubPurposeStateImpl> get copyWith =>
      __$$SubPurposeStateImplCopyWithImpl<_$SubPurposeStateImpl>(
          this, _$identity);
}

abstract class _SubPurposeState implements SubPurposeState {
  const factory _SubPurposeState(
      {final List<MedicineTakingModel> allPreparatsOfNaznachenie,
      final Map<String, SubPurposeMedicationTimes> medicationTimes,
      final SubPurposeStatus status,
      final Map<String, List<FileModel>> files,
      final bool isLoadingFiles}) = _$SubPurposeStateImpl;

  @override
  List<MedicineTakingModel> get allPreparatsOfNaznachenie;
  @override
  Map<String, SubPurposeMedicationTimes> get medicationTimes;
  @override
  SubPurposeStatus get status;
  @override
  Map<String, List<FileModel>> get files;
  @override
  bool get isLoadingFiles;
  @override
  @JsonKey(ignore: true)
  _$$SubPurposeStateImplCopyWith<_$SubPurposeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
