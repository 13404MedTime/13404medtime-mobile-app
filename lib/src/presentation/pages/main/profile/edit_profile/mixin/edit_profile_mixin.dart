part of '../edit_profile_page.dart';

mixin EditProfileMixin on State<EditProfilePage> {
  late final TextEditingController _firstNameController = TextEditingController();
  late final TextEditingController _passportNumberController = TextEditingController();
  late final TextEditingController _addressController = TextEditingController();
  late final TextEditingController _lastNameController = TextEditingController();
  late final TextEditingController _bloodGroupController = TextEditingController();
  late final TextEditingController _dateController = TextEditingController();
  late final ProfileEditBloc _bloc;
  String dateTime = '';
  ValueNotifier<String> selectedBloodGroup = ValueNotifier('');
  late final TextEditingController _telegramNicNameController = TextEditingController();
  late final FocusNode _telegramNicNameFocusNode = FocusNode();
  late DateTime initialDateTime;

  @override
  void initState() {
    super.initState();
    dateTime = localSource.dateOfBirth;
    initialDateTime = dateTime.toDateTime ?? DateTime.now();
    _firstNameController.text = localSource.firstName.trim();
    _lastNameController.text = localSource.lastName.trim();
    _addressController.text = localSource.address.trim();
    _passportNumberController.text = localSource.passportNumber.trim();
    selectedBloodGroup.value = localSource.bloodGroup.trim();
    _dateController.text = localSource.dateOfBirth.trim().toDateTime?.formatDate ?? '';
    _telegramNicNameController.text = localSource.telegramUserName.trim();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!mounted) return;
    _bloc = context.read<ProfileEditBloc>();
  }

  @override
  void dispose() {
    // _bloc.close();
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _passportNumberController.dispose();
    _bloodGroupController.dispose();
    _dateController.dispose();
    _telegramNicNameController.dispose();
    _telegramNicNameFocusNode.dispose();
  }

  void _deleteProfile() {
    _bloc.add(
      const ProfileEditEvent.deleteProfile(),
    );
  }

  void _updateProfile() {
    _bloc.add(
      ProfileEditEvent.updateProfile(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        address: _addressController.text.trim(),
        passportNumber: _passportNumberController.text.trim(),
        bloodGroup: selectedBloodGroup.value.trim(),
        dateOfBirth: dateTime.trim(),
        telegramNicName: _telegramNicNameController.text.trim(),
      ),
    );
  }
}
