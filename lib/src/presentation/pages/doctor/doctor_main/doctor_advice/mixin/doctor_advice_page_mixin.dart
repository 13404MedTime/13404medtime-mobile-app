part of '../doctor_advice_page.dart';

mixin DoctorAdvicePageMixin on State<DoctorAdvicePage> {
  late final TextEditingController phoneController;
  late final TextEditingController firstnameController;
  late final TextEditingController lastnameController;
  late final TextEditingController medicineController;
  late final TextEditingController commentController;

  /// Bottom Sheet controllers
  late final TextEditingController medicineNameController;
  late final TextEditingController medicineTypeController;
  late final TextEditingController medicineEventController;
  late final TextEditingController medicineDescriptionController;
  late final TextEditingController medicineDaysController;
  late final TextEditingController medicineTimesController;
  late final TextEditingController medicineDozeController;
  late final TextEditingController medicineReserveController;

  void deletePhoneNumber() {
    if (phoneController.text.length > 13) {
      phoneController.text = phoneController.text.substring(0, 13);
    }
    if (phoneController.text.length < 4) {
      phoneController.text = '+998';
    }
  }

  void onlyNumber(TextEditingController controller) {
    if (int.tryParse(controller.text) == null) {
      controller.text = controller.text.substring(0, controller.text.length - 1);
    }
  }

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController()
      ..value = const TextEditingValue(text: '+998')
      ..addListener(deletePhoneNumber);
    medicineController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    commentController = TextEditingController();

    /// Bottom Sheet controllers
    medicineNameController = TextEditingController();
    medicineTypeController = TextEditingController();
    medicineEventController = TextEditingController();
    medicineDescriptionController = TextEditingController();
    medicineDaysController = TextEditingController();
    medicineTimesController = TextEditingController();
    medicineDozeController = TextEditingController()
      ..addListener(
        () {
          onlyNumber(medicineDozeController);
        },
      );
    medicineReserveController = TextEditingController()
      ..addListener(() {
        onlyNumber(medicineReserveController);
      });
  }

  @override
  void dispose() {
    phoneController
      ..removeListener(deletePhoneNumber)
      ..dispose();
    medicineController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    commentController.dispose();

    /// Bottom Sheet controllers
    medicineNameController.dispose();
    medicineTypeController.dispose();
    medicineEventController.dispose();
    medicineDescriptionController.dispose();
    medicineDaysController.dispose();
    medicineTimesController.dispose();
    medicineDozeController.dispose();
    medicineReserveController.dispose();
    super.dispose();
  }

  InputDecoration inputDesign(String hintText, BuildContext context) => InputDecoration(
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
        contentPadding: AppUtils.kPaddingHor12Ver4,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: context.color.onBackground50,
        ),
        filled: true,
        fillColor: context.color.disabledCard,
      );
}
