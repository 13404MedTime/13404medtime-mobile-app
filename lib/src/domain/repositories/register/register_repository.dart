import '../../../core/either_dart/either.dart';
import '../../../data/models/auth/register/register_user_response.dart';
import '../../network/failure.dart';

abstract class RegisterUserRepository {
  Future<Either<Failure, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, dynamic>> forBalanceId({
    required Map<String, dynamic> request,
  });
}
