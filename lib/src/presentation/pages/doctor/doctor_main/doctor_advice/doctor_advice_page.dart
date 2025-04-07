import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/get_all_medicine_response.dart';
import '../../../../../injector_container.dart';
import '../../../../bloc/doctor/doctor_main/doctor_advice/doctor_advice_bloc.dart';
import '../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../components/buttons/bottom_navigation_button.dart';
import '../../../../components/dialogs/dialogs.dart';

part 'mixin/doctor_advice_page_mixin.dart';

class DoctorAdvicePage extends StatefulWidget {
  const DoctorAdvicePage({super.key});

  @override
  State<DoctorAdvicePage> createState() => _DoctorAdvicePageState();
}

class _DoctorAdvicePageState extends State<DoctorAdvicePage> with DoctorAdvicePageMixin {
  @override
  Widget build(BuildContext context) => BlocBuilder<DoctorAdviceBloc, DoctorAdviceState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: context.theme.colorScheme.background,
            surfaceTintColor: context.theme.colorScheme.background,
            title: Text(
              context.translate('consultation'),
              style: context.theme.appBarTheme.titleTextStyle?.copyWith(
                fontSize: 28,
              ),
            ),
            leading: state.selectedPage == 0
                ? null
                : BackButton(
                    onPressed: () => context.read<DoctorAdviceBloc>().add(const SelectPage$DoctorAdviceEvent(0)),
                  ),
          ),
          body: IndexedStack(
            index: state.selectedPage,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: AppUtils.kPaddingAll16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(context.translate('doctor')),
                      AppUtils.kBoxHeight8,
                      TextField(
                        style: TextStyle(
                          color: context.colorScheme.onBackground,
                        ),
                        decoration: InputDecoration(
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: AppUtils.kBorderRadius10,
                          ),
                          enabled: false,
                          contentPadding: AppUtils.kPaddingHor12Ver4,
                          hintText: localSource.firstName,
                          hintStyle: TextStyle(
                            color: context.colorScheme.onBackground,
                          ),
                          filled: true,
                          fillColor: context.color.disabledCard,
                        ),
                      ),
                      AppUtils.kBoxHeight16,
                      Text(context.translate('phone_number')),
                      AppUtils.kBoxHeight8,
                      TypeAheadField<String>(
                        controller: phoneController,
                        builder: (context, controller, focusNode) => TextField(
                          focusNode: focusNode,
                          controller: controller,
                          keyboardType: TextInputType.number,
                          decoration: inputDesign(context.translate('enter_phone_number'), context),
                        ),
                        hideOnEmpty: true,
                        hideOnError: true,
                        hideOnLoading: true,
                        loadingBuilder: (_) => AppUtils.kBox,
                        itemBuilder: (context, value) => ListTile(
                          title: Text(value),
                          visualDensity: VisualDensity.comfortable,
                        ),
                        itemSeparatorBuilder: (context, index) => AppUtils.kDividerBlack07,
                        onSelected: (value) {
                          phoneController.text = value.toString();
                          final user =
                              context.read<DoctorAdviceBloc>().state.clients.firstWhere((e) => e.phone.contains(value));
                          context.read<DoctorAdviceBloc>().add(SelectClient$DoctorAdviceEvent(user));
                          firstnameController.text = user.clientName;
                          lastnameController.text = user.clientLastname;
                          FocusScope.of(context).unfocus();
                        },
                        suggestionsCallback: (search) {
                          if (search.isEmpty) return [];
                          if (state.clients.any((e) => e.phone.contains(search))) {
                            return state.clients.where((e) => e.phone.contains(search)).map((e) => e.phone).toList();
                          } else {
                            context.read<DoctorAdviceBloc>().add(GetClients$DoctorAdviceEvent(search));
                            return state.clients.map((e) => e.phone).toList();
                          }
                        },
                      ),
                      AppUtils.kBoxHeight16,
                      Text(context.translate('first_name')),
                      AppUtils.kBoxHeight8,
                      TextField(
                        controller: firstnameController,
                        style: TextStyle(
                          color: context.colorScheme.onBackground,
                        ),
                        decoration: InputDecoration(
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: AppUtils.kBorderRadius10,
                          ),
                          enabled: false,
                          contentPadding: AppUtils.kPaddingHor12Ver4,
                          filled: true,
                          fillColor: context.color.disabledCard,
                        ),
                      ),
                      AppUtils.kBoxHeight16,
                      Text(context.translate('last_name')),
                      AppUtils.kBoxHeight8,
                      TextField(
                        controller: lastnameController,
                        style: TextStyle(
                          color: context.colorScheme.onBackground,
                        ),
                        decoration: InputDecoration(
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: AppUtils.kBorderRadius10,
                          ),
                          enabled: false,
                          contentPadding: AppUtils.kPaddingHor12Ver4,
                          filled: true,
                          fillColor: context.color.disabledCard,
                        ),
                      ),
                      AppUtils.kBoxHeight16,
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: AppUtils.kPaddingAll16,
                  child: state.medicinesInfo.isEmpty
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 100),
                            Center(
                              child: Image(
                                width: 250,
                                image: AssetImage('assets/png/subscription.png'),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final i in state.medicinesInfo)
                              Column(
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: context.colorScheme.surface,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: context.colorScheme.shadow.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.medication_rounded,
                                                          size: 20,
                                                          color: context.colorScheme.primary,
                                                        ),
                                                        const SizedBox(width: 8),
                                                        Expanded(
                                                          child: Text(
                                                            i.name?.brandName ?? '',
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                              color: context.colorScheme.onSurface,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      context.translate(i.description.first),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: context.colorScheme.onSurface.withOpacity(0.7),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                      decoration: BoxDecoration(
                                                        color: context.colorScheme.primaryContainer,
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: Text(
                                                        i.times
                                                            .replaceAll('{"hours_of_day": ["', '')
                                                            .replaceAll(':00"]}', '')
                                                            .replaceAll(':00", "', ','),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: context.colorScheme.onPrimaryContainer,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  // Delete button
                                                  Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final result = await customYesNoDialog<bool?>(
                                                          context: context,
                                                          title: context.translate('are_you_sure_delete'),
                                                          content: '',
                                                          acceptOnTap: () => Navigator.pop(context, true),
                                                        );
                                                        if (result != null && result == true && context.mounted) {
                                                          context.read<DoctorAdviceBloc>().add(
                                                                RemoveMedicine$DoctorAdviceEvent(i.hashCode),
                                                              );
                                                        }
                                                      },
                                                      borderRadius: BorderRadius.circular(8),
                                                      child: Container(
                                                        padding: const EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                          color: context.colorScheme.error.withOpacity(0.1),
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        child: Icon(
                                                          Icons.delete_rounded,
                                                          size: 20,
                                                          color: context.colorScheme.error,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                    decoration: BoxDecoration(
                                                      color: context.colorScheme.primary.withOpacity(0.1),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    child: Text(
                                                      '${i.doze} ${context.translate('pcs')}',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                        color: context.colorScheme.primary,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppUtils.kBoxHeight16,
                                ],
                              )
                          ],
                        ),
                ),
              ),
            ],
          ),
          floatingActionButton: state.selectedPage == 0
              ? null
              : FloatingActionButton(
                  onPressed: () async {
                    Map<String, bool> weekdays = {
                      context.translate('mon'): false,
                      context.translate('tue'): false,
                      context.translate('wed'): false,
                      context.translate('thu'): false,
                      context.translate('fri'): false,
                      context.translate('sat'): false,
                      context.translate('sun'): false,
                    };
                    List<TimeOfDay> times = [];
                    var medicines = state.medicinesName.toList();
                    var units = state.units.toList();
                    var event = [''];
                    var unit = '';
                    var description = [''];
                    Medicine? selectedMedicine;
                    void addMedicine() {
                      final List<String> time = [];
                      for (int i = 0; i < times.length - 1; i++) {
                        time.add('"${times[i].hour}:${times[i].minute.toString().padLeft(2, '0')}:00"');
                      }
                      time.add('"${times.last.hour}:${times.last.minute.toString().padLeft(2, '0')}:00"');
                      context.read<DoctorAdviceBloc>().add(
                            AddMedicine$DoctorAdviceEvent(
                              MedicineInformation(
                                event: event.first,
                                name: selectedMedicine,
                                days: [
                                  for (int i = 0; i < weekdays.keys.length; i++)
                                    if (i == weekdays.keys.length - 1)
                                      0.toString()
                                    else if (weekdays[weekdays.keys.elementAt(i)]! == true)
                                      (i + 1).toString()
                                ],
                                description: description,
                                doze: int.parse(medicineDozeController.text.trim()),
                                reserve: int.parse(medicineReserveController.text.trim()),
                                times: '{"hours_of_day": $time}',
                                type: unit,
                              ),
                            ),
                          );
                    }

                    await customModalBottomSheet<Object?>(
                      context: context,
                      builder: (context, controllerState) => BlocProvider(
                        create: (context) => DoctorAdviceBloc(sl())..add(const GetAllMedicines$DoctorAdviceEvent('')),
                        child: BottomSheet(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.sizeOf(context).height * .85,
                            minHeight: MediaQuery.sizeOf(context).height * .85,
                          ),
                          showDragHandle: true,
                          onClosing: () {
                            medicineNameController.text = '';
                            medicineDozeController.text = '';
                            medicineReserveController.text = '';
                            medicineTypeController.text = '';
                            medicineDaysController.text = '';
                            medicineTimesController.text = '';
                            medicineEventController.text = '';
                            medicineDescriptionController.text = '';
                            weekdays = {
                              context.translate('mon'): false,
                              context.translate('tue'): false,
                              context.translate('wed'): false,
                              context.translate('thu'): false,
                              context.translate('fri'): false,
                              context.translate('sat'): false,
                              context.translate('sun'): false,
                            };
                            times = [];
                            units = [];
                            event = [''];
                            unit = '';
                            description = [''];
                            selectedMedicine = null;
                          },
                          builder: (context) => SingleChildScrollView(
                            child: Padding(
                              padding: AppUtils.kPaddingAll16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(context.translate('medicine_name')),
                                  AppUtils.kBoxHeight16,
                                  BlocBuilder<DoctorAdviceBloc, DoctorAdviceState>(
                                    builder: (context, state1) => TypeAheadField<String>(
                                      controller: medicineNameController,
                                      builder: (context, controller, focusNode) => TextField(
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: context.colorScheme.onBackground,
                                        ),
                                        focusNode: focusNode,
                                        controller: controller,
                                        decoration: inputDesign(context.translate('choose_medicine'), context),
                                      ),
                                      hideOnEmpty: true,
                                      hideOnError: true,
                                      hideOnLoading: true,
                                      loadingBuilder: (_) => AppUtils.kBox,
                                      itemBuilder: (context, value) => ListTile(
                                        title: Text(
                                          value,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        visualDensity: VisualDensity.comfortable,
                                      ),
                                      itemSeparatorBuilder: (context, index) => AppUtils.kDividerBlack07,
                                      onSelected: (value) {
                                        for (final i in medicines) {
                                          if (i.brandName.toLowerCase() == value.toLowerCase()) {
                                            selectedMedicine = i;
                                            setState(() {});
                                          }
                                        }
                                        medicineNameController.text = value.toString();
                                        FocusScope.of(context).unfocus();
                                      },
                                      suggestionsCallback: (search) {
                                        if (search.isEmpty) {
                                          return state1.medicinesName.map((e) => e.brandName).take(3).toList();
                                        }
                                        context.read<DoctorAdviceBloc>().add(GetAllMedicines$DoctorAdviceEvent(search));
                                        final filter = state1.medicinesName
                                            .where((e) => e.brandName.toLowerCase().contains(search.toLowerCase()))
                                            .take(3)
                                            .toList();
                                        medicines = state1.medicinesName.toList();
                                        return filter.map((e) => e.brandName).toList();
                                      },
                                    ),
                                  ),
                                  AppUtils.kBoxHeight16,
                                  Text(context.translate('medicine_type')),
                                  AppUtils.kBoxHeight16,
                                  TypeAheadField<String>(
                                    controller: medicineTypeController,
                                    builder: (context, controller, focusNode) => TextField(
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: context.colorScheme.onBackground,
                                      ),
                                      cursorColor: Colors.transparent,
                                      keyboardType: TextInputType.none,
                                      focusNode: focusNode,
                                      controller: controller,
                                      decoration: inputDesign(context.translate('choose_medicine_type'), context),
                                    ),
                                    hideOnEmpty: true,
                                    hideOnError: true,
                                    hideOnLoading: true,
                                    loadingBuilder: (_) => AppUtils.kBox,
                                    itemBuilder: (context, value) => ListTile(
                                      title: Text(
                                        value,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      visualDensity: VisualDensity.comfortable,
                                    ),
                                    itemSeparatorBuilder: (context, index) => AppUtils.kDividerBlack07,
                                    onSelected: (value) {
                                      medicineTypeController.text = value.toString();
                                      if (localSource.locale == 'en') {
                                        unit = units.firstWhere((e) => e.unitOfMeasureEng == value).guid;
                                      } else if (localSource.locale == 'ru') {
                                        unit = units.firstWhere((e) => e.unitOfMeasureRu3 == value).guid;
                                      } else {
                                        unit = units.firstWhere((e) => e.unitOfMeasureUz == value).guid;
                                      }
                                      FocusScope.of(context).unfocus();
                                    },
                                    suggestionsCallback: (search) => units.map((e) {
                                      if (localSource.locale == 'en') {
                                        return e.unitOfMeasureEng;
                                      } else if (localSource.locale == 'ru') {
                                        return e.unitOfMeasureRu3;
                                      } else {
                                        return e.unitOfMeasureUz;
                                      }
                                    }).toList(),
                                  ),
                                  AppUtils.kBoxHeight16,
                                  Text(context.translate('consume_type')),
                                  AppUtils.kBoxHeight16,
                                  TypeAheadField<String>(
                                    controller: medicineEventController,
                                    builder: (context, controller, focusNode) => TextField(
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: context.colorScheme.onBackground,
                                      ),
                                      cursorColor: Colors.transparent,
                                      keyboardType: TextInputType.none,
                                      focusNode: focusNode,
                                      controller: controller,
                                      decoration: inputDesign(context.translate('choose_consume_type'), context),
                                    ),
                                    hideOnEmpty: true,
                                    hideOnError: true,
                                    hideOnLoading: true,
                                    loadingBuilder: (_) => AppUtils.kBox,
                                    itemBuilder: (context, value) => ListTile(
                                      title: Text(
                                        value,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      visualDensity: VisualDensity.comfortable,
                                    ),
                                    itemSeparatorBuilder: (context, index) => AppUtils.kDividerBlack07,
                                    onSelected: (value) {
                                      medicineEventController.text = value.toString();
                                      if (value == context.translate('several_times_day')) {
                                        event = ['several_times_day'];
                                        medicineDaysController.text = '';
                                        for (final i in weekdays.entries) {
                                          medicineDaysController.text += '${i.key},';
                                        }
                                      } else if (value == context.translate('always')) {
                                        event = ['always'];
                                        medicineDaysController.text = '';
                                        for (final i in weekdays.entries) {
                                          medicineDaysController.text += '${i.key},';
                                        }
                                      } else {
                                        event = ['specific_days'];
                                        medicineDaysController.text = '';
                                        for (final i in weekdays.entries) {
                                          weekdays[i.key] = false;
                                        }
                                      }
                                      FocusScope.of(context).unfocus();
                                    },
                                    suggestionsCallback: (search) => [
                                      context.translate('several_times_day'),
                                      context.translate('always'),
                                      context.translate('specific_days'),
                                    ],
                                  ),
                                  AppUtils.kBoxHeight16,
                                  Text(context.translate('description')),
                                  AppUtils.kBoxHeight16,
                                  TypeAheadField<String>(
                                    controller: medicineDescriptionController,
                                    builder: (context, controller, focusNode) => TextField(
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: context.colorScheme.onBackground,
                                      ),
                                      cursorColor: Colors.transparent,
                                      keyboardType: TextInputType.none,
                                      focusNode: focusNode,
                                      controller: controller,
                                      decoration: inputDesign(context.translate('choose_description'), context),
                                    ),
                                    hideOnEmpty: true,
                                    hideOnError: true,
                                    hideOnLoading: true,
                                    loadingBuilder: (_) => AppUtils.kBox,
                                    itemBuilder: (context, value) => ListTile(
                                      title: Text(
                                        value,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      visualDensity: VisualDensity.comfortable,
                                    ),
                                    itemSeparatorBuilder: (context, index) => AppUtils.kDividerBlack07,
                                    onSelected: (value) {
                                      medicineDescriptionController.text = value.toString();
                                      if (value == context.translate('before_food')) {
                                        description = ['before_food'];
                                      } else if (value == context.translate('during_food')) {
                                        description = ['during_food'];
                                      } else {
                                        description = ['after_food'];
                                      }
                                      FocusScope.of(context).unfocus();
                                    },
                                    suggestionsCallback: (search) => [
                                      context.translate('before_food'),
                                      context.translate('during_food'),
                                      context.translate('after_food'),
                                    ],
                                  ),
                                  AppUtils.kBoxHeight16,
                                  Text(context.translate('week_days')),
                                  AppUtils.kBoxHeight16,
                                  TypeAheadField<String>(
                                    controller: medicineDaysController,
                                    builder: (context, controller, focusNode) => TextField(
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: context.colorScheme.onBackground,
                                      ),
                                      cursorColor: Colors.transparent,
                                      focusNode: focusNode,
                                      controller: controller,
                                      decoration: inputDesign(context.translate('choose_week_days'), context),
                                    ),
                                    hideOnEmpty: true,
                                    hideOnError: true,
                                    hideOnLoading: true,
                                    loadingBuilder: (_) => AppUtils.kBox,
                                    itemBuilder: (context, value) => ListTile(
                                      title: Text(
                                        value,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      visualDensity: VisualDensity.comfortable,
                                    ),
                                    itemSeparatorBuilder: (context, index) => AppUtils.kDividerBlack07,
                                    onSelected: (value) {
                                      weekdays[value] = !weekdays[value]!;
                                      medicineDaysController.text = '';
                                      for (final i in weekdays.entries) {
                                        if (i.value) {
                                          medicineDaysController.text += '${i.key},';
                                        }
                                      }
                                      FocusScope.of(context).unfocus();
                                    },
                                    suggestionsCallback: (search) => weekdays.keys.toList(),
                                  ),
                                  AppUtils.kBoxHeight16,
                                  Text(context.translate('medicine_times')),
                                  AppUtils.kBoxHeight16,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: context.colorScheme.onBackground,
                                          ),
                                          decoration: inputDesign(context.translate('medicine_times'), context),
                                          controller: medicineTimesController,
                                          enabled: false,
                                        ),
                                      ),
                                      AppUtils.kBoxWidth8,
                                      IconButton(
                                        style: ButtonStyle(
                                          shape: const MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius: AppUtils.kBorderRadius16,
                                            ),
                                          ),
                                          backgroundColor: MaterialStatePropertyAll(
                                            context.colorScheme.error,
                                          ),
                                        ),
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          times.clear();
                                          medicineTimesController.text = '';
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          size: 30,
                                          color: context.colorScheme.onError,
                                        ),
                                      ),
                                      AppUtils.kBoxWidth8,
                                      IconButton(
                                        style: ButtonStyle(
                                          shape: const MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius: AppUtils.kBorderRadius16,
                                            ),
                                          ),
                                          backgroundColor: MaterialStatePropertyAll(
                                            context.colorScheme.primaryContainer,
                                          ),
                                        ),
                                        onPressed: () async {
                                          FocusScope.of(context).unfocus();
                                          final time = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                          );
                                          if (time != null && !times.contains(time)) {
                                            times.add(time);
                                            medicineTimesController.text += '${time.hour}:${time.minute.toString().padLeft(2, '0')},';
                                          }
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 30,
                                          color: context.colorScheme.onPrimaryContainer,
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppUtils.kBoxHeight16,
                                  Text(context.translate('dozage')),
                                  AppUtils.kBoxHeight16,
                                  TextField(
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: context.colorScheme.onBackground,
                                    ),
                                    controller: medicineDozeController,
                                    keyboardType: TextInputType.number,
                                    decoration: inputDesign(context.translate('enter_dozage'), context),
                                  ),
                                  AppUtils.kBoxHeight16,
                                  Text(context.translate('reserve')),
                                  AppUtils.kBoxHeight16,
                                  TextField(
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: context.colorScheme.onBackground,
                                    ),
                                    controller: medicineReserveController,
                                    keyboardType: TextInputType.number,
                                    decoration: inputDesign(context.translate('choose_reserve'), context),
                                  ),
                                  AppUtils.kBoxHeight32,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(context.colorScheme.error),
                                          ),
                                          onPressed: () {
                                            medicineNameController.text = '';
                                            medicineDozeController.text = '';
                                            medicineReserveController.text = '';
                                            medicineTypeController.text = '';
                                            medicineDaysController.text = '';
                                            medicineTimesController.text = '';
                                            medicineEventController.text = '';
                                            medicineDescriptionController.text = '';
                                            weekdays = {
                                              context.translate('mon'): false,
                                              context.translate('tue'): false,
                                              context.translate('wed'): false,
                                              context.translate('thu'): false,
                                              context.translate('fri'): false,
                                              context.translate('sat'): false,
                                              context.translate('sun'): false,
                                            };
                                            times = [];
                                            units = [];
                                            event = [''];
                                            unit = '';
                                            description = [''];
                                            selectedMedicine = null;
                                            Navigator.pop(context);
                                            FocusScope.of(context).unfocus();
                                          },
                                          child: Text(
                                            context.translate('cancel'),
                                            style: TextStyle(
                                              color: context.colorScheme.onError,
                                            ),
                                          ),
                                        ),
                                      ),
                                      AppUtils.kBoxWidth16,
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (medicineNameController.text.isNotEmpty &&
                                                medicineDaysController.text.isNotEmpty &&
                                                medicineEventController.text.isNotEmpty &&
                                                medicineReserveController.text.isNotEmpty &&
                                                medicineTimesController.text.isNotEmpty &&
                                                medicineDescriptionController.text.isNotEmpty &&
                                                medicineDozeController.text.isNotEmpty &&
                                                medicineTypeController.text.isNotEmpty) {
                                              addMedicine();
                                              medicineNameController.text = '';
                                              medicineDaysController.text = '';
                                              medicineEventController.text = '';
                                              medicineReserveController.text = '';
                                              medicineTimesController.text = '';
                                              medicineDescriptionController.text = '';
                                              medicineDozeController.text = '';
                                              medicineTypeController.text = '';
                                              Navigator.pop(context);
                                              FocusScope.of(context).unfocus();
                                            }
                                          },
                                          child: Text(context.translate('submit')),
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppUtils.kBoxHeight16,
                                  SizedBox(
                                    height: MediaQuery.viewInsetsOf(context).bottom,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
          bottomNavigationBar: BottomNavigationButton(
            child: BlocBuilder<DoctorAdviceBloc, DoctorAdviceState>(
              builder: (context, state) => ElevatedButton(
                onPressed: () async {
                  if (state.selectedPage == 0) {
                    if (phoneController.text.isNotEmpty &&
                        firstnameController.text.isNotEmpty &&
                        lastnameController.text.isNotEmpty &&
                        !state.isLoading) {
                      context.read<DoctorAdviceBloc>().add(const SendAdvice$DoctorAdviceEvent());
                      await Future<Object?>.delayed(const Duration(seconds: 1));
                      if (context.mounted) {
                        context.read<DoctorAdviceBloc>().add(const SelectPage$DoctorAdviceEvent(1));
                      }
                      phoneController.text = '';
                      firstnameController.text = '';
                      lastnameController.text = '';
                    }
                  } else {
                    context.read<DoctorAdviceBloc>().add(const SendFullAdvice$DoctorAdviceEvent());
                  }
                },
                child: state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: context.colorScheme.onPrimary,
                        ),
                      )
                    : state.selectedPage == 0
                        ? Text(context.translate('send'))
                        : Text(context.translate('save')),
              ),
            ),
          ),
        ),
      );
}

class MedicineInformation {
  const MedicineInformation({
    required this.event,
    required this.name,
    required this.days,
    required this.description,
    required this.doze,
    required this.reserve,
    required this.times,
    required this.type,
  });

  final Medicine? name;
  final String type;
  final String event;
  final List<String> description;
  final List<String> days;
  final String times;
  final int doze;
  final int reserve;
}
