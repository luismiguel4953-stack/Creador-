import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

/// Local Data Source Interface
/// Defines contract for local data operations

abstract class LocalDataSource {
  // TODO: Define local data source methods
  // Example methods:
  // Future<void> cacheUser(UserModel user);
  // Future<UserModel?> getCachedUser();
}

/// Implementation of Local Data Source
class LocalDataSourceImpl implements LocalDataSource {
  // TODO: Implement local data operations using AppDatabase
}