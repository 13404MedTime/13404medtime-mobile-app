import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/connectivity/network_info.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/either_dart/either.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/client_medicine_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/clients_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/get_all_medicine_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/send_advice_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/unit_of_medicine.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_check/medicine_full_info_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_check/patient_medication_response.dart';
import '../../../../network/api_client.dart';
import '../../../../network/failure.dart';
import '../../../../network/server_error.dart';

part 'doctor_advice_repository_impl.dart';

abstract class DoctorAdviceRepository {
  const DoctorAdviceRepository();

  Future<Either<Failure, ClientsResponse>> getClients({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, ClientMedicineResponse>> getMedicine({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, SendAdviceResponse>> sendAdvice({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, UnitOfMedicineResponse>> getUnitOfMedicine({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, void>> sendFullAdvice({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, MedicineFullInfoResponse>> getMedicineFullInfo({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, GetAllMedicinesResponse>> getAllMedicine({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, PatientMedicationResponse>> getPatientMedication({
    required Map<String, dynamic> request,
  });
}
