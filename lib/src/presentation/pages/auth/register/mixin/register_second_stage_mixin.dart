part of 'package:madadio_client_mobile/src/presentation/pages/auth/register/sub_pages/register_second_stage.dart';

mixin RegisterSecondStageMixin on State<RegisterSecondStagePage> {
  String dateTime = '';
  String selectedBloodGroup = '';
  late final RegisterBloc _bloc = context.read<RegisterBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.close();
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    // _passportController.dispose();
  }

// Future<void> _registerUser() async {
//   final fcmToken = await FirebaseMessaging.instance.getToken();
//   final isIOS = Platform.isIOS;
//   _bloc.add(
//     RegisterEvent.userRegister(
//       additionalProps: {
//         'client_name': _firstNameController.text.trim(),
//         'cleint_lastname': _lastNameController.text.trim(),
//         'adres': _addressController.text.trim(),
//         'phone_number': widget.phone.trim(),
//         'blood_group': selectedBloodGroup.trim(),
//         'table_slug': 'cleints',
//         'fcm_token': fcmToken,
//         'user_lang': localSource.locale,
//         'platform': isIOS ? 0 : 1,
//         'birth_date': dateTime,
//         'pasport': _passportController.text.trim()
//       },
//       onSuccess: (){},
//       phoneNumber: widget.phone.trim(),
//       bloodGroup: selectedBloodGroup.trim(),
//       firstName: _firstNameController.text.trim(),
//       lastName: _lastNameController.text.trim(),
//       dateOfBirth: _dateController.text.trim(),
//       passport: _passportController.text.trim(),
//       address: _addressController.text.trim(),
//     ),
//   );
// }
}
