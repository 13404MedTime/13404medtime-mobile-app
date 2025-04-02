part of 'package:madadio_client_mobile/src/presentation/pages/auth/register/sub_pages/register_first_stage.dart';

mixin RegisterFirstStageMixin on State<RegisterFirstStagePage> {
  late final TextEditingController _firstNameController = TextEditingController();
  late final TextEditingController _lastNameController = TextEditingController();
  late final TextEditingController _addressController = TextEditingController();
  late final TextEditingController _tgUsernameController = TextEditingController();
  late final TextEditingController _dateController = TextEditingController();
  late final TextEditingController _passportController = TextEditingController();
  DateTime initialDateTime = DateTime.now();

  // String dateTime = '';
  // String selectedBloodGroup = '';
  // late final RegisterBloc _bloc = context.read<RegisterBloc>();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = context.read<RegisterBloc>().state.name;
    _lastNameController.text = context.read<RegisterBloc>().state.surname;
    _tgUsernameController.text = context.read<RegisterBloc>().state.tgUsername;
    _addressController.text = context.read<RegisterBloc>().state.userAddress;
    _dateController.text = context.read<RegisterBloc>().state.dateOfBirth;
    _passportController.text = context.read<RegisterBloc>().state.passportNumber;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    // _firstNameController.dispose();
    // _lastNameController.dispose();
    // _tgUsernameController.dispose();
    // _addressController.dispose();
    // _dateController.dispose();
    // _passportController.dispose();
  }

// Future<void> _registerUser() async {
//   final fcmToken = await FirebaseMessaging.instance.getToken();
//   final isIOS = Platform.isIOS;
//   context.read<RegisterBloc>().add(
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
