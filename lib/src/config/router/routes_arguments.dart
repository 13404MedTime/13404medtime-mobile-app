import 'dart:io';

import '../../presentation/bloc/main/profile/favourite_doctor/favourite_doctor_bloc.dart';

class HomePageArgument {
  HomePageArgument({this.isFromPayme = false});

  final bool? isFromPayme;
}

class MyVisitArgument {
  MyVisitArgument({
    this.isHavePurpose = true,
    this.myVisit,
    this.doctor,
    this.favoriteBloc,
  });

  final bool isHavePurpose;
  final DoctorIdData? doctor;
  final MyVisitModel? myVisit;
  final FavouriteDoctorBloc? favoriteBloc;
}

class SurveyPageUploadFileArgument {
  SurveyPageUploadFileArgument({
    required this.selectedFileName,
    required this.file,
  });

  final String selectedFileName;
  final File file;
}

class PaymentMethodsPageArgument {
  PaymentMethodsPageArgument({
    required this.subscriptionId,
    required this.subscriptionName,
    required this.subscriptionPrice,
    required this.afterPriceText,
    required this.features,
    required this.consultationCounts,
  });

  final String subscriptionId;
  final String subscriptionName;
  final num subscriptionPrice;
  final String afterPriceText;
  final List<String> features;
  final num consultationCounts;
}
