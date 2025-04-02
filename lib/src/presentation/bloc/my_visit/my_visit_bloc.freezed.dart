// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_visit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyVisitEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String guid) getVisit,
    required TResult Function() checkConsultationDays,
    required TResult Function(String guid) getDoctorFreeTime,
    required TResult Function(DateTime selectedDate) getSelectedDate,
    required TResult Function(DoctorBooking freeTime) selectFreeTime,
    required TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)
        bookDoctor,
    required TResult Function() getDoctorBookingRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String guid)? getVisit,
    TResult? Function()? checkConsultationDays,
    TResult? Function(String guid)? getDoctorFreeTime,
    TResult? Function(DateTime selectedDate)? getSelectedDate,
    TResult? Function(DoctorBooking freeTime)? selectFreeTime,
    TResult? Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult? Function()? getDoctorBookingRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String guid)? getVisit,
    TResult Function()? checkConsultationDays,
    TResult Function(String guid)? getDoctorFreeTime,
    TResult Function(DateTime selectedDate)? getSelectedDate,
    TResult Function(DoctorBooking freeTime)? selectFreeTime,
    TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult Function()? getDoctorBookingRequests,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetVisitEvent value) getVisit,
    required TResult Function(CheckConsultationDaysEvent value)
        checkConsultationDays,
    required TResult Function(GetDoctorFreeTimeEvent value) getDoctorFreeTime,
    required TResult Function(GetSelectedDateEvent value) getSelectedDate,
    required TResult Function(SelectFreeTime value) selectFreeTime,
    required TResult Function(BookDoctorEvent value) bookDoctor,
    required TResult Function(GetDoctorBookingRequestsEvent value)
        getDoctorBookingRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetVisitEvent value)? getVisit,
    TResult? Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult? Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult? Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult? Function(SelectFreeTime value)? selectFreeTime,
    TResult? Function(BookDoctorEvent value)? bookDoctor,
    TResult? Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetVisitEvent value)? getVisit,
    TResult Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult Function(SelectFreeTime value)? selectFreeTime,
    TResult Function(BookDoctorEvent value)? bookDoctor,
    TResult Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyVisitEventCopyWith<$Res> {
  factory $MyVisitEventCopyWith(
          MyVisitEvent value, $Res Function(MyVisitEvent) then) =
      _$MyVisitEventCopyWithImpl<$Res, MyVisitEvent>;
}

/// @nodoc
class _$MyVisitEventCopyWithImpl<$Res, $Val extends MyVisitEvent>
    implements $MyVisitEventCopyWith<$Res> {
  _$MyVisitEventCopyWithImpl(this._value, this._then);

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
    extends _$MyVisitEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'MyVisitEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MyVisitEvent.started'));
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
    required TResult Function(String guid) getVisit,
    required TResult Function() checkConsultationDays,
    required TResult Function(String guid) getDoctorFreeTime,
    required TResult Function(DateTime selectedDate) getSelectedDate,
    required TResult Function(DoctorBooking freeTime) selectFreeTime,
    required TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)
        bookDoctor,
    required TResult Function() getDoctorBookingRequests,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String guid)? getVisit,
    TResult? Function()? checkConsultationDays,
    TResult? Function(String guid)? getDoctorFreeTime,
    TResult? Function(DateTime selectedDate)? getSelectedDate,
    TResult? Function(DoctorBooking freeTime)? selectFreeTime,
    TResult? Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult? Function()? getDoctorBookingRequests,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String guid)? getVisit,
    TResult Function()? checkConsultationDays,
    TResult Function(String guid)? getDoctorFreeTime,
    TResult Function(DateTime selectedDate)? getSelectedDate,
    TResult Function(DoctorBooking freeTime)? selectFreeTime,
    TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult Function()? getDoctorBookingRequests,
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
    required TResult Function(GetVisitEvent value) getVisit,
    required TResult Function(CheckConsultationDaysEvent value)
        checkConsultationDays,
    required TResult Function(GetDoctorFreeTimeEvent value) getDoctorFreeTime,
    required TResult Function(GetSelectedDateEvent value) getSelectedDate,
    required TResult Function(SelectFreeTime value) selectFreeTime,
    required TResult Function(BookDoctorEvent value) bookDoctor,
    required TResult Function(GetDoctorBookingRequestsEvent value)
        getDoctorBookingRequests,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetVisitEvent value)? getVisit,
    TResult? Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult? Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult? Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult? Function(SelectFreeTime value)? selectFreeTime,
    TResult? Function(BookDoctorEvent value)? bookDoctor,
    TResult? Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetVisitEvent value)? getVisit,
    TResult Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult Function(SelectFreeTime value)? selectFreeTime,
    TResult Function(BookDoctorEvent value)? bookDoctor,
    TResult Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements MyVisitEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetVisitEventImplCopyWith<$Res> {
  factory _$$GetVisitEventImplCopyWith(
          _$GetVisitEventImpl value, $Res Function(_$GetVisitEventImpl) then) =
      __$$GetVisitEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String guid});
}

