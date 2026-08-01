import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../service_locator.dart';

/// Authentication Providers
/// Riverpod providers for authentication state management

// Firebase Auth instance provider
final firebaseAuthProvider = Provider((ref) {
  return getIt<FirebaseAuth>();
});

// Current user provider
final currentUserProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

// Authentication state notifier
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AsyncValue<void>>(
  (ref) => AuthNotifier(ref.watch(firebaseAuthProvider)),
);

class AuthNotifier extends StateNotifier<AsyncValue<void>> {
  final FirebaseAuth _firebaseAuth;

  AuthNotifier(this._firebaseAuth) : super(const AsyncValue.data(null));

  /// Login with email and password
  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  /// Register with email and password
  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  /// Logout
  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _firebaseAuth.signOut();
    });
  }
}