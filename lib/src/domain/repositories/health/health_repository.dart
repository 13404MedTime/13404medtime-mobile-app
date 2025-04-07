part of 'health_repository_impl.dart';

abstract class HealthRepository {
  const HealthRepository();

  Future<Either<Failure, List<PedometerModel>>> getPedometer(
    Map<String, dynamic> request, {
    bool isCache = false,
  });

  Future<Either<Failure, List<ArterialPressureModel>>> getArterialPressure(
    Map<String, dynamic> request, {
    bool isCache = false,
  });

  Future<Either<Failure, List<BloodSugarModel>>> getBloodSugar(
    Map<String, dynamic> request,
  );

  Future<Either<Failure, List<TWHModel>>> getTWH(
    Map<String, dynamic> request, {
    bool isCache = false,
  });

  Future<Either<Failure, HealthResponse>> addHealth({
    required Map<String, dynamic> request,
    required String path,
  });

  Future<Either<Failure, HealthResponse>> addListHealth({
    required List<Map<String, dynamic>> request,
    required String path,
  });
}
