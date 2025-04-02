import '../../../../../../bloc/sub_purpose/sub_purpose_bloc.dart';

class MedicationFilesArgs {
  MedicationFilesArgs({
    this.naznachenieId,
    this.illName,
    this.bloc,
  });

  final String? naznachenieId;
  final String? illName;
  final SubPurposeBloc? bloc;

  @override
  String toString() => 'MedicationFilesArgs{naznachenieId: $naznachenieId, bloc: $bloc}';
}
