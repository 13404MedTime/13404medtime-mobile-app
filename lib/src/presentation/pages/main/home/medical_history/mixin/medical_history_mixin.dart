part of '../medical_history_page.dart';

mixin MedicalHistoryMixin on State<MedicalHistoryPage> {
  late final TextEditingController _searchController = TextEditingController();
  late final FocusNode _searchNode = FocusNode();
  final List<Map<String, dynamic>> list = [
    {
      'title': 'Лечение лёгких',
      'subtitle': 'Таблетки стрепсилс',
      'list': <String>[
        '2 таблетки в 16:00',
        '6 таблеток в 21:00',
      ],
      'imageUrl': 'https://randomuser.me/api/portraits/men/${Random().nextInt(99) + 1}.jpg',
      'name': 'Талатова Елена',
    },
    {
      'title': 'Боль в горле',
      'subtitle': 'Йодомарин',
      'list': <String>[],
      'imageUrl': 'https://randomuser.me/api/portraits/men/${Random().nextInt(99) + 1}.jpg',
      'name': 'Игорь Алиханов',
    },
    {
      'title': 'Боль в горле',
      'subtitle': 'Таблетки стрепсилс',
      'list': <String>[
        '2 таблетки в 16:00',
        '6 таблеток в 21:00',
      ],
      'imageUrl': 'https://randomuser.me/api/portraits/men/${Random().nextInt(99) + 1}.jpg',
      'name': 'Талатова Елена',
    },
    {
      'title': 'Боль в горле',
      'subtitle': 'Таблетки стрепсилс 23 марта',
      'list': <String>[],
      'imageUrl': 'https://randomuser.me/api/portraits/men/${Random().nextInt(99) + 1}.jpg',
      'name': 'Талатова Елена',
    },
  ];
  final List<MedicalHistoryModel> list2 = [
    MedicalHistoryModel(title: 'Назначения', list: [
      MedicalItemModel(
        name: 'Эдем',
        description: 'Для устранения аллергических',
        imageUrl: 'https://api.gopharm.uz/media/drugs-thumbnail/6d023b12-f4b7-49ca-aa11-f078dce1981a.jpg',
      ),
      MedicalItemModel(
        name: 'Аллер - Ж',
        description: 'Для устранения аллергических',
        imageUrl:
            'https://pharmaclick.uz/upload/ammina.optimizer/jpg-webp/q80/upload/resize_cache/iblock/d88/1500_1500_1a35b42a0a6b3f965a22c6480f3b236ff/217r4lcgea486l9svm1yuh07p466xdrt.webp',
      ),
    ]),
    MedicalHistoryModel(title: 'Врачи', list: [
      MedicalItemModel(
        isMember: true,
        name: 'Ирина Голубина',
        description: 'Akfa Medline',
        imageUrl: 'https://clinics.uz/images/doctors/7m6rpzAL9AOFC47mcOSqURFTafRI44caBW4Q0aPj_medium.jpg',
        experience: '2 года опыта',
      ),
      MedicalItemModel(
        isMember: true,
        name: 'Вова Шахмаметов',
        description: 'Medion',
        imageUrl:
            'https://sun1-25.userapi.com/s/v1/ig2/vGsmwkd7GXmjKRvUQIy26DAUip8Gf0NfQ-0cjekT4RqUiIp7z0mg8944jHqvj2PAhSmBBrxYDr_P5qvvXBXTIcx4.jpg?size=400x400&quality=96&crop=0,0,639,639&ava=1',
        experience: '2 года опыта',
      ),
    ]),
    MedicalHistoryModel(title: 'Категории', list: [
      MedicalItemModel(
        name: 'Аллергическая заболевание',
        description: 'Общая консультация',
        imageUrl:
            'https://png.pngtree.com/png-clipart/20210912/original/pngtree-spring-pollen-allergy-rhinitis-sneezing-png-image_6723899.jpg',
      ),
      MedicalItemModel(
        name: 'Терапевт',
        description: 'Если есть проблемы с шейным',
        imageUrl:
            'https://png.pngtree.com/element_our/20190530/ourlarge/pngtree-medical-doctor-cartoon-illustration-image_1241820.jpg',
      ),
    ]),
  ];

  void _initControllers() {
    _searchNode.addListener(() {
      setState(() {});
    });
    _searchController.addListener(() {
      setState(() {});
    });
  }
}

class MedicalHistoryModel {
  MedicalHistoryModel({
    this.title = '',
    this.list = const [],
  });

  final String title;
  final List<MedicalItemModel> list;
}

class MedicalItemModel {
  MedicalItemModel({
    this.name = '',
    this.description = '',
    this.imageUrl = '',
    this.isMember = false,
    this.experience = '',
  });

  final String name;
  final String description;
  final String imageUrl;
  final bool isMember;
  final String experience;
}
