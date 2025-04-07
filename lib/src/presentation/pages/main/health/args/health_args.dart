import '../../../../../data/models/health/sub_health_response.dart';
import '../../../../bloc/health/health_bloc.dart';

enum SubHealthType { pedometer, arterialPressure, bloodSugar, twh }

class SubHealthArgs {
  SubHealthArgs({
    required this.subHealthList,
    required this.bloc,
    required this.type,
  });

  final SubHealthType type;
  final List<SubHealthModel> subHealthList;
  final HealthBloc bloc;
}
