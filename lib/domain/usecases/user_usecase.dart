import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../repositories/user_repository.dart';

/// User Use Cases
/// Contains business logic for user-related operations

class UserUseCases {
  final UserRepository userRepository;

  UserUseCases({required this.userRepository});

  /// Create new user account
  Future<Either<Failure, void>> createUser({
    required String email,
    required String password,
  }) async {
    return userRepository.createUser(email, password);
  }

  /// Login user
  Future<Either<Failure, void>> loginUser({
    required String email,
    required String password,
  }) async {
    return userRepository.loginUser(email, password);
  }

  /// Logout current user
  Future<Either<Failure, void>> logout() async {
    return userRepository.logout();
  }
}