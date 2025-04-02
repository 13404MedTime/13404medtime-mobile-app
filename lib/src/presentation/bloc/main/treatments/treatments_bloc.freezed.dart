// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treatments_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TreatmentsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMedicineTakingMenu,
    required TResult Function() getMedicineTaking,
    required TResult Function() addMedicineTaking,
    required TResult Function(int index) deleteMedicine,
    required TResult Function() updateMedicineTaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMedicineTakingMenu,
    TResult? Function()? getMedicineTaking,
    TResult? Function()? addMedicineTaking,
    TResult? Function(int index)? deleteMedicine,
    TResult? Function()? updateMedicineTaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMedicineTakingMenu,
    TResult Function()? getMedicineTaking,
    TResult Function()? addMedicineTaking,
    TResult Function(int index)? deleteMedicine,
    TResult Function()? updateMedicineTaking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicineTakingMenuEvent value)
        getMedicineTakingMenu,
    required TResult Function(GetMedicineTakingEvent value) getMedicineTaking,
    required TResult Function(AddMedicineTakingEvent value) addMedicineTaking,
    required TResult Function(DeleteMedicineEvent value) deleteMedicine,
    required TResult Function(UpdateMedicineTakingEvent value)
        updateMedicineTaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult? Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult? Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult? Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult? Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentsEventCopyWith<$Res> {
  factory $TreatmentsEventCopyWith(
          TreatmentsEvent value, $Res Function(TreatmentsEvent) then) =
      _$TreatmentsEventCopyWithImpl<$Res, TreatmentsEvent>;
}

/// @nodoc
class _$TreatmentsEventCopyWithImpl<$Res, $Val extends TreatmentsEvent>
    implements $TreatmentsEventCopyWith<$Res> {
  _$TreatmentsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetMedicineTakingMenuEventImplCopyWith<$Res> {
  factory _$$GetMedicineTakingMenuEventImplCopyWith(
          _$GetMedicineTakingMenuEventImpl value,
          $Res Function(_$GetMedicineTakingMenuEventImpl) then) =
      __$$GetMedicineTakingMenuEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMedicineTakingMenuEventImplCopyWithImpl<$Res>
    extends _$TreatmentsEventCopyWithImpl<$Res,
        _$GetMedicineTakingMenuEventImpl>
    implements _$$GetMedicineTakingMenuEventImplCopyWith<$Res> {
  __$$GetMedicineTakingMenuEventImplCopyWithImpl(
      _$GetMedicineTakingMenuEventImpl _value,
      $Res Function(_$GetMedicineTakingMenuEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMedicineTakingMenuEventImpl
    with DiagnosticableTreeMixin
    implements GetMedicineTakingMenuEvent {
  const _$GetMedicineTakingMenuEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TreatmentsEvent.getMedicineTakingMenu()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'TreatmentsEvent.getMedicineTakingMenu'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMedicineTakingMenuEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMedicineTakingMenu,
    required TResult Function() getMedicineTaking,
    required TResult Function() addMedicineTaking,
    required TResult Function(int index) deleteMedicine,
    required TResult Function() updateMedicineTaking,
  }) {
    return getMedicineTakingMenu();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMedicineTakingMenu,
    TResult? Function()? getMedicineTaking,
    TResult? Function()? addMedicineTaking,
    TResult? Function(int index)? deleteMedicine,
    TResult? Function()? updateMedicineTaking,
  }) {
    return getMedicineTakingMenu?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMedicineTakingMenu,
    TResult Function()? getMedicineTaking,
    TResult Function()? addMedicineTaking,
    TResult Function(int index)? deleteMedicine,
    TResult Function()? updateMedicineTaking,
    required TResult orElse(),
  }) {
    if (getMedicineTakingMenu != null) {
      return getMedicineTakingMenu();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicineTakingMenuEvent value)
        getMedicineTakingMenu,
    required TResult Function(GetMedicineTakingEvent value) getMedicineTaking,
    required TResult Function(AddMedicineTakingEvent value) addMedicineTaking,
    required TResult Function(DeleteMedicineEvent value) deleteMedicine,
    required TResult Function(UpdateMedicineTakingEvent value)
        updateMedicineTaking,
  }) {
    return getMedicineTakingMenu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult? Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult? Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult? Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult? Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
  }) {
    return getMedicineTakingMenu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
    required TResult orElse(),
  }) {
    if (getMedicineTakingMenu != null) {
      return getMedicineTakingMenu(this);
    }
    return orElse();
  }
}

