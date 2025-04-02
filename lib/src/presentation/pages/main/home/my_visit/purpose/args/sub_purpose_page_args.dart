class SubPurposePageArgs {
  SubPurposePageArgs({
    required this.naznachenieId,
    this.title = '',
    required this.illName,
    required this.comment,
  });

  final String naznachenieId;
  final String title;
  final String illName;
  final String comment;
}
