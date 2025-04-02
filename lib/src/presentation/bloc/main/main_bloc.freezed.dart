// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainEvent {
  BottomMenu get menu => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BottomMenu menu) onChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BottomMenu menu)? onChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BottomMenu menu)? onChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainEventChanged value) onChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainEventChanged value)? onChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainEventChanged value)? onChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainEventCopyWith<MainEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainEventCopyWith<$Res> {
  factory $MainEventCopyWith(MainEvent value, $Res Function(MainEvent) then) =
      _$MainEventCopyWithImpl<$Res, MainEvent>;
  @useResult
  $Res call({BottomMenu menu});
}

/// @nodoc
class _$MainEventCopyWithImpl<$Res, $Val extends MainEvent>
    implements $MainEventCopyWith<$Res> {
  _$MainEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
  }) {
    return _then(_value.copyWith(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as BottomMenu,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainEventChangedImplCopyWith<$Res>
    implements $MainEventCopyWith<$Res> {
  factory _$$MainEventChangedImplCopyWith(_$MainEventChangedImpl value,
          $Res Function(_$MainEventChangedImpl) then) =
      __$$MainEventChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BottomMenu menu});
}

/// @nodoc
class __$$MainEventChangedImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$MainEventChangedImpl>
    implements _$$MainEventChangedImplCopyWith<$Res> {
  __$$MainEventChangedImplCopyWithImpl(_$MainEventChangedImpl _value,
      $Res Function(_$MainEventChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
  }) {
    return _then(_$MainEventChangedImpl(
      null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as BottomMenu,
    ));
  }
}

/// @nodoc

class _$MainEventChangedImpl implements MainEventChanged {
  const _$MainEventChangedImpl(this.menu);

  @override
  final BottomMenu menu;

  @override
  String toString() {
    return 'MainEvent.onChanged(menu: $menu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainEventChangedImpl &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @override
  int get hashCode => Object.hash(runtimeType, menu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainEventChangedImplCopyWith<_$MainEventChangedImpl> get copyWith =>
      __$$MainEventChangedImplCopyWithImpl<_$MainEventChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BottomMenu menu) onChanged,
  }) {
    return onChanged(menu);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BottomMenu menu)? onChanged,
  }) {
    return onChanged?.call(menu);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BottomMenu menu)? onChanged,
    required TResult orElse(),
  }) {
    if (onChanged != null) {
      return onChanged(menu);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainEventChanged value) onChanged,
  }) {
    return onChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainEventChanged value)? onChanged,
  }) {
    return onChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainEventChanged value)? onChanged,
    required TResult orElse(),
  }) {
    if (onChanged != null) {
      return onChanged(this);
    }
    return orElse();
  }
}

abstract class MainEventChanged implements MainEvent {
  const factory MainEventChanged(final BottomMenu menu) =
      _$MainEventChangedImpl;

  @override
  BottomMenu get menu;
  @override
  @JsonKey(ignore: true)
  _$$MainEventChangedImplCopyWith<_$MainEventChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