abstract class GetMedicineTakingMenuEvent implements TreatmentsEvent {
  const factory GetMedicineTakingMenuEvent() = _$GetMedicineTakingMenuEventImpl;
}

/// @nodoc
abstract class _$$GetMedicineTakingEventImplCopyWith<$Res> {
  factory _$$GetMedicineTakingEventImplCopyWith(
          _$GetMedicineTakingEventImpl value,
          $Res Function(_$GetMedicineTakingEventImpl) then) =
      __$$GetMedicineTakingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMedicineTakingEventImplCopyWithImpl<$Res>
    extends _$TreatmentsEventCopyWithImpl<$Res, _$GetMedicineTakingEventImpl>
    implements _$$GetMedicineTakingEventImplCopyWith<$Res> {
  __$$GetMedicineTakingEventImplCopyWithImpl(
      _$GetMedicineTakingEventImpl _value,
      $Res Function(_$GetMedicineTakingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMedicineTakingEventImpl
    with DiagnosticableTreeMixin
    implements GetMedicineTakingEvent {
  const _$GetMedicineTakingEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TreatmentsEvent.getMedicineTaking()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'TreatmentsEvent.getMedicineTaking'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMedicineTakingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMedicineTakingMenu,
    required TResult Function() getMedicineTaking,
    required TResult Function() addMedicineTaking,
    required TResult Function(int index) deleteMedicine,
    required TResult Function() updateMedicineTaking,
  }) {
    return getMedicineTaking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMedicineTakingMenu,
    TResult? Function()? getMedicineTaking,
    TResult? Function()? addMedicineTaking,
    TResult? Function(int index)? deleteMedicine,
    TResult? Function()? updateMedicineTaking,
  }) {
    return getMedicineTaking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMedicineTakingMenu,
    TResult Function()? getMedicineTaking,
    TResult Function()? addMedicineTaking,
    TResult Function(int index)? deleteMedicine,
    TResult Function()? updateMedicineTaking,
    required TResult orElse(),
  }) {
    if (getMedicineTaking != null) {
      return getMedicineTaking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicineTakingMenuEvent value)
        getMedicineTakingMenu,
    required TResult Function(GetMedicineTakingEvent value) getMedicineTaking,
    required TResult Function(AddMedicineTakingEvent value) addMedicineTaking,
    required TResult Function(DeleteMedicineEvent value) deleteMedicine,
    required TResult Function(UpdateMedicineTakingEvent value)
        updateMedicineTaking,
  }) {
    return getMedicineTaking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult? Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult? Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult? Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult? Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
  }) {
    return getMedicineTaking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
    required TResult orElse(),
  }) {
    if (getMedicineTaking != null) {
      return getMedicineTaking(this);
    }
    return orElse();
  }
}

abstract class GetMedicineTakingEvent implements TreatmentsEvent {
  const factory GetMedicineTakingEvent() = _$GetMedicineTakingEventImpl;
}

