part of 'package:madadio_client_mobile/src/presentation/pages/main/health/health_page.dart';

mixin HealthMixin on State<HealthPage> {
  late final HealthBloc _bloc = context.read<HealthBloc>();

  @override
  void initState() {
    super.initState();
    _initial();
  }

  void _initial() {
    _bloc
      ..add(const GetPedometerEvent())
      ..add(const GetArterialPressureEvent())
      ..add(const GetBloodSugarEvent())
      ..add(const GetTWHEvent());
  }

  Future<void> _listener(BuildContext context, MainState state) async {
    if (state.bottomMenu.index == 2 && Platform.isAndroid) {
    
      if (!localSource.isGoogleFitInstalled &&
          !context
              .read<HealthBloc>()
              .state
              .remindMeGoogleFitInstallationLater) {
        await customYesNoDialog<void>(
          context: context,
          barrierDismissible: false,
          acceptOnTap: () {
            context.read<HealthBloc>().add(
                  PushPlayMarketForInstallGoogleFitEvent(
                    context: context,
                    isFromDialog: true,
                  ),
                );
          },
          cancelOnTap: () {
            context.read<HealthBloc>().add(
                  const GoogleFitInstallationEvent(later: true),
                );
            Navigator.pop(context);
          },
          closeOnTap: () {
            context.read<HealthBloc>().add(
                  const GoogleFitInstallationEvent(later: true),
                );
            Navigator.pop(context);
          },
          acceptButtonText: context.translate('install'),
          cancelButtonText: context.translate('later'),
          title: context.translate('install_google_fit'),
          content: context.translate('installation_dialog_body'),
        );
      } else if (!localSource.isRegisteredFromGoogleFit &&
          !context
              .read<HealthBloc>()
              .state
              .remindMeGoogleFitRegistrationLater &&
          localSource.isGoogleFitInstalled) {
        await customYesNoDialog<void>(
          context: context,
          barrierDismissible: false,
          acceptOnTap: () async {
            context.read<HealthBloc>().add(
                  const PushGoogleFitForRegistrationEvent(),
                );
            Navigator.pop(context);
          },
          cancelOnTap: () {
            context.read<HealthBloc>().add(
                  const GoogleFitRegistrationEvent(later: true),
                );
            Navigator.pop(context);
          },
          closeOnTap: () {
            context.read<HealthBloc>().add(
                  const GoogleFitRegistrationEvent(later: true),
                );
            Navigator.pop(context);
          },
          acceptButtonText: context.translate('register'),
          cancelButtonText: context.translate('later'),
          title: context.translate('registration_google_fit'),
          content: context.translate('registration_google_fit_body'),
        );
      }
    }
  }
}
