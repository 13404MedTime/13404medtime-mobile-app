import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../config/router/routes_arguments.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/isolate/download_file.dart';
import '../../../../core/isolate/upload_file.dart';
import '../../../../data/models/survey/get_analysis_survey/analysis_survey_request.dart';
import '../../../../data/models/survey/get_analysis_survey/analysis_survey_response.dart';
import '../../../../data/models/survey/uploade_file_image/upload_file_image_request.dart';
import '../../../../domain/repositories/survey/survey_repository.dart';
import '../../../pages/main/home/survey/survey_page.dart';

part 'survey_bloc.freezed.dart';
part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  SurveyBloc({required this.surveyRepository}) : super(const SurveyState()) {
    on<GetAnalysisSurveyEvent>(_getAnalysisSurvey);
    on<SearchSurveyEvent>(_searchSurvey);
    on<UploadFleImageEvent>(_uploadFileImage);
    on<StopSuccessStateEvent>(_stopSuccessState);
    on<SurveySelectedEvent>(_getSelectedSurvey);
  }

  final SurveyRepository surveyRepository;

  Future<void> _getSelectedSurvey(
    SurveySelectedEvent event,
    Emitter<SurveyState> emit,
  ) async {
    emit(state.copyWith(isAnalysisSurveyLoading: true));
    final url = event.survey.file ?? '';
    final filename = url.split('/').last;
    final String path = await getFilePath(filename, '');
    await Permission.storage.request();
    if (await File(path).exists()) {
      await OpenFilex.open(path);
      emit(state.copyWith(isAnalysisSurveyLoading: false));
      return;
    }
    try {
      await downloadFile(url: url, path: path);
      await OpenFilex.open(path);
      emit(state.copyWith(isAnalysisSurveyLoading: false));
    } on Exception catch (e, s) {
      log('Exception $e $s $path');
      ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('file_could_not_opened'.tr()),
        ),
      );
      emit(state.copyWith(isAnalysisSurveyLoading: false));
      return;
    }
    return;
  }

  Future<void> _getAnalysisSurvey(
    GetAnalysisSurveyEvent event,
    Emitter<SurveyState> emit,
  ) async {
    emit(state.copyWith(isAnalysisSurveyLoading: true));
    final response = await surveyRepository.getAnalysisSurvey(
      AnalysisSurveyRequest(
        data: AnalysisSurveyDataRequest(
          cleintsId: localSource.userId,
          order: AnalysisSurveyOrderRequest(
            createdAt: -1,
          ),
        ),
      ),
    );
    response.fold(
      (error) {
        emit(state.copyWith(isAnalysisSurveyLoading: false));
      },
      (response) {
        final List<AnalysisSurveyMainResponse> surveys = response.data?.data?.response ?? [];
        final Set taskDate = {};

        for (final task in surveys) {
          taskDate.add((task.date ?? '2023-07-18T04:55:46.687Z').dateTime1);
        }

        final List<InnerList> tasksByCreateAdd = [];
        for (final date in taskDate) {
          final List<AnalysisSurveyMainResponse> userSurveys = [];
          for (final AnalysisSurveyMainResponse task in surveys) {
            if (date == (task.date ?? '2023-07-18T04:55:46.687Z').dateTime1) {
              userSurveys.add(task);
            }
          }
          tasksByCreateAdd.add(
            InnerList(date: date, surveys: userSurveys),
          );
        }

        emit(
          state.copyWith(
            isAnalysisSurveyLoading: false,
            analysisSurvey: response.data?.data?.response ?? [],
            innerListAnalysisSurvey: tasksByCreateAdd,
          ),
        );
        localSource.setSurveyCount((response.data?.data?.count ?? 0).toInt());
      },
    );
  }

  void _searchSurvey(SearchSurveyEvent event, Emitter<SurveyState> emit) {
    if (event.searchText.isEmpty) {
      emit(
        state.copyWith(innerListAnalysisSurveySearch: []),
      );
      return;
    }
    final List<InnerList> newList = [];
    for (int i = 0; i < state.innerListAnalysisSurvey.length; i++) {
      final searchedItemsList = state.innerListAnalysisSurvey[i].surveys
          .where((element) =>
              element.image!.toLowerCase().contains(event.searchText.toLowerCase()) ||
              element.file!.toLowerCase().contains(event.searchText.toLowerCase()))
          .toList();
      final InnerList ahmad = InnerList(date: state.innerListAnalysisSurvey[i].date, surveys: searchedItemsList);
      // if (searchedItemsList.isNotEmpty)
      newList.add(ahmad);
    }
    emit(
      state.copyWith(innerListAnalysisSurveySearch: newList),
    );
  }

  Future<void> _uploadFileImage(
    UploadFleImageEvent event,
    Emitter<SurveyState> emit,
  ) async {
    emit(state.copyWith(isUploadFileImageLoading: true));
    final String name = event.result is SurveyPageUploadFileArgument
        ? event.result.selectedFileName
        : event.result.file.path.split('/').last;

    final value = await uploadFile(
      file: event.result.file,
      selectedFileName: event.result.selectedFileName,
    );
    String file = '';
    String image = '';
    if (value.contains('docs')) {
      file = value;
    } else {
      image = value;
    }
    final response = await surveyRepository.uploadFileImage(
      UploadFileImageRequest(
        data: UploadFileImageDataRequest(
          cleintsId: localSource.userId,
          fileTitle: name,
          file: file,
          image: image,
        ),
      ),
    );
    response.fold(
      (error) {
        emit(state.copyWith(isUploadFileImageLoading: false));
      },
      (response) {
        emit(
          state.copyWith(
            isUploadFileImageLoading: false,
            isUploadFileImageSuccess: true,
          ),
        );
      },
    );
  }

  void _stopSuccessState(StopSuccessStateEvent event, Emitter<SurveyState> emit) {
    emit(
      state.copyWith(
        isUploadFileImageSuccess: false,
      ),
    );
  }
}

///
///
///
///
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:madadio_client_mobile/src/config/router/app_routes.dart';
// import 'package:madadio_client_mobile/src/data/models/survey/get_analysis_survey/analysis_survey_request.dart';
// import 'package:madadio_client_mobile/src/data/models/survey/get_analysis_survey/analysis_survey_response.dart';
// import 'package:madadio_client_mobile/src/data/models/survey/uploade_file_image/upload_file_image_request.dart';
// import 'package:madadio_client_mobile/src/domain/repositories/survey/survey_repository.dart';
//
// part 'survey_bloc.freezed.dart';
//
// part 'survey_event.dart';
//
// part 'survey_state.dart';
//
// class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
//   SurveyBloc({required this.surveyRepository}) : super(const SurveyState()) {
//     on<GetAnalysisSurveyEvent>(_getAnalysisSurvey);
//     on<SurveySelectedEvent>(_surveySelected);
//     on<SearchSurveyEvent>(_searchSurvey);
//     on<UploadFleImageEvent>(_uploadFileImage);
//     on<StopSuccessStateEvent>(_stopSuccessState);
//   }
//
//   final SurveyRepository surveyRepository;
//
//   Future<void> _getAnalysisSurvey(
//       GetAnalysisSurveyEvent event, Emitter<SurveyState> emit) async {
//     emit(state.copyWith(
//       isAnalysisSurveyLoading: true,
//     ));
//     final response = await surveyRepository.getAnalysisSurvey(
//       AnalysisSurveyRequest(
//         data: AnalysisSurveyDataRequest(
//           cleintsId: localSource.userId,
//           order: AnalysisSurveyOrderRequest(
//             createdAt: -1,
//           ),
//         ),
//       ),
//     );
//     response.fold(
//       (error) {
//         emit(state.copyWith(
//           isAnalysisSurveyLoading: false,
//         ));
//       },
//       (response) {
//         final List<AnalysisSurveyMainResponse> surveys =
//             response.data?.data?.response ?? [];
//
//         emit(
//           state.copyWith(
//             isAnalysisSurveyLoading: false,
//             analysisSurvey: surveys,
//           ),
//         );
//         localSource.setSurveyCount((response.data?.data?.count ?? 0).toInt());
//       },
//     );
//   }
//
//   void _searchSurvey(SearchSurveyEvent event, Emitter<SurveyState> emit) {
//     if (event.searchText.isEmpty) {
//       emit(
//         state.copyWith(searchedSurveys: []),
//       );
//       return;
//     }
//     final List<AnalysisSurveyMainResponse> searchedList = [];
//     for (int i = 0; i < state.searchedSurveys.length; i++) {
//       final searchedAnalysis = state.searchedSurveys[i];
//       if (searchedAnalysis.image!
//               .toLowerCase()
//               .contains(event.searchText.toLowerCase()) ||
//           searchedAnalysis.file!
//               .toLowerCase()
//               .contains(event.searchText.toLowerCase())) {
//         searchedList.add(searchedAnalysis);
//       }
//     }
//     emit(state.copyWith(searchedSurveys: searchedList));
//   }
//
//   Future<void> _uploadFileImage(
//       UploadFleImageEvent event, Emitter<SurveyState> emit) async {
//     emit(state.copyWith(
//       isUploadFileImageLoading: true,
//     ));
//     String file = '';
//     String image = '';
//     if (event.fileImage.contains('docs')) {
//       file = event.fileImage;
//     } else {
//       image = event.fileImage;
//     }
//     final response = await surveyRepository.uploadFileImage(
//       UploadFileImageRequest(
//         data: UploadFileImageDataRequest(
//           cleintsId: localSource.userId,
//           fileTitle: event.fileTitle,
//           file: file,
//           image: image,
//         ),
//       ),
//     );
//     response.fold(
//       (error) {
//         emit(state.copyWith(
//           isUploadFileImageLoading: false,
//         ));
//       },
//       (response) {
//         emit(
//           state.copyWith(
//             isUploadFileImageLoading: false,
//             isUploadFileImageSuccess: true,
//           ),
//         );
//       },
//     );
//   }
//
//   void _stopSuccessState(
//       StopSuccessStateEvent event, Emitter<SurveyState> emit) {
//     emit(
//       state.copyWith(
//         isUploadFileImageSuccess: false,
//       ),
//     );
//   }
//
//   void _surveySelected(
//     SurveySelectedEvent event,
//     Emitter<SurveyState> emit,
//   ) =>
//       emit(state.copyWith(selectedSurveyIndex: event.index));
// }
