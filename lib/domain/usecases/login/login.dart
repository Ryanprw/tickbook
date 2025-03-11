import 'package:tickbook/data/repositories/authentication.dart';
import 'package:tickbook/data/repositories/user_repositories.dart';
import 'package:tickbook/domain/entities/result.dart';
import 'package:tickbook/domain/entities/user.dart';
import 'package:tickbook/domain/usecases/usecase.dart';

part 'login_params.dart';

class Login implements UseCase<Result<User>, LoginParams> {
  final Authentication authentication;
  final UserRepositories userRepositories;

  Login({required this.authentication, required this.userRepositories});

  @override
  Future<Result<User>> call(LoginParams params) async {
    var idResult = await authentication.login(
      email: params.email,
      password: params.password,
    );

    if (idResult is Success) {
      var userResult = await userRepositories.getUser(
        uid: idResult.resultValue!,
      );

      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(:final message) => Result.failed(message),
      };
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
