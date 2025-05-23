part of '../profile_page.dart';

mixin ProfileMixin on State<ProfilePage> {
  late TextEditingController telegramNicNameController;
  late FocusNode telegramNicNameFocusNode;

  @override
  void initState() {
    super.initState();
    initController();
  }

  @override
  void dispose() {
    super.dispose();
    disposeController();
  }

  void initController() {
    telegramNicNameController = TextEditingController();
    telegramNicNameFocusNode = FocusNode();
  }

  void disposeController() {
    telegramNicNameFocusNode.dispose();
    telegramNicNameController.dispose();
  }
}