/// @nodoc
class __$$GetVisitEventImplCopyWithImpl<$Res>
    extends _$MyVisitEventCopyWithImpl<$Res, _$GetVisitEventImpl>
    implements _$$GetVisitEventImplCopyWith<$Res> {
  __$$GetVisitEventImplCopyWithImpl(
      _$GetVisitEventImpl _value, $Res Function(_$GetVisitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = null,
  }) {
    return _then(_$GetVisitEventImpl(
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetVisitEventImpl
    with DiagnosticableTreeMixin
    implements GetVisitEvent {
  const _$GetVisitEventImpl({required this.guid});

  @override
  final String guid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyVisitEvent.getVisit(guid: $guid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyVisitEvent.getVisit'))
      ..add(DiagnosticsProperty('guid', guid));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetVisitEventImpl &&
            (identical(other.guid, guid) || other.guid == guid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, guid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetVisitEventImplCopyWith<_$GetVisitEventImpl> get copyWith =>
      __$$GetVisitEventImplCopyWithImpl<_$GetVisitEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String guid) getVisit,
    required TResult Function() checkConsultationDays,
    required TResult Function(String guid) getDoctorFreeTime,
    required TResult Function(DateTime selectedDate) getSelectedDate,
    required TResult Function(DoctorBooking freeTime) selectFreeTime,
    required TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)
        bookDoctor,
    required TResult Function() getDoctorBookingRequests,
  }) {
    return getVisit(guid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String guid)? getVisit,
    TResult? Function()? checkConsultationDays,
    TResult? Function(String guid)? getDoctorFreeTime,
    TResult? Function(DateTime selectedDate)? getSelectedDate,
    TResult? Function(DoctorBooking freeTime)? selectFreeTime,
    TResult? Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult? Function()? getDoctorBookingRequests,
  }) {
    return getVisit?.call(guid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String guid)? getVisit,
    TResult Function()? checkConsultationDays,
    TResult Function(String guid)? getDoctorFreeTime,
    TResult Function(DateTime selectedDate)? getSelectedDate,
    TResult Function(DoctorBooking freeTime)? selectFreeTime,
    TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult Function()? getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (getVisit != null) {
      return getVisit(guid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetVisitEvent value) getVisit,
    required TResult Function(CheckConsultationDaysEvent value)
        checkConsultationDays,
    required TResult Function(GetDoctorFreeTimeEvent value) getDoctorFreeTime,
    required TResult Function(GetSelectedDateEvent value) getSelectedDate,
    required TResult Function(SelectFreeTime value) selectFreeTime,
    required TResult Function(BookDoctorEvent value) bookDoctor,
    required TResult Function(GetDoctorBookingRequestsEvent value)
        getDoctorBookingRequests,
  }) {
    return getVisit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetVisitEvent value)? getVisit,
    TResult? Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult? Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult? Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult? Function(SelectFreeTime value)? selectFreeTime,
    TResult? Function(BookDoctorEvent value)? bookDoctor,
    TResult? Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
  }) {
    return getVisit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetVisitEvent value)? getVisit,
    TResult Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult Function(SelectFreeTime value)? selectFreeTime,
    TResult Function(BookDoctorEvent value)? bookDoctor,
    TResult Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (getVisit != null) {
      return getVisit(this);
    }
    return orElse();
  }
}

abstract class GetVisitEvent implements MyVisitEvent {
  const factory GetVisitEvent({required final String guid}) =
      _$GetVisitEventImpl;

  String get guid;
  @JsonKey(ignore: true)
  _$$GetVisitEventImplCopyWith<_$GetVisitEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckConsultationDaysEventImplCopyWith<$Res> {
  factory _$$CheckConsultationDaysEventImplCopyWith(
          _$CheckConsultationDaysEventImpl value,
          $Res Function(_$CheckConsultationDaysEventImpl) then) =
      __$$CheckConsultationDaysEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckConsultationDaysEventImplCopyWithImpl<$Res>
    extends _$MyVisitEventCopyWithImpl<$Res, _$CheckConsultationDaysEventImpl>
    implements _$$CheckConsultationDaysEventImplCopyWith<$Res> {
  __$$CheckConsultationDaysEventImplCopyWithImpl(
      _$CheckConsultationDaysEventImpl _value,
      $Res Function(_$CheckConsultationDaysEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckConsultationDaysEventImpl
    with DiagnosticableTreeMixin
    implements CheckConsultationDaysEvent {
  const _$CheckConsultationDaysEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyVisitEvent.checkConsultationDays()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'MyVisitEvent.checkConsultationDays'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckConsultationDaysEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String guid) getVisit,
    required TResult Function() checkConsultationDays,
    required TResult Function(String guid) getDoctorFreeTime,
    required TResult Function(DateTime selectedDate) getSelectedDate,
    required TResult Function(DoctorBooking freeTime) selectFreeTime,
    required TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)
        bookDoctor,
    required TResult Function() getDoctorBookingRequests,
  }) {
    return checkConsultationDays();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String guid)? getVisit,
    TResult? Function()? checkConsultationDays,
    TResult? Function(String guid)? getDoctorFreeTime,
    TResult? Function(DateTime selectedDate)? getSelectedDate,
    TResult? Function(DoctorBooking freeTime)? selectFreeTime,
    TResult? Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult? Function()? getDoctorBookingRequests,
  }) {
    return checkConsultationDays?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String guid)? getVisit,
    TResult Function()? checkConsultationDays,
    TResult Function(String guid)? getDoctorFreeTime,
    TResult Function(DateTime selectedDate)? getSelectedDate,
    TResult Function(DoctorBooking freeTime)? selectFreeTime,
    TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult Function()? getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (checkConsultationDays != null) {
      return checkConsultationDays();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetVisitEvent value) getVisit,
    required TResult Function(CheckConsultationDaysEvent value)
        checkConsultationDays,
    required TResult Function(GetDoctorFreeTimeEvent value) getDoctorFreeTime,
    required TResult Function(GetSelectedDateEvent value) getSelectedDate,
    required TResult Function(SelectFreeTime value) selectFreeTime,
    required TResult Function(BookDoctorEvent value) bookDoctor,
    required TResult Function(GetDoctorBookingRequestsEvent value)
        getDoctorBookingRequests,
  }) {
    return checkConsultationDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetVisitEvent value)? getVisit,
    TResult? Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult? Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult? Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult? Function(SelectFreeTime value)? selectFreeTime,
    TResult? Function(BookDoctorEvent value)? bookDoctor,
    TResult? Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
  }) {
    return checkConsultationDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetVisitEvent value)? getVisit,
    TResult Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult Function(SelectFreeTime value)? selectFreeTime,
    TResult Function(BookDoctorEvent value)? bookDoctor,
    TResult Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (checkConsultationDays != null) {
      return checkConsultationDays(this);
    }
    return orElse();
  }
}

