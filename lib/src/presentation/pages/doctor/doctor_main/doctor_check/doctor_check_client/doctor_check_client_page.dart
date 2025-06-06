import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../data/models/doctor/doctor_main/doctor_check/patient_medication_response.dart';
import '../../../../../bloc/doctor/doctor_main/doctor_check/doctor_check_client/doctor_check_client_bloc.dart';

class DoctorCheckClientPage extends StatefulWidget {
  const DoctorCheckClientPage({
    super.key,
    required this.name,
    required this.guid,
  });

  final String name;
  final String guid;

  @override
  State<DoctorCheckClientPage> createState() => _DoctorCheckClientPageState();
}

class _DoctorCheckClientPageState extends State<DoctorCheckClientPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (result != null &&
                  result.day <= DateTime.now().day &&
                  context.mounted) {
                context.read<DoctorCheckClientBloc>().add(
                      GetMedicineInfo$DoctorCheckClientEvent(
                        guid: widget.guid,
                        endDate: result
                            .add(const Duration(days: 1))
                            .toIso8601String(),
                        startDate: result.toIso8601String(),
                      ),
                    );
              }
            },
            icon: const Icon(Icons.calendar_month),
          ),
          AppUtils.kGap12,
        ],
      ),
      body: BlocBuilder<DoctorCheckClientBloc, DoctorCheckClientState>(
        builder: (context, state) {
          Map<String, List<ResponseItem>> sorted = {};
          for (final i in state.medicines) {
            final date = i.timeTake.yyyyMMdd;
            if (sorted[date] == null) {
              sorted[date] = [i];
            } else {
              sorted[date]!.add(i);
              sorted[date] = sorted[date]!
                ..sort((i, j) => j.timeTake.compareTo(i.timeTake));
            }
          }
          sorted = Map.fromEntries(
              sorted.entries.toList()..sort((a, b) => b.key.compareTo(a.key)));
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: AppUtils.kPaddingAll16,
                    child: sorted.isEmpty
                        ? const Column(
                            children: [
                              SizedBox(height: 150),
                              Center(
                                child: Image(
                                  width: 250,
                                  image:
                                      AssetImage('assets/png/subscription.png'),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (final dateGroup in sorted.entries) ...[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: context.colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 16,
                                        color: context
                                            .colorScheme.onPrimaryContainer,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        dateGroup.key
                                            .split('.')
                                            .reversed
                                            .join('.'),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: context
                                              .colorScheme.onPrimaryContainer,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                for (final medication in dateGroup.value) ...[
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: context.colorScheme.outline
                                            .withOpacity(0.2),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16),
                                      title: Text(
                                        medication.preparatiIdData.brandName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 14,
                                            color: context.colorScheme.primary,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${DateTime.parse(medication.timeTake)
                                                    .add(const Duration(
                                                        hours: 5))
                                                    .hour
                                                    .toString()
                                                    .padLeft(2, '0')}:${DateTime.parse(
                                                        medication.timeTake)
                                                    .add(const Duration(
                                                        hours: 5))
                                                    .minute
                                                    .toString()
                                                    .padLeft(2, '0')}',
                                            style: TextStyle(
                                              color:
                                                  context.colorScheme.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                          value: medication.isTake,
                                          onChanged: (_) {},
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          activeColor:
                                              context.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                                const SizedBox(height: 16),
                              ],
                            ],
                          ),
                  ),
                );
        },
      ));
}
