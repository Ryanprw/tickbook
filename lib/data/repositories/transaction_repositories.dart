import 'package:tickbook/domain/entities/result.dart';
import 'package:tickbook/domain/entities/transaction.dart';

abstract interface class TransactionRepositories {
  Future<Result<Transaction>> createTransaction({
    required Transaction transaction,
  });
  Future<Result<List<Transaction>>> getUserTransactions({required String uid});
}