/// @nodoc
abstract class _$$AddMedicineTakingEventImplCopyWith<$Res> {
  factory _$$AddMedicineTakingEventImplCopyWith(
          _$AddMedicineTakingEventImpl value,
          $Res Function(_$AddMedicineTakingEventImpl) then) =
      __$$AddMedicineTakingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddMedicineTakingEventImplCopyWithImpl<$Res>
    extends _$TreatmentsEventCopyWithImpl<$Res, _$AddMedicineTakingEventImpl>
    implements _$$AddMedicineTakingEventImplCopyWith<$Res> {
  __$$AddMedicineTakingEventImplCopyWithImpl(
      _$AddMedicineTakingEventImpl _value,
      $Res Function(_$AddMedicineTakingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddMedicineTakingEventImpl
    with DiagnosticableTreeMixin
    implements AddMedicineTakingEvent {
  const _$AddMedicineTakingEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TreatmentsEvent.addMedicineTaking()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'TreatmentsEvent.addMedicineTaking'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMedicineTakingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMedicineTakingMenu,
    required TResult Function() getMedicineTaking,
    required TResult Function() addMedicineTaking,
    required TResult Function(int index) deleteMedicine,
    required TResult Function() updateMedicineTaking,
  }) {
    return addMedicineTaking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMedicineTakingMenu,
    TResult? Function()? getMedicineTaking,
    TResult? Function()? addMedicineTaking,
    TResult? Function(int index)? deleteMedicine,
    TResult? Function()? updateMedicineTaking,
  }) {
    return addMedicineTaking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMedicineTakingMenu,
    TResult Function()? getMedicineTaking,
    TResult Function()? addMedicineTaking,
    TResult Function(int index)? deleteMedicine,
    TResult Function()? updateMedicineTaking,
    required TResult orElse(),
  }) {
    if (addMedicineTaking != null) {
      return addMedicineTaking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicineTakingMenuEvent value)
        getMedicineTakingMenu,
    required TResult Function(GetMedicineTakingEvent value) getMedicineTaking,
    required TResult Function(AddMedicineTakingEvent value) addMedicineTaking,
    required TResult Function(DeleteMedicineEvent value) deleteMedicine,
    required TResult Function(UpdateMedicineTakingEvent value)
        updateMedicineTaking,
  }) {
    return addMedicineTaking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult? Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult? Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult? Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult? Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
  }) {
    return addMedicineTaking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
    required TResult orElse(),
  }) {
    if (addMedicineTaking != null) {
      return addMedicineTaking(this);
    }
    return orElse();
  }
}

abstract class AddMedicineTakingEvent implements TreatmentsEvent {
  const factory AddMedicineTakingEvent() = _$AddMedicineTakingEventImpl;
}