abstract class CheckConsultationDaysEvent implements MyVisitEvent {
  const factory CheckConsultationDaysEvent() = _$CheckConsultationDaysEventImpl;
}

/// @nodoc
abstract class _$$GetDoctorFreeTimeEventImplCopyWith<$Res> {
  factory _$$GetDoctorFreeTimeEventImplCopyWith(
          _$GetDoctorFreeTimeEventImpl value,
          $Res Function(_$GetDoctorFreeTimeEventImpl) then) =
      __$$GetDoctorFreeTimeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String guid});
}

/// @nodoc
class __$$GetDoctorFreeTimeEventImplCopyWithImpl<$Res>
    extends _$MyVisitEventCopyWithImpl<$Res, _$GetDoctorFreeTimeEventImpl>
    implements _$$GetDoctorFreeTimeEventImplCopyWith<$Res> {
  __$$GetDoctorFreeTimeEventImplCopyWithImpl(
      _$GetDoctorFreeTimeEventImpl _value,
      $Res Function(_$GetDoctorFreeTimeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = null,
  }) {
    return _then(_$GetDoctorFreeTimeEventImpl(
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetDoctorFreeTimeEventImpl
    with DiagnosticableTreeMixin
    implements GetDoctorFreeTimeEvent {
  const _$GetDoctorFreeTimeEventImpl({required this.guid});

  @override
  final String guid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyVisitEvent.getDoctorFreeTime(guid: $guid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyVisitEvent.getDoctorFreeTime'))
      ..add(DiagnosticsProperty('guid', guid));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDoctorFreeTimeEventImpl &&
            (identical(other.guid, guid) || other.guid == guid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, guid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDoctorFreeTimeEventImplCopyWith<_$GetDoctorFreeTimeEventImpl>
      get copyWith => __$$GetDoctorFreeTimeEventImplCopyWithImpl<
          _$GetDoctorFreeTimeEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String guid) getVisit,
    required TResult Function() checkConsultationDays,
    required TResult Function(String guid) getDoctorFreeTime,
    required TResult Function(DateTime selectedDate) getSelectedDate,
    required TResult Function(DoctorBooking freeTime) selectFreeTime,
    required TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)
        bookDoctor,
    required TResult Function() getDoctorBookingRequests,
  }) {
    return getDoctorFreeTime(guid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String guid)? getVisit,
    TResult? Function()? checkConsultationDays,
    TResult? Function(String guid)? getDoctorFreeTime,
    TResult? Function(DateTime selectedDate)? getSelectedDate,
    TResult? Function(DoctorBooking freeTime)? selectFreeTime,
    TResult? Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult? Function()? getDoctorBookingRequests,
  }) {
    return getDoctorFreeTime?.call(guid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String guid)? getVisit,
    TResult Function()? checkConsultationDays,
    TResult Function(String guid)? getDoctorFreeTime,
    TResult Function(DateTime selectedDate)? getSelectedDate,
    TResult Function(DoctorBooking freeTime)? selectFreeTime,
    TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult Function()? getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (getDoctorFreeTime != null) {
      return getDoctorFreeTime(guid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetVisitEvent value) getVisit,
    required TResult Function(CheckConsultationDaysEvent value)
        checkConsultationDays,
    required TResult Function(GetDoctorFreeTimeEvent value) getDoctorFreeTime,
    required TResult Function(GetSelectedDateEvent value) getSelectedDate,
    required TResult Function(SelectFreeTime value) selectFreeTime,
    required TResult Function(BookDoctorEvent value) bookDoctor,
    required TResult Function(GetDoctorBookingRequestsEvent value)
        getDoctorBookingRequests,
  }) {
    return getDoctorFreeTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetVisitEvent value)? getVisit,
    TResult? Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult? Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult? Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult? Function(SelectFreeTime value)? selectFreeTime,
    TResult? Function(BookDoctorEvent value)? bookDoctor,
    TResult? Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
  }) {
    return getDoctorFreeTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetVisitEvent value)? getVisit,
    TResult Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult Function(SelectFreeTime value)? selectFreeTime,
    TResult Function(BookDoctorEvent value)? bookDoctor,
    TResult Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (getDoctorFreeTime != null) {
      return getDoctorFreeTime(this);
    }
    return orElse();
  }
}

abstract class GetDoctorFreeTimeEvent implements MyVisitEvent {
  const factory GetDoctorFreeTimeEvent({required final String guid}) =
      _$GetDoctorFreeTimeEventImpl;

