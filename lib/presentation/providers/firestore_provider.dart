import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../service_locator.dart';

/// Firestore Providers
/// Riverpod providers for Firestore operations

// Firestore instance provider
final firestoreProvider = Provider((ref) {
  return getIt<FirebaseFirestore>();
});

// Users collection provider
final usersCollectionProvider = Provider((ref) {
  return ref.watch(firestoreProvider).collection('users');
});

// Fetch user by ID
final fetchUserProvider = FutureProvider.family<Map<String, dynamic>?, String>(
  (ref, userId) async {
    final usersCollection = ref.watch(usersCollectionProvider);
    final doc = await usersCollection.doc(userId).get();
    return doc.data();
  },
);
