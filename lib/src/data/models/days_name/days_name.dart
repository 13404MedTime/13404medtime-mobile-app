class DaysName {
  DaysName({
    required this.name,
    required this.isSelected,
  });

  String name;
  bool isSelected;

  static List<DaysName> days = [
    DaysName(
      name: 'Пн',
      isSelected: false,
    ),
    DaysName(
      name: 'Вт',
      isSelected: false,
    ),
    DaysName(
      name: 'Ср',
      isSelected: false,
    ),
    DaysName(
      name: 'Чт',
      isSelected: false,
    ),
    DaysName(
      name: 'Пт',
      isSelected: false,
    ),
    DaysName(
      name: 'Сб',
      isSelected: false,
    ),
    DaysName(
      name: 'Вс',
      isSelected: false,
    ),
  ];
}
