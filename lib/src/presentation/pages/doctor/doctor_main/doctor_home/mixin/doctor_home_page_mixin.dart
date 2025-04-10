part of '../doctor_home_page.dart';

mixin DoctorHomePageMixin on State<DoctorHomePage> {
  late final TextEditingController _rejectCommentController;
  late final ScrollController _scrollController;

  void _getNext() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.position.pixels) {
      context
          .read<DoctorHomeBloc>()
          .add(const GetNextPatients$DoctorHomeEvent(true));
      context.read<DoctorHomeBloc>().add(const GetPatients$DoctorHomeEvent());
    }
  }

  @override
  void initState() {
    super.initState();
    _rejectCommentController = TextEditingController();
    _scrollController = ScrollController()..addListener(_getNext);
  }

  @override
  void dispose() {
    _rejectCommentController.dispose();
    _scrollController
      ..removeListener(_getNext)
      ..dispose();
    super.dispose();
  }
}
