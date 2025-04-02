// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disease_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiseaseHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)
        started,
    required TResult Function(String searchedItem) getSearchedItems,
    required TResult Function() scrollGetList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)?
        started,
    TResult? Function(String searchedItem)? getSearchedItems,
    TResult? Function()? scrollGetList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)?
        started,
    TResult Function(String searchedItem)? getSearchedItems,
    TResult Function()? scrollGetList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(GetSearchedItemsEvent value) getSearchedItems,
    required TResult Function(ScrollGetListEvent value) scrollGetList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(GetSearchedItemsEvent value)? getSearchedItems,
    TResult? Function(ScrollGetListEvent value)? scrollGetList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(GetSearchedItemsEvent value)? getSearchedItems,
    TResult Function(ScrollGetListEvent value)? scrollGetList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseHistoryEventCopyWith<$Res> {
  factory $DiseaseHistoryEventCopyWith(
          DiseaseHistoryEvent value, $Res Function(DiseaseHistoryEvent) then) =
      _$DiseaseHistoryEventCopyWithImpl<$Res, DiseaseHistoryEvent>;
}

/// @nodoc
class _$DiseaseHistoryEventCopyWithImpl<$Res, $Val extends DiseaseHistoryEvent>
    implements $DiseaseHistoryEventCopyWith<$Res> {
  _$DiseaseHistoryEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call(
      {List<NaznachenieIdData> diseaseItemsList,
      Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
      Map<String, MedicineTakingModel> medicalHistoryDrugs,
      Map<String, List<String>> medicalHistoryDrugNames});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$DiseaseHistoryEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseItemsList = null,
    Object? medicationTimes = null,
    Object? medicalHistoryDrugs = null,
    Object? medicalHistoryDrugNames = null,
  }) {
    return _then(_$StartedImpl(
      diseaseItemsList: null == diseaseItemsList
          ? _value._diseaseItemsList
          : diseaseItemsList // ignore: cast_nullable_to_non_nullable
              as List<NaznachenieIdData>,
      medicationTimes: null == medicationTimes
          ? _value._medicationTimes
          : medicationTimes // ignore: cast_nullable_to_non_nullable
              as Map<String, List<SubPurposeMedicationTimesItem>>,
      medicalHistoryDrugs: null == medicalHistoryDrugs
          ? _value._medicalHistoryDrugs
          : medicalHistoryDrugs // ignore: cast_nullable_to_non_nullable
              as Map<String, MedicineTakingModel>,
      medicalHistoryDrugNames: null == medicalHistoryDrugNames
          ? _value._medicalHistoryDrugNames
          : medicalHistoryDrugNames // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements Started {
  const _$StartedImpl(
      {required final List<NaznachenieIdData> diseaseItemsList,
      required final Map<String, List<SubPurposeMedicationTimesItem>>
          medicationTimes,
      required final Map<String, MedicineTakingModel> medicalHistoryDrugs,
      required final Map<String, List<String>> medicalHistoryDrugNames})
      : _diseaseItemsList = diseaseItemsList,
        _medicationTimes = medicationTimes,
        _medicalHistoryDrugs = medicalHistoryDrugs,
        _medicalHistoryDrugNames = medicalHistoryDrugNames;

  final List<NaznachenieIdData> _diseaseItemsList;
  @override
  List<NaznachenieIdData> get diseaseItemsList {
    if (_diseaseItemsList is EqualUnmodifiableListView)
      return _diseaseItemsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseItemsList);
  }

  final Map<String, List<SubPurposeMedicationTimesItem>> _medicationTimes;
  @override
  Map<String, List<SubPurposeMedicationTimesItem>> get medicationTimes {
    if (_medicationTimes is EqualUnmodifiableMapView) return _medicationTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_medicationTimes);
  }

  final Map<String, MedicineTakingModel> _medicalHistoryDrugs;
  @override
  Map<String, MedicineTakingModel> get medicalHistoryDrugs {
    if (_medicalHistoryDrugs is EqualUnmodifiableMapView)
      return _medicalHistoryDrugs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_medicalHistoryDrugs);
  }

  final Map<String, List<String>> _medicalHistoryDrugNames;
  @override
  Map<String, List<String>> get medicalHistoryDrugNames {
    if (_medicalHistoryDrugNames is EqualUnmodifiableMapView)
      return _medicalHistoryDrugNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_medicalHistoryDrugNames);
  }

  @override
  String toString() {
    return 'DiseaseHistoryEvent.started(diseaseItemsList: $diseaseItemsList, medicationTimes: $medicationTimes, medicalHistoryDrugs: $medicalHistoryDrugs, medicalHistoryDrugNames: $medicalHistoryDrugNames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            const DeepCollectionEquality()
                .equals(other._diseaseItemsList, _diseaseItemsList) &&
            const DeepCollectionEquality()
                .equals(other._medicationTimes, _medicationTimes) &&
            const DeepCollectionEquality()
                .equals(other._medicalHistoryDrugs, _medicalHistoryDrugs) &&
            const DeepCollectionEquality().equals(
                other._medicalHistoryDrugNames, _medicalHistoryDrugNames));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_diseaseItemsList),
      const DeepCollectionEquality().hash(_medicationTimes),
      const DeepCollectionEquality().hash(_medicalHistoryDrugs),
      const DeepCollectionEquality().hash(_medicalHistoryDrugNames));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)
        started,
    required TResult Function(String searchedItem) getSearchedItems,
    required TResult Function() scrollGetList,
  }) {
    return started(diseaseItemsList, medicationTimes, medicalHistoryDrugs,
        medicalHistoryDrugNames);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)?
        started,
    TResult? Function(String searchedItem)? getSearchedItems,
    TResult? Function()? scrollGetList,
  }) {
    return started?.call(diseaseItemsList, medicationTimes, medicalHistoryDrugs,
        medicalHistoryDrugNames);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)?
        started,
    TResult Function(String searchedItem)? getSearchedItems,
    TResult Function()? scrollGetList,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(diseaseItemsList, medicationTimes, medicalHistoryDrugs,
          medicalHistoryDrugNames);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(GetSearchedItemsEvent value) getSearchedItems,
    required TResult Function(ScrollGetListEvent value) scrollGetList,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(GetSearchedItemsEvent value)? getSearchedItems,
    TResult? Function(ScrollGetListEvent value)? scrollGetList,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(GetSearchedItemsEvent value)? getSearchedItems,
    TResult Function(ScrollGetListEvent value)? scrollGetList,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements DiseaseHistoryEvent {
  const factory Started(
          {required final List<NaznachenieIdData> diseaseItemsList,
          required final Map<String, List<SubPurposeMedicationTimesItem>>
              medicationTimes,
          required final Map<String, MedicineTakingModel> medicalHistoryDrugs,
          required final Map<String, List<String>> medicalHistoryDrugNames}) =
      _$StartedImpl;

  List<NaznachenieIdData> get diseaseItemsList;
  Map<String, List<SubPurposeMedicationTimesItem>> get medicationTimes;
  Map<String, MedicineTakingModel> get medicalHistoryDrugs;
  Map<String, List<String>> get medicalHistoryDrugNames;
  @JsonKey(ignore: true)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSearchedItemsEventImplCopyWith<$Res> {
  factory _$$GetSearchedItemsEventImplCopyWith(
          _$GetSearchedItemsEventImpl value,
          $Res Function(_$GetSearchedItemsEventImpl) then) =
      __$$GetSearchedItemsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchedItem});
}

/// @nodoc
class __$$GetSearchedItemsEventImplCopyWithImpl<$Res>
    extends _$DiseaseHistoryEventCopyWithImpl<$Res, _$GetSearchedItemsEventImpl>
    implements _$$GetSearchedItemsEventImplCopyWith<$Res> {
  __$$GetSearchedItemsEventImplCopyWithImpl(_$GetSearchedItemsEventImpl _value,
      $Res Function(_$GetSearchedItemsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchedItem = null,
  }) {
    return _then(_$GetSearchedItemsEventImpl(
      searchedItem: null == searchedItem
          ? _value.searchedItem
          : searchedItem // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSearchedItemsEventImpl implements GetSearchedItemsEvent {
  const _$GetSearchedItemsEventImpl({required this.searchedItem});

  @override
  final String searchedItem;

  @override
  String toString() {
    return 'DiseaseHistoryEvent.getSearchedItems(searchedItem: $searchedItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchedItemsEventImpl &&
            (identical(other.searchedItem, searchedItem) ||
                other.searchedItem == searchedItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchedItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchedItemsEventImplCopyWith<_$GetSearchedItemsEventImpl>
      get copyWith => __$$GetSearchedItemsEventImplCopyWithImpl<
          _$GetSearchedItemsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)
        started,
    required TResult Function(String searchedItem) getSearchedItems,
    required TResult Function() scrollGetList,
  }) {
    return getSearchedItems(searchedItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)?
        started,
    TResult? Function(String searchedItem)? getSearchedItems,
    TResult? Function()? scrollGetList,
  }) {
    return getSearchedItems?.call(searchedItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)?
        started,
    TResult Function(String searchedItem)? getSearchedItems,
    TResult Function()? scrollGetList,
    required TResult orElse(),
  }) {
    if (getSearchedItems != null) {
      return getSearchedItems(searchedItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(GetSearchedItemsEvent value) getSearchedItems,
    required TResult Function(ScrollGetListEvent value) scrollGetList,
  }) {
    return getSearchedItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(GetSearchedItemsEvent value)? getSearchedItems,
    TResult? Function(ScrollGetListEvent value)? scrollGetList,
  }) {
    return getSearchedItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(GetSearchedItemsEvent value)? getSearchedItems,
    TResult Function(ScrollGetListEvent value)? scrollGetList,
    required TResult orElse(),
  }) {
    if (getSearchedItems != null) {
      return getSearchedItems(this);
    }
    return orElse();
  }
}

abstract class GetSearchedItemsEvent implements DiseaseHistoryEvent {
  const factory GetSearchedItemsEvent({required final String searchedItem}) =
      _$GetSearchedItemsEventImpl;

  String get searchedItem;
  @JsonKey(ignore: true)
  _$$GetSearchedItemsEventImplCopyWith<_$GetSearchedItemsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScrollGetListEventImplCopyWith<$Res> {
  factory _$$ScrollGetListEventImplCopyWith(_$ScrollGetListEventImpl value,
          $Res Function(_$ScrollGetListEventImpl) then) =
      __$$ScrollGetListEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScrollGetListEventImplCopyWithImpl<$Res>
    extends _$DiseaseHistoryEventCopyWithImpl<$Res, _$ScrollGetListEventImpl>
    implements _$$ScrollGetListEventImplCopyWith<$Res> {
  __$$ScrollGetListEventImplCopyWithImpl(_$ScrollGetListEventImpl _value,
      $Res Function(_$ScrollGetListEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScrollGetListEventImpl implements ScrollGetListEvent {
  const _$ScrollGetListEventImpl();

  @override
  String toString() {
    return 'DiseaseHistoryEvent.scrollGetList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScrollGetListEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)
        started,
    required TResult Function(String searchedItem) getSearchedItems,
    required TResult Function() scrollGetList,
  }) {
    return scrollGetList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)?
        started,
    TResult? Function(String searchedItem)? getSearchedItems,
    TResult? Function()? scrollGetList,
  }) {
    return scrollGetList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<NaznachenieIdData> diseaseItemsList,
            Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
            Map<String, MedicineTakingModel> medicalHistoryDrugs,
            Map<String, List<String>> medicalHistoryDrugNames)?
        started,
    TResult Function(String searchedItem)? getSearchedItems,
    TResult Function()? scrollGetList,
    required TResult orElse(),
  }) {
    if (scrollGetList != null) {
      return scrollGetList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(GetSearchedItemsEvent value) getSearchedItems,
    required TResult Function(ScrollGetListEvent value) scrollGetList,
  }) {
    return scrollGetList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(GetSearchedItemsEvent value)? getSearchedItems,
    TResult? Function(ScrollGetListEvent value)? scrollGetList,
  }) {
    return scrollGetList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(GetSearchedItemsEvent value)? getSearchedItems,
    TResult Function(ScrollGetListEvent value)? scrollGetList,
    required TResult orElse(),
  }) {
    if (scrollGetList != null) {
      return scrollGetList(this);
    }
    return orElse();
  }
}

abstract class ScrollGetListEvent implements DiseaseHistoryEvent {
  const factory ScrollGetListEvent() = _$ScrollGetListEventImpl;
}

/// @nodoc
mixin _$DiseaseHistoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isScrollLoading => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  List<NaznachenieIdData> get diseaseItemsList =>
      throw _privateConstructorUsedError;
  Map<String, List<SubPurposeMedicationTimesItem>> get medicationTimes =>
      throw _privateConstructorUsedError;
  Map<String, List<String>> get medicalHistoryDrugNames =>
      throw _privateConstructorUsedError;
  Map<String, MedicineTakingModel> get medicalHistoryDrugs =>
      throw _privateConstructorUsedError;
  List<SearchAppointResponse> get searchedAppoints =>
      throw _privateConstructorUsedError;
  List<DoctorIdData> get searchedDoctors => throw _privateConstructorUsedError;
  List<DoctorTypeModel> get searchedCategory =>
      throw _privateConstructorUsedError;
  SearchStatus get searchStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiseaseHistoryStateCopyWith<DiseaseHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseHistoryStateCopyWith<$Res> {
  factory $DiseaseHistoryStateCopyWith(
          DiseaseHistoryState value, $Res Function(DiseaseHistoryState) then) =
      _$DiseaseHistoryStateCopyWithImpl<$Res, DiseaseHistoryState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isScrollLoading,
      String searchText,
      List<NaznachenieIdData> diseaseItemsList,
      Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
      Map<String, List<String>> medicalHistoryDrugNames,
      Map<String, MedicineTakingModel> medicalHistoryDrugs,
      List<SearchAppointResponse> searchedAppoints,
      List<DoctorIdData> searchedDoctors,
      List<DoctorTypeModel> searchedCategory,
      SearchStatus searchStatus});
}

/// @nodoc
class _$DiseaseHistoryStateCopyWithImpl<$Res, $Val extends DiseaseHistoryState>
    implements $DiseaseHistoryStateCopyWith<$Res> {
  _$DiseaseHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isScrollLoading = null,
    Object? searchText = null,
    Object? diseaseItemsList = null,
    Object? medicationTimes = null,
    Object? medicalHistoryDrugNames = null,
    Object? medicalHistoryDrugs = null,
    Object? searchedAppoints = null,
    Object? searchedDoctors = null,
    Object? searchedCategory = null,
    Object? searchStatus = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isScrollLoading: null == isScrollLoading
          ? _value.isScrollLoading
          : isScrollLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      diseaseItemsList: null == diseaseItemsList
          ? _value.diseaseItemsList
          : diseaseItemsList // ignore: cast_nullable_to_non_nullable
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
      searchedAppoints: null == searchedAppoints
          ? _value.searchedAppoints
          : searchedAppoints // ignore: cast_nullable_to_non_nullable
              as List<SearchAppointResponse>,
      searchedDoctors: null == searchedDoctors
          ? _value.searchedDoctors
          : searchedDoctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorIdData>,
      searchedCategory: null == searchedCategory
          ? _value.searchedCategory
          : searchedCategory // ignore: cast_nullable_to_non_nullable
              as List<DoctorTypeModel>,
      searchStatus: null == searchStatus
          ? _value.searchStatus
          : searchStatus // ignore: cast_nullable_to_non_nullable
              as SearchStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiseaseHistoryStateImplCopyWith<$Res>
    implements $DiseaseHistoryStateCopyWith<$Res> {
  factory _$$DiseaseHistoryStateImplCopyWith(_$DiseaseHistoryStateImpl value,
          $Res Function(_$DiseaseHistoryStateImpl) then) =
      __$$DiseaseHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isScrollLoading,
      String searchText,
      List<NaznachenieIdData> diseaseItemsList,
      Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
      Map<String, List<String>> medicalHistoryDrugNames,
      Map<String, MedicineTakingModel> medicalHistoryDrugs,
      List<SearchAppointResponse> searchedAppoints,
      List<DoctorIdData> searchedDoctors,
      List<DoctorTypeModel> searchedCategory,
      SearchStatus searchStatus});
}

/// @nodoc
class __$$DiseaseHistoryStateImplCopyWithImpl<$Res>
    extends _$DiseaseHistoryStateCopyWithImpl<$Res, _$DiseaseHistoryStateImpl>
    implements _$$DiseaseHistoryStateImplCopyWith<$Res> {
  __$$DiseaseHistoryStateImplCopyWithImpl(_$DiseaseHistoryStateImpl _value,
      $Res Function(_$DiseaseHistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isScrollLoading = null,
    Object? searchText = null,
    Object? diseaseItemsList = null,
    Object? medicationTimes = null,
    Object? medicalHistoryDrugNames = null,
    Object? medicalHistoryDrugs = null,
    Object? searchedAppoints = null,
    Object? searchedDoctors = null,
    Object? searchedCategory = null,
    Object? searchStatus = null,
  }) {
    return _then(_$DiseaseHistoryStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isScrollLoading: null == isScrollLoading
          ? _value.isScrollLoading
          : isScrollLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      diseaseItemsList: null == diseaseItemsList
          ? _value._diseaseItemsList
          : diseaseItemsList // ignore: cast_nullable_to_non_nullable
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
      searchedAppoints: null == searchedAppoints
          ? _value._searchedAppoints
          : searchedAppoints // ignore: cast_nullable_to_non_nullable
              as List<SearchAppointResponse>,
      searchedDoctors: null == searchedDoctors
          ? _value._searchedDoctors
          : searchedDoctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorIdData>,
      searchedCategory: null == searchedCategory
          ? _value._searchedCategory
          : searchedCategory // ignore: cast_nullable_to_non_nullable
              as List<DoctorTypeModel>,
      searchStatus: null == searchStatus
          ? _value.searchStatus
          : searchStatus // ignore: cast_nullable_to_non_nullable
              as SearchStatus,
    ));
  }
}

/// @nodoc

class _$DiseaseHistoryStateImpl implements _DiseaseHistoryState {
  const _$DiseaseHistoryStateImpl(
      {this.isLoading = false,
      this.isScrollLoading = false,
      this.searchText = '',
      final List<NaznachenieIdData> diseaseItemsList = const [],
      final Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes =
          const {},
      final Map<String, List<String>> medicalHistoryDrugNames = const {},
      final Map<String, MedicineTakingModel> medicalHistoryDrugs = const {},
      final List<SearchAppointResponse> searchedAppoints = const [],
      final List<DoctorIdData> searchedDoctors = const [],
      final List<DoctorTypeModel> searchedCategory = const [],
      this.searchStatus = SearchStatus.initial})
      : _diseaseItemsList = diseaseItemsList,
        _medicationTimes = medicationTimes,
        _medicalHistoryDrugNames = medicalHistoryDrugNames,
        _medicalHistoryDrugs = medicalHistoryDrugs,
        _searchedAppoints = searchedAppoints,
        _searchedDoctors = searchedDoctors,
        _searchedCategory = searchedCategory;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isScrollLoading;
  @override
  @JsonKey()
  final String searchText;
  final List<NaznachenieIdData> _diseaseItemsList;
  @override
  @JsonKey()
  List<NaznachenieIdData> get diseaseItemsList {
    if (_diseaseItemsList is EqualUnmodifiableListView)
      return _diseaseItemsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseItemsList);
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

  final List<SearchAppointResponse> _searchedAppoints;
  @override
  @JsonKey()
  List<SearchAppointResponse> get searchedAppoints {
    if (_searchedAppoints is EqualUnmodifiableListView)
      return _searchedAppoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedAppoints);
  }

  final List<DoctorIdData> _searchedDoctors;
  @override
  @JsonKey()
  List<DoctorIdData> get searchedDoctors {
    if (_searchedDoctors is EqualUnmodifiableListView) return _searchedDoctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedDoctors);
  }

  final List<DoctorTypeModel> _searchedCategory;
  @override
  @JsonKey()
  List<DoctorTypeModel> get searchedCategory {
    if (_searchedCategory is EqualUnmodifiableListView)
      return _searchedCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedCategory);
  }

  @override
  @JsonKey()
  final SearchStatus searchStatus;

  @override
  String toString() {
    return 'DiseaseHistoryState(isLoading: $isLoading, isScrollLoading: $isScrollLoading, searchText: $searchText, diseaseItemsList: $diseaseItemsList, medicationTimes: $medicationTimes, medicalHistoryDrugNames: $medicalHistoryDrugNames, medicalHistoryDrugs: $medicalHistoryDrugs, searchedAppoints: $searchedAppoints, searchedDoctors: $searchedDoctors, searchedCategory: $searchedCategory, searchStatus: $searchStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiseaseHistoryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isScrollLoading, isScrollLoading) ||
                other.isScrollLoading == isScrollLoading) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            const DeepCollectionEquality()
                .equals(other._diseaseItemsList, _diseaseItemsList) &&
            const DeepCollectionEquality()
                .equals(other._medicationTimes, _medicationTimes) &&
            const DeepCollectionEquality().equals(
                other._medicalHistoryDrugNames, _medicalHistoryDrugNames) &&
            const DeepCollectionEquality()
                .equals(other._medicalHistoryDrugs, _medicalHistoryDrugs) &&
            const DeepCollectionEquality()
                .equals(other._searchedAppoints, _searchedAppoints) &&
            const DeepCollectionEquality()
                .equals(other._searchedDoctors, _searchedDoctors) &&
            const DeepCollectionEquality()
                .equals(other._searchedCategory, _searchedCategory) &&
            (identical(other.searchStatus, searchStatus) ||
                other.searchStatus == searchStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isScrollLoading,
      searchText,
      const DeepCollectionEquality().hash(_diseaseItemsList),
      const DeepCollectionEquality().hash(_medicationTimes),
      const DeepCollectionEquality().hash(_medicalHistoryDrugNames),
      const DeepCollectionEquality().hash(_medicalHistoryDrugs),
      const DeepCollectionEquality().hash(_searchedAppoints),
      const DeepCollectionEquality().hash(_searchedDoctors),
      const DeepCollectionEquality().hash(_searchedCategory),
      searchStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiseaseHistoryStateImplCopyWith<_$DiseaseHistoryStateImpl> get copyWith =>
      __$$DiseaseHistoryStateImplCopyWithImpl<_$DiseaseHistoryStateImpl>(
          this, _$identity);
}

abstract class _DiseaseHistoryState implements DiseaseHistoryState {
  const factory _DiseaseHistoryState(
      {final bool isLoading,
      final bool isScrollLoading,
      final String searchText,
      final List<NaznachenieIdData> diseaseItemsList,
      final Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
      final Map<String, List<String>> medicalHistoryDrugNames,
      final Map<String, MedicineTakingModel> medicalHistoryDrugs,
      final List<SearchAppointResponse> searchedAppoints,
      final List<DoctorIdData> searchedDoctors,
      final List<DoctorTypeModel> searchedCategory,
      final SearchStatus searchStatus}) = _$DiseaseHistoryStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isScrollLoading;
  @override
  String get searchText;
  @override
  List<NaznachenieIdData> get diseaseItemsList;
  @override
  Map<String, List<SubPurposeMedicationTimesItem>> get medicationTimes;
  @override
  Map<String, List<String>> get medicalHistoryDrugNames;
  @override
  Map<String, MedicineTakingModel> get medicalHistoryDrugs;
  @override
  List<SearchAppointResponse> get searchedAppoints;
  @override
  List<DoctorIdData> get searchedDoctors;
  @override
  List<DoctorTypeModel> get searchedCategory;
  @override
  SearchStatus get searchStatus;
  @override
  @JsonKey(ignore: true)
  _$$DiseaseHistoryStateImplCopyWith<_$DiseaseHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