  String get guid;
  @JsonKey(ignore: true)
  _$$GetDoctorFreeTimeEventImplCopyWith<_$GetDoctorFreeTimeEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSelectedDateEventImplCopyWith<$Res> {
  factory _$$GetSelectedDateEventImplCopyWith(_$GetSelectedDateEventImpl value,
          $Res Function(_$GetSelectedDateEventImpl) then) =
      __$$GetSelectedDateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime selectedDate});
}

/// @nodoc
class __$$GetSelectedDateEventImplCopyWithImpl<$Res>
    extends _$MyVisitEventCopyWithImpl<$Res, _$GetSelectedDateEventImpl>
    implements _$$GetSelectedDateEventImplCopyWith<$Res> {
  __$$GetSelectedDateEventImplCopyWithImpl(_$GetSelectedDateEventImpl _value,
      $Res Function(_$GetSelectedDateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
  }) {
    return _then(_$GetSelectedDateEventImpl(
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GetSelectedDateEventImpl
    with DiagnosticableTreeMixin
    implements GetSelectedDateEvent {
  const _$GetSelectedDateEventImpl({required this.selectedDate});

  @override
  final DateTime selectedDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyVisitEvent.getSelectedDate(selectedDate: $selectedDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyVisitEvent.getSelectedDate'))
      ..add(DiagnosticsProperty('selectedDate', selectedDate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSelectedDateEventImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSelectedDateEventImplCopyWith<_$GetSelectedDateEventImpl>
      get copyWith =>
          __$$GetSelectedDateEventImplCopyWithImpl<_$GetSelectedDateEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String guid) getVisit,
    required TResult Function() checkConsultationDays,
    required TResult Function(String guid) getDoctorFreeTime,
    required TResult Function(DateTime selectedDate) getSelectedDate,
    required TResult Function(DoctorBooking freeTime) selectFreeTime,
    required TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)
        bookDoctor,
    required TResult Function() getDoctorBookingRequests,
  }) {
    return getSelectedDate(selectedDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String guid)? getVisit,
    TResult? Function()? checkConsultationDays,
    TResult? Function(String guid)? getDoctorFreeTime,
    TResult? Function(DateTime selectedDate)? getSelectedDate,
    TResult? Function(DoctorBooking freeTime)? selectFreeTime,
    TResult? Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult? Function()? getDoctorBookingRequests,
  }) {
    return getSelectedDate?.call(selectedDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String guid)? getVisit,
    TResult Function()? checkConsultationDays,
    TResult Function(String guid)? getDoctorFreeTime,
    TResult Function(DateTime selectedDate)? getSelectedDate,
    TResult Function(DoctorBooking freeTime)? selectFreeTime,
    TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult Function()? getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (getSelectedDate != null) {
      return getSelectedDate(selectedDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetVisitEvent value) getVisit,
    required TResult Function(CheckConsultationDaysEvent value)
        checkConsultationDays,
    required TResult Function(GetDoctorFreeTimeEvent value) getDoctorFreeTime,
    required TResult Function(GetSelectedDateEvent value) getSelectedDate,
    required TResult Function(SelectFreeTime value) selectFreeTime,
    required TResult Function(BookDoctorEvent value) bookDoctor,
    required TResult Function(GetDoctorBookingRequestsEvent value)
        getDoctorBookingRequests,
  }) {
    return getSelectedDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetVisitEvent value)? getVisit,
    TResult? Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult? Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult? Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult? Function(SelectFreeTime value)? selectFreeTime,
    TResult? Function(BookDoctorEvent value)? bookDoctor,
    TResult? Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
  }) {
    return getSelectedDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetVisitEvent value)? getVisit,
    TResult Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult Function(SelectFreeTime value)? selectFreeTime,
    TResult Function(BookDoctorEvent value)? bookDoctor,
    TResult Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (getSelectedDate != null) {
      return getSelectedDate(this);
    }
    return orElse();
  }
}

abstract class GetSelectedDateEvent implements MyVisitEvent {
  const factory GetSelectedDateEvent({required final DateTime selectedDate}) =
      _$GetSelectedDateEventImpl;

  DateTime get selectedDate;
  @JsonKey(ignore: true)
  _$$GetSelectedDateEventImplCopyWith<_$GetSelectedDateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectFreeTimeImplCopyWith<$Res> {
  factory _$$SelectFreeTimeImplCopyWith(_$SelectFreeTimeImpl value,
          $Res Function(_$SelectFreeTimeImpl) then) =
      __$$SelectFreeTimeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DoctorBooking freeTime});
}

/// @nodoc
class __$$SelectFreeTimeImplCopyWithImpl<$Res>
    extends _$MyVisitEventCopyWithImpl<$Res, _$SelectFreeTimeImpl>
    implements _$$SelectFreeTimeImplCopyWith<$Res> {
  __$$SelectFreeTimeImplCopyWithImpl(
      _$SelectFreeTimeImpl _value, $Res Function(_$SelectFreeTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? freeTime = null,
  }) {
    return _then(_$SelectFreeTimeImpl(
      freeTime: null == freeTime
          ? _value.freeTime
          : freeTime // ignore: cast_nullable_to_non_nullable
              as DoctorBooking,
    ));
  }
}

/// @nodoc

class _$SelectFreeTimeImpl
    with DiagnosticableTreeMixin
    implements SelectFreeTime {
  const _$SelectFreeTimeImpl({required this.freeTime});

  @override
  final DoctorBooking freeTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyVisitEvent.selectFreeTime(freeTime: $freeTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyVisitEvent.selectFreeTime'))
      ..add(DiagnosticsProperty('freeTime', freeTime));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectFreeTimeImpl &&
            (identical(other.freeTime, freeTime) ||
                other.freeTime == freeTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, freeTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectFreeTimeImplCopyWith<_$SelectFreeTimeImpl> get copyWith =>
      __$$SelectFreeTimeImplCopyWithImpl<_$SelectFreeTimeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String guid) getVisit,
    required TResult Function() checkConsultationDays,
    required TResult Function(String guid) getDoctorFreeTime,
    required TResult Function(DateTime selectedDate) getSelectedDate,
    required TResult Function(DoctorBooking freeTime) selectFreeTime,
    required TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)
        bookDoctor,
    required TResult Function() getDoctorBookingRequests,
  }) {
    return selectFreeTime(freeTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String guid)? getVisit,
    TResult? Function()? checkConsultationDays,
    TResult? Function(String guid)? getDoctorFreeTime,
    TResult? Function(DateTime selectedDate)? getSelectedDate,
    TResult? Function(DoctorBooking freeTime)? selectFreeTime,
    TResult? Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult? Function()? getDoctorBookingRequests,
  }) {
    return selectFreeTime?.call(freeTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String guid)? getVisit,
    TResult Function()? checkConsultationDays,
    TResult Function(String guid)? getDoctorFreeTime,
    TResult Function(DateTime selectedDate)? getSelectedDate,
    TResult Function(DoctorBooking freeTime)? selectFreeTime,
    TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult Function()? getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (selectFreeTime != null) {
      return selectFreeTime(freeTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetVisitEvent value) getVisit,
    required TResult Function(CheckConsultationDaysEvent value)
        checkConsultationDays,
    required TResult Function(GetDoctorFreeTimeEvent value) getDoctorFreeTime,
    required TResult Function(GetSelectedDateEvent value) getSelectedDate,
    required TResult Function(SelectFreeTime value) selectFreeTime,
    required TResult Function(BookDoctorEvent value) bookDoctor,
    required TResult Function(GetDoctorBookingRequestsEvent value)
        getDoctorBookingRequests,
  }) {
    return selectFreeTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetVisitEvent value)? getVisit,
    TResult? Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult? Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult? Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult? Function(SelectFreeTime value)? selectFreeTime,
    TResult? Function(BookDoctorEvent value)? bookDoctor,
    TResult? Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
  }) {
    return selectFreeTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetVisitEvent value)? getVisit,
    TResult Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult Function(SelectFreeTime value)? selectFreeTime,
    TResult Function(BookDoctorEvent value)? bookDoctor,
    TResult Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (selectFreeTime != null) {
      return selectFreeTime(this);
    }
    return orElse();
  }
}

abstract class SelectFreeTime implements MyVisitEvent {
  const factory SelectFreeTime({required final DoctorBooking freeTime}) =
      _$SelectFreeTimeImpl;

  DoctorBooking get freeTime;
  @JsonKey(ignore: true)
  _$$SelectFreeTimeImplCopyWith<_$SelectFreeTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookDoctorEventImplCopyWith<$Res> {
  factory _$$BookDoctorEventImplCopyWith(_$BookDoctorEventImpl value,
          $Res Function(_$BookDoctorEventImpl) then) =
      __$$BookDoctorEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String doctorBookingGuid,
      String comment,
      String doctorGuid,
      BuildContext context});
}

/// @nodoc
class __$$BookDoctorEventImplCopyWithImpl<$Res>
    extends _$MyVisitEventCopyWithImpl<$Res, _$BookDoctorEventImpl>
    implements _$$BookDoctorEventImplCopyWith<$Res> {
  __$$BookDoctorEventImplCopyWithImpl(
      _$BookDoctorEventImpl _value, $Res Function(_$BookDoctorEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorBookingGuid = null,
    Object? comment = null,
    Object? doctorGuid = null,
    Object? context = null,
  }) {
    return _then(_$BookDoctorEventImpl(
      doctorBookingGuid: null == doctorBookingGuid
          ? _value.doctorBookingGuid
          : doctorBookingGuid // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      doctorGuid: null == doctorGuid
          ? _value.doctorGuid
          : doctorGuid // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$BookDoctorEventImpl
    with DiagnosticableTreeMixin
    implements BookDoctorEvent {
  const _$BookDoctorEventImpl(
      {required this.doctorBookingGuid,
      required this.comment,
      required this.doctorGuid,
      required this.context});

  @override
  final String doctorBookingGuid;
  @override
  final String comment;
  @override
  final String doctorGuid;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyVisitEvent.bookDoctor(doctorBookingGuid: $doctorBookingGuid, comment: $comment, doctorGuid: $doctorGuid, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyVisitEvent.bookDoctor'))
      ..add(DiagnosticsProperty('doctorBookingGuid', doctorBookingGuid))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('doctorGuid', doctorGuid))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDoctorEventImpl &&
            (identical(other.doctorBookingGuid, doctorBookingGuid) ||
                other.doctorBookingGuid == doctorBookingGuid) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.doctorGuid, doctorGuid) ||
                other.doctorGuid == doctorGuid) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, doctorBookingGuid, comment, doctorGuid, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDoctorEventImplCopyWith<_$BookDoctorEventImpl> get copyWith =>
      __$$BookDoctorEventImplCopyWithImpl<_$BookDoctorEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String guid) getVisit,
    required TResult Function() checkConsultationDays,
    required TResult Function(String guid) getDoctorFreeTime,
    required TResult Function(DateTime selectedDate) getSelectedDate,
    required TResult Function(DoctorBooking freeTime) selectFreeTime,
    required TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)
        bookDoctor,
    required TResult Function() getDoctorBookingRequests,
  }) {
    return bookDoctor(doctorBookingGuid, comment, doctorGuid, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String guid)? getVisit,
    TResult? Function()? checkConsultationDays,
    TResult? Function(String guid)? getDoctorFreeTime,
    TResult? Function(DateTime selectedDate)? getSelectedDate,
    TResult? Function(DoctorBooking freeTime)? selectFreeTime,
    TResult? Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult? Function()? getDoctorBookingRequests,
  }) {
    return bookDoctor?.call(doctorBookingGuid, comment, doctorGuid, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String guid)? getVisit,
    TResult Function()? checkConsultationDays,
    TResult Function(String guid)? getDoctorFreeTime,
    TResult Function(DateTime selectedDate)? getSelectedDate,
    TResult Function(DoctorBooking freeTime)? selectFreeTime,
    TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult Function()? getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (bookDoctor != null) {
      return bookDoctor(doctorBookingGuid, comment, doctorGuid, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetVisitEvent value) getVisit,
    required TResult Function(CheckConsultationDaysEvent value)
        checkConsultationDays,
    required TResult Function(GetDoctorFreeTimeEvent value) getDoctorFreeTime,
    required TResult Function(GetSelectedDateEvent value) getSelectedDate,
    required TResult Function(SelectFreeTime value) selectFreeTime,
    required TResult Function(BookDoctorEvent value) bookDoctor,
    required TResult Function(GetDoctorBookingRequestsEvent value)
        getDoctorBookingRequests,
  }) {
    return bookDoctor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetVisitEvent value)? getVisit,
    TResult? Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult? Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult? Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult? Function(SelectFreeTime value)? selectFreeTime,
    TResult? Function(BookDoctorEvent value)? bookDoctor,
    TResult? Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
  }) {
    return bookDoctor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetVisitEvent value)? getVisit,
    TResult Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult Function(SelectFreeTime value)? selectFreeTime,
    TResult Function(BookDoctorEvent value)? bookDoctor,
    TResult Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (bookDoctor != null) {
      return bookDoctor(this);
    }
    return orElse();
  }
}

abstract class BookDoctorEvent implements MyVisitEvent {
  const factory BookDoctorEvent(
      {required final String doctorBookingGuid,
      required final String comment,
      required final String doctorGuid,
      required final BuildContext context}) = _$BookDoctorEventImpl;

  String get doctorBookingGuid;
  String get comment;
  String get doctorGuid;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$BookDoctorEventImplCopyWith<_$BookDoctorEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDoctorBookingRequestsEventImplCopyWith<$Res> {
  factory _$$GetDoctorBookingRequestsEventImplCopyWith(
          _$GetDoctorBookingRequestsEventImpl value,
          $Res Function(_$GetDoctorBookingRequestsEventImpl) then) =
      __$$GetDoctorBookingRequestsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDoctorBookingRequestsEventImplCopyWithImpl<$Res>
    extends _$MyVisitEventCopyWithImpl<$Res,
        _$GetDoctorBookingRequestsEventImpl>
    implements _$$GetDoctorBookingRequestsEventImplCopyWith<$Res> {
  __$$GetDoctorBookingRequestsEventImplCopyWithImpl(
      _$GetDoctorBookingRequestsEventImpl _value,
      $Res Function(_$GetDoctorBookingRequestsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDoctorBookingRequestsEventImpl
    with DiagnosticableTreeMixin
    implements GetDoctorBookingRequestsEvent {
  const _$GetDoctorBookingRequestsEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyVisitEvent.getDoctorBookingRequests()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'MyVisitEvent.getDoctorBookingRequests'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDoctorBookingRequestsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String guid) getVisit,
    required TResult Function() checkConsultationDays,
    required TResult Function(String guid) getDoctorFreeTime,
    required TResult Function(DateTime selectedDate) getSelectedDate,
    required TResult Function(DoctorBooking freeTime) selectFreeTime,
    required TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)
        bookDoctor,
    required TResult Function() getDoctorBookingRequests,
  }) {
    return getDoctorBookingRequests();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String guid)? getVisit,
    TResult? Function()? checkConsultationDays,
    TResult? Function(String guid)? getDoctorFreeTime,
    TResult? Function(DateTime selectedDate)? getSelectedDate,
    TResult? Function(DoctorBooking freeTime)? selectFreeTime,
    TResult? Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult? Function()? getDoctorBookingRequests,
  }) {
    return getDoctorBookingRequests?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String guid)? getVisit,
    TResult Function()? checkConsultationDays,
    TResult Function(String guid)? getDoctorFreeTime,
    TResult Function(DateTime selectedDate)? getSelectedDate,
    TResult Function(DoctorBooking freeTime)? selectFreeTime,
    TResult Function(String doctorBookingGuid, String comment,
            String doctorGuid, BuildContext context)?
        bookDoctor,
    TResult Function()? getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (getDoctorBookingRequests != null) {
      return getDoctorBookingRequests();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetVisitEvent value) getVisit,
    required TResult Function(CheckConsultationDaysEvent value)
        checkConsultationDays,
    required TResult Function(GetDoctorFreeTimeEvent value) getDoctorFreeTime,
    required TResult Function(GetSelectedDateEvent value) getSelectedDate,
    required TResult Function(SelectFreeTime value) selectFreeTime,
    required TResult Function(BookDoctorEvent value) bookDoctor,
    required TResult Function(GetDoctorBookingRequestsEvent value)
        getDoctorBookingRequests,
  }) {
    return getDoctorBookingRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetVisitEvent value)? getVisit,
    TResult? Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult? Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult? Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult? Function(SelectFreeTime value)? selectFreeTime,
    TResult? Function(BookDoctorEvent value)? bookDoctor,
    TResult? Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
  }) {
    return getDoctorBookingRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetVisitEvent value)? getVisit,
    TResult Function(CheckConsultationDaysEvent value)? checkConsultationDays,
    TResult Function(GetDoctorFreeTimeEvent value)? getDoctorFreeTime,
    TResult Function(GetSelectedDateEvent value)? getSelectedDate,
    TResult Function(SelectFreeTime value)? selectFreeTime,
    TResult Function(BookDoctorEvent value)? bookDoctor,
    TResult Function(GetDoctorBookingRequestsEvent value)?
        getDoctorBookingRequests,
    required TResult orElse(),
  }) {
    if (getDoctorBookingRequests != null) {
      return getDoctorBookingRequests(this);
    }
    return orElse();
  }
}

