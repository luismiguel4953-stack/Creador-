import 'package:equatable/equatable.dart';

/// User Entity
/// Business entity representing a user in the domain layer

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const UserEntity({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, email, displayName, photoUrl, createdAt, updatedAt];
}