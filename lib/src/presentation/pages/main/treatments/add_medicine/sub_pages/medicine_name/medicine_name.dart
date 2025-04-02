import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../../../core/either_dart/future_extension.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../data/models/add_medicine/get_drugs/get_drugs_response.dart';
import '../../../../../../../domain/repositories/add_medicine/add_medicine_repository.dart';
import '../../../../../../../injector_container.dart';
import '../../../../../../bloc/add_medicine/add_medicine_bloc.dart';
import '../../../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import 'widgets/metrics_sheet.dart';

class MedicineNamePage extends StatefulWidget {
  const MedicineNamePage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<MedicineNamePage> createState() => _MedicineNamePageState();
}

class _MedicineNamePageState extends State<MedicineNamePage> {
  late final TextEditingController medicineNameController;
  late final AddMedicineRepository _repository = sl();
  late final _bloc = context.read<AddMedicineBloc>();

  @override
  void initState() {
    super.initState();
    medicineNameController = TextEditingController(text: _bloc.state.medicineName)
      ..addListener(() {
        _bloc.add(
          MedicineNameTextFieldEvent(medicineName: medicineNameController.text),
        );
      });
  }

  Future<List<DrugModel>> search(String text) async {
    final result = _repository.getDrugs(text);
    return result.fold<List<DrugModel>>((error) => [], (r) => r.drugs ?? []);
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<AddMedicineBloc, AddMedicineState>(
        listener: (context, state) {
          if (!state.isLoadingMetrics && !state.isReceivedMetrics) {
            _bloc.add(const GetMetricsEvent());
          }
        },
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              children: [
                TypeAheadField<DrugModel>(
                  onSelected: (drug) {
                    medicineNameController.text = drug.name?.replaceAll('\n', ' ') ?? medicineNameController.text;
                    _bloc.add(
                      MedicineNameTextFieldEvent(
                        medicineName: medicineNameController.text,
                        selectedDrug: drug,
                      ),
                    );
                    FocusScope.of(context).unfocus();
                  },
                  controller: medicineNameController,
                  builder: (context, controller, focusNode) => TextField(
                    controller: controller,
                    focusNode: focusNode,
                    autofocus: true,
                    style: context.theme.textTheme.titleMedium!.copyWith(fontSize: 14),
                    decoration: InputDecoration(
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: AppUtils.kBorderRadius10,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: AppUtils.kBorderRadius10,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: AppUtils.kBorderRadius10,
                      ),
                      contentPadding: AppUtils.kPaddingAll16,
                      hintText: context.translate('name_of_medicine'),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: context.color.onBackground50,
                      ),
                      filled: true,
                      fillColor: context.color.disabledCard,
                    ),
                  ),
                  suggestionsCallback: search,
                  hideOnEmpty: true,
                  hideOnError: true,
                  hideOnLoading: true,
                  loadingBuilder: (_) => AppUtils.kBox,
                  itemSeparatorBuilder: (_, index) => AppUtils.kDividerBlack07,
                  itemBuilder: (_, drug) => InkWell(
                    child: Ink(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: Text(
                        drug.name ?? '',
                        style: context.theme.textTheme.titleMedium!.copyWith(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  // onSuggestionSelected: (drug) {
                  //   medicineNameController.text =
                  //       drug.name?.replaceAll('\n', ' ') ??
                  //           medicineNameController.text;
                  //   _bloc.add(
                  //     MedicineNameTextFieldEvent(
                  //         medicineName: medicineNameController.text,
                  //         selectedDrug: drug),
                  //   );
                  //   // Navigator.of(context).push(MaterialPageRoute(
                  //   //     builder: (context) =>
                  //   //         ProductPage(product: suggestion)));
                  // },
                ),
                AppUtils.kBoxHeight12,
                Material(
                  color: context.color.disabledCard,
                  borderRadius: AppUtils.kBorderRadius8,
                  child: ListTile(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      // ignore: inference_failure_on_function_invocation
                      await customModalBottomSheet(
                        height: 380,
                        context: context,
                        builder: (_, controller) => MetricsBottomSheet(
                          bloc: context.read<AddMedicineBloc>(),
                          initialIndex: state.metricIndex,
                        ),
                      );
                      // if (result is int) {
                      //   // ignore: use_build_context_synchronously
                      //   context
                      //       .read<AddMedicineBloc>()
                      //       .add(MetricIndexEvent(result));
                      // }
                    },
                    tileColor: Colors.transparent,
                    title: Text(
                      state.metricIndex != null
                          ? state.metrics[state.metricIndex!].getName(1)
                          : context.translate('select_medication_type'),
                      style: context.theme.textTheme.titleMedium!.copyWith(
                        fontSize: 14,
                        color: state.metricIndex == null ? context.color.onBackground50 : null,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: state.medicineNameTextFieldStatus.isDisable ||
                      state.metricIndex == null ||
                      (state.metricIndex ?? 0) >= state.metrics.length
                  ? null
                  : () {
                      FocusScope.of(context).unfocus();
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    },
              child: Text(
                context.translate('continue'),
              ),
            ),
          ),
        ),
      );
}