/// @nodoc
abstract class _$$DeleteMedicineEventImplCopyWith<$Res> {
  factory _$$DeleteMedicineEventImplCopyWith(_$DeleteMedicineEventImpl value,
          $Res Function(_$DeleteMedicineEventImpl) then) =
      __$$DeleteMedicineEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$DeleteMedicineEventImplCopyWithImpl<$Res>
    extends _$TreatmentsEventCopyWithImpl<$Res, _$DeleteMedicineEventImpl>
    implements _$$DeleteMedicineEventImplCopyWith<$Res> {
  __$$DeleteMedicineEventImplCopyWithImpl(_$DeleteMedicineEventImpl _value,
      $Res Function(_$DeleteMedicineEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$DeleteMedicineEventImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteMedicineEventImpl
    with DiagnosticableTreeMixin
    implements DeleteMedicineEvent {
  const _$DeleteMedicineEventImpl(this.index);

  @override
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TreatmentsEvent.deleteMedicine(index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TreatmentsEvent.deleteMedicine'))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMedicineEventImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMedicineEventImplCopyWith<_$DeleteMedicineEventImpl> get copyWith =>
      __$$DeleteMedicineEventImplCopyWithImpl<_$DeleteMedicineEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMedicineTakingMenu,
    required TResult Function() getMedicineTaking,
    required TResult Function() addMedicineTaking,
    required TResult Function(int index) deleteMedicine,
    required TResult Function() updateMedicineTaking,
  }) {
    return deleteMedicine(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMedicineTakingMenu,
    TResult? Function()? getMedicineTaking,
    TResult? Function()? addMedicineTaking,
    TResult? Function(int index)? deleteMedicine,
    TResult? Function()? updateMedicineTaking,
  }) {
    return deleteMedicine?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMedicineTakingMenu,
    TResult Function()? getMedicineTaking,
    TResult Function()? addMedicineTaking,
    TResult Function(int index)? deleteMedicine,
    TResult Function()? updateMedicineTaking,
    required TResult orElse(),
  }) {
    if (deleteMedicine != null) {
      return deleteMedicine(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicineTakingMenuEvent value)
        getMedicineTakingMenu,
    required TResult Function(GetMedicineTakingEvent value) getMedicineTaking,
    required TResult Function(AddMedicineTakingEvent value) addMedicineTaking,
    required TResult Function(DeleteMedicineEvent value) deleteMedicine,
    required TResult Function(UpdateMedicineTakingEvent value)
        updateMedicineTaking,
  }) {
    return deleteMedicine(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult? Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult? Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult? Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult? Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
  }) {
    return deleteMedicine?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
    required TResult orElse(),
  }) {
    if (deleteMedicine != null) {
      return deleteMedicine(this);
    }
    return orElse();
  }
}

abstract class DeleteMedicineEvent implements TreatmentsEvent {
  const factory DeleteMedicineEvent(final int index) =
      _$DeleteMedicineEventImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$DeleteMedicineEventImplCopyWith<_$DeleteMedicineEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateMedicineTakingEventImplCopyWith<$Res> {
  factory _$$UpdateMedicineTakingEventImplCopyWith(
          _$UpdateMedicineTakingEventImpl value,
          $Res Function(_$UpdateMedicineTakingEventImpl) then) =
      __$$UpdateMedicineTakingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateMedicineTakingEventImplCopyWithImpl<$Res>
    extends _$TreatmentsEventCopyWithImpl<$Res, _$UpdateMedicineTakingEventImpl>
    implements _$$UpdateMedicineTakingEventImplCopyWith<$Res> {
  __$$UpdateMedicineTakingEventImplCopyWithImpl(
      _$UpdateMedicineTakingEventImpl _value,
      $Res Function(_$UpdateMedicineTakingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateMedicineTakingEventImpl
    with DiagnosticableTreeMixin
    implements UpdateMedicineTakingEvent {
  const _$UpdateMedicineTakingEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TreatmentsEvent.updateMedicineTaking()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'TreatmentsEvent.updateMedicineTaking'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMedicineTakingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMedicineTakingMenu,
    required TResult Function() getMedicineTaking,
    required TResult Function() addMedicineTaking,
    required TResult Function(int index) deleteMedicine,
    required TResult Function() updateMedicineTaking,
  }) {
    return updateMedicineTaking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMedicineTakingMenu,
    TResult? Function()? getMedicineTaking,
    TResult? Function()? addMedicineTaking,
    TResult? Function(int index)? deleteMedicine,
    TResult? Function()? updateMedicineTaking,
  }) {
    return updateMedicineTaking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMedicineTakingMenu,
    TResult Function()? getMedicineTaking,
    TResult Function()? addMedicineTaking,
    TResult Function(int index)? deleteMedicine,
    TResult Function()? updateMedicineTaking,
    required TResult orElse(),
  }) {
    if (updateMedicineTaking != null) {
      return updateMedicineTaking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMedicineTakingMenuEvent value)
        getMedicineTakingMenu,
    required TResult Function(GetMedicineTakingEvent value) getMedicineTaking,
    required TResult Function(AddMedicineTakingEvent value) addMedicineTaking,
    required TResult Function(DeleteMedicineEvent value) deleteMedicine,
    required TResult Function(UpdateMedicineTakingEvent value)
        updateMedicineTaking,
  }) {
    return updateMedicineTaking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult? Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult? Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult? Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult? Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
  }) {
    return updateMedicineTaking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMedicineTakingMenuEvent value)? getMedicineTakingMenu,
    TResult Function(GetMedicineTakingEvent value)? getMedicineTaking,
    TResult Function(AddMedicineTakingEvent value)? addMedicineTaking,
    TResult Function(DeleteMedicineEvent value)? deleteMedicine,
    TResult Function(UpdateMedicineTakingEvent value)? updateMedicineTaking,
    required TResult orElse(),
  }) {
    if (updateMedicineTaking != null) {
      return updateMedicineTaking(this);
    }
    return orElse();
  }
}

abstract class UpdateMedicineTakingEvent implements TreatmentsEvent {
  const factory UpdateMedicineTakingEvent() = _$UpdateMedicineTakingEventImpl;
}
