import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

/// User Repository Interface
/// Defines contract for user-related operations

abstract class UserRepository {
  /// Create a new user account
  Future<Either<Failure, void>> createUser(String email, String password);

  /// Login existing user
  Future<Either<Failure, void>> loginUser(String email, String password);

  /// Logout current user
  Future<Either<Failure, void>> logout();
}