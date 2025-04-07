part of '../doctor_home_page.dart';

mixin DoctorHomePageMixin on State<DoctorHomePage>{
  late final TextEditingController _rejectCommentController;

  @override
  void initState() {
    super.initState();
    _rejectCommentController = TextEditingController();
  }

  @override
  void dispose() {
    _rejectCommentController.dispose();
    super.dispose();
  }
}