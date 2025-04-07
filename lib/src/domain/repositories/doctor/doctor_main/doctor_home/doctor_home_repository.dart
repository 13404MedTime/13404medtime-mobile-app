import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/connectivity/network_info.dart';
import '../../../../../core/either_dart/either.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/clients_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_check/doctor_appointment_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_check/doctor_notifications_reponse.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_check/medicine_full_info_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_home/doctor_patient_response.dart';
import '../../../../../data/models/home/get_visits/book_doctor_response.dart';
import '../../../../../data/models/home/get_visits/doctor_booking_request_response.dart';
import '../../../../network/api_client.dart';
import '../../../../network/failure.dart';
import '../../../../network/server_error.dart';

part 'doctor_home_repository_impl.dart';

abstract class DoctorHomeRepository {
  const DoctorHomeRepository();

  Future<Either<Failure, DoctorPatientResponse>> getPatient({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, void>> deleteDoctorFreeTime({
    required String timeId,
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, ClientsResponse>> getClients({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, DoctorNotificationsResponse>> getNotifications({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, DoctorBookingRequestResponse>> getDoctorBookingRequests({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, void>> updateDoctorRequest({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, BookDoctorResponse>> bookDoctor({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, DoctorAppointmentResponse>> getAppointments({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, MedicineFullInfoResponse>> getMedicineInfo({
    required Map<String, dynamic> request,
  });
}