abstract class GetDoctorBookingRequestsEvent implements MyVisitEvent {
  const factory GetDoctorBookingRequestsEvent() =
      _$GetDoctorBookingRequestsEventImpl;
}

/// @nodoc
mixin _$MyVisitState {
  MyVisitModel? get visitData => throw _privateConstructorUsedError;
  String? get subscriptionName => throw _privateConstructorUsedError;
  int? get consultationDays => throw _privateConstructorUsedError;
  bool get isExistConsultationDays => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<DoctorBooking> get bookings => throw _privateConstructorUsedError;
  List<DoctorBooking> get selectedBookings =>
      throw _privateConstructorUsedError;
  DoctorBooking? get selected => throw _privateConstructorUsedError;
  List<BookingResponse> get bookingRequests =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyVisitStateCopyWith<MyVisitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyVisitStateCopyWith<$Res> {
  factory $MyVisitStateCopyWith(
          MyVisitState value, $Res Function(MyVisitState) then) =
      _$MyVisitStateCopyWithImpl<$Res, MyVisitState>;
  @useResult
  $Res call(
      {MyVisitModel? visitData,
      String? subscriptionName,
      int? consultationDays,
      bool isExistConsultationDays,
      bool isLoading,
      List<DoctorBooking> bookings,
      List<DoctorBooking> selectedBookings,
      DoctorBooking? selected,
      List<BookingResponse> bookingRequests});
}

/// @nodoc
class _$MyVisitStateCopyWithImpl<$Res, $Val extends MyVisitState>
    implements $MyVisitStateCopyWith<$Res> {
  _$MyVisitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitData = freezed,
    Object? subscriptionName = freezed,
    Object? consultationDays = freezed,
    Object? isExistConsultationDays = null,
    Object? isLoading = null,
    Object? bookings = null,
    Object? selectedBookings = null,
    Object? selected = freezed,
    Object? bookingRequests = null,
  }) {
    return _then(_value.copyWith(
      visitData: freezed == visitData
          ? _value.visitData
          : visitData // ignore: cast_nullable_to_non_nullable
              as MyVisitModel?,
      subscriptionName: freezed == subscriptionName
          ? _value.subscriptionName
          : subscriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      consultationDays: freezed == consultationDays
          ? _value.consultationDays
          : consultationDays // ignore: cast_nullable_to_non_nullable
              as int?,
      isExistConsultationDays: null == isExistConsultationDays
          ? _value.isExistConsultationDays
          : isExistConsultationDays // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bookings: null == bookings
          ? _value.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<DoctorBooking>,
      selectedBookings: null == selectedBookings
          ? _value.selectedBookings
          : selectedBookings // ignore: cast_nullable_to_non_nullable
              as List<DoctorBooking>,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as DoctorBooking?,
      bookingRequests: null == bookingRequests
          ? _value.bookingRequests
          : bookingRequests // ignore: cast_nullable_to_non_nullable
              as List<BookingResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyVisitStateImplCopyWith<$Res>
    implements $MyVisitStateCopyWith<$Res> {
  factory _$$MyVisitStateImplCopyWith(
          _$MyVisitStateImpl value, $Res Function(_$MyVisitStateImpl) then) =
      __$$MyVisitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MyVisitModel? visitData,
      String? subscriptionName,
      int? consultationDays,
      bool isExistConsultationDays,
      bool isLoading,
      List<DoctorBooking> bookings,
      List<DoctorBooking> selectedBookings,
      DoctorBooking? selected,
      List<BookingResponse> bookingRequests});
}

/// @nodoc
class __$$MyVisitStateImplCopyWithImpl<$Res>
    extends _$MyVisitStateCopyWithImpl<$Res, _$MyVisitStateImpl>
    implements _$$MyVisitStateImplCopyWith<$Res> {
  __$$MyVisitStateImplCopyWithImpl(
      _$MyVisitStateImpl _value, $Res Function(_$MyVisitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitData = freezed,
    Object? subscriptionName = freezed,
    Object? consultationDays = freezed,
    Object? isExistConsultationDays = null,
    Object? isLoading = null,
    Object? bookings = null,
    Object? selectedBookings = null,
    Object? selected = freezed,
    Object? bookingRequests = null,
  }) {
    return _then(_$MyVisitStateImpl(
      visitData: freezed == visitData
          ? _value.visitData
          : visitData // ignore: cast_nullable_to_non_nullable
              as MyVisitModel?,
      subscriptionName: freezed == subscriptionName
          ? _value.subscriptionName
          : subscriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      consultationDays: freezed == consultationDays
          ? _value.consultationDays
          : consultationDays // ignore: cast_nullable_to_non_nullable
              as int?,
      isExistConsultationDays: null == isExistConsultationDays
          ? _value.isExistConsultationDays
          : isExistConsultationDays // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bookings: null == bookings
          ? _value._bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<DoctorBooking>,
      selectedBookings: null == selectedBookings
          ? _value._selectedBookings
          : selectedBookings // ignore: cast_nullable_to_non_nullable
              as List<DoctorBooking>,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as DoctorBooking?,
      bookingRequests: null == bookingRequests
          ? _value._bookingRequests
          : bookingRequests // ignore: cast_nullable_to_non_nullable
              as List<BookingResponse>,
    ));
  }
}

/// @nodoc

class _$MyVisitStateImpl with DiagnosticableTreeMixin implements _MyVisitState {
  const _$MyVisitStateImpl(
      {this.visitData = null,
      this.subscriptionName = '',
      this.consultationDays = null,
      this.isExistConsultationDays = false,
      this.isLoading = false,
      final List<DoctorBooking> bookings = const [],
      final List<DoctorBooking> selectedBookings = const [],
      this.selected = null,
      final List<BookingResponse> bookingRequests = const []})
      : _bookings = bookings,
        _selectedBookings = selectedBookings,
        _bookingRequests = bookingRequests;

  @override
  @JsonKey()
  final MyVisitModel? visitData;
  @override
  @JsonKey()
  final String? subscriptionName;
  @override
  @JsonKey()
  final int? consultationDays;
  @override
  @JsonKey()
  final bool isExistConsultationDays;
  @override
  @JsonKey()
  final bool isLoading;
  final List<DoctorBooking> _bookings;
  @override
  @JsonKey()
  List<DoctorBooking> get bookings {
    if (_bookings is EqualUnmodifiableListView) return _bookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookings);
  }

  final List<DoctorBooking> _selectedBookings;
  @override
  @JsonKey()
  List<DoctorBooking> get selectedBookings {
    if (_selectedBookings is EqualUnmodifiableListView)
      return _selectedBookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedBookings);
  }

  @override
  @JsonKey()
  final DoctorBooking? selected;
  final List<BookingResponse> _bookingRequests;
  @override
  @JsonKey()
  List<BookingResponse> get bookingRequests {
    if (_bookingRequests is EqualUnmodifiableListView) return _bookingRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookingRequests);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyVisitState(visitData: $visitData, subscriptionName: $subscriptionName, consultationDays: $consultationDays, isExistConsultationDays: $isExistConsultationDays, isLoading: $isLoading, bookings: $bookings, selectedBookings: $selectedBookings, selected: $selected, bookingRequests: $bookingRequests)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyVisitState'))
      ..add(DiagnosticsProperty('visitData', visitData))
      ..add(DiagnosticsProperty('subscriptionName', subscriptionName))
      ..add(DiagnosticsProperty('consultationDays', consultationDays))
      ..add(DiagnosticsProperty(
          'isExistConsultationDays', isExistConsultationDays))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('bookings', bookings))
      ..add(DiagnosticsProperty('selectedBookings', selectedBookings))
      ..add(DiagnosticsProperty('selected', selected))
      ..add(DiagnosticsProperty('bookingRequests', bookingRequests));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyVisitStateImpl &&
            (identical(other.visitData, visitData) ||
                other.visitData == visitData) &&
            (identical(other.subscriptionName, subscriptionName) ||
                other.subscriptionName == subscriptionName) &&
            (identical(other.consultationDays, consultationDays) ||
                other.consultationDays == consultationDays) &&
            (identical(
                    other.isExistConsultationDays, isExistConsultationDays) ||
                other.isExistConsultationDays == isExistConsultationDays) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._bookings, _bookings) &&
            const DeepCollectionEquality()
                .equals(other._selectedBookings, _selectedBookings) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            const DeepCollectionEquality()
                .equals(other._bookingRequests, _bookingRequests));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      visitData,
      subscriptionName,
      consultationDays,
      isExistConsultationDays,
      isLoading,
      const DeepCollectionEquality().hash(_bookings),
      const DeepCollectionEquality().hash(_selectedBookings),
      selected,
      const DeepCollectionEquality().hash(_bookingRequests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyVisitStateImplCopyWith<_$MyVisitStateImpl> get copyWith =>
      __$$MyVisitStateImplCopyWithImpl<_$MyVisitStateImpl>(this, _$identity);
}

abstract class _MyVisitState implements MyVisitState {
  const factory _MyVisitState(
      {final MyVisitModel? visitData,
      final String? subscriptionName,
      final int? consultationDays,
      final bool isExistConsultationDays,
      final bool isLoading,
      final List<DoctorBooking> bookings,
      final List<DoctorBooking> selectedBookings,
      final DoctorBooking? selected,
      final List<BookingResponse> bookingRequests}) = _$MyVisitStateImpl;

  @override
  MyVisitModel? get visitData;
  @override
  String? get subscriptionName;
  @override
  int? get consultationDays;
  @override
  bool get isExistConsultationDays;
  @override
  bool get isLoading;
  @override
  List<DoctorBooking> get bookings;
  @override
  List<DoctorBooking> get selectedBookings;
  @override
  DoctorBooking? get selected;
  @override
  List<BookingResponse> get bookingRequests;
  @override
  @JsonKey(ignore: true)
  _$$MyVisitStateImplCopyWith<_$MyVisitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
