part of '../my_visit_page.dart';

mixin MyVisitMixin on State<MyVisitPage> {
  late final MyVisitBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<MyVisitBloc>();
    if (widget.arguments?.isHavePurpose ?? false) {
      _bloc.add(GetVisitEvent(guid: widget.arguments?.myVisit?.guid ?? ''));
    }
  }
}
