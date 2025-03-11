import 'package:tickbook/domain/entities/result.dart';
import 'package:tickbook/domain/entities/user.dart';

abstract class UserRepositories {
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    int balance = 0,
  });

  Future<Result<User>> getUser({required String uid});
  Future<Result<User>> updateUser({required User user});
  Future<Result<User>> getUserBalance({required String uid});
  Future<Result<User>> updateUserBalance({
    required String uid,
    required int balance,
  });
}
