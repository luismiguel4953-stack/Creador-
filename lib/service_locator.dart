import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/local_storage/local_storage_service.dart';
import 'core/network/network_info.dart';
import 'core/utils/logger.dart';
import 'data/datasources/local/local_data_source.dart';
import 'data/datasources/remote/remote_data_source.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/user_usecase.dart';

final getIt = GetIt.instance;

/// Service Locator Setup
/// Centralizes all dependency injection configuration

Future<void> setupServiceLocator() async {
  AppLogger.info('Initializing Service Locator...');

  // Firebase Services
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);

  // Core Services
  getIt.registerSingleton<LocalStorageService>(LocalStorageServiceImpl());
  getIt.registerSingleton<NetworkInfo>(NetworkInfoImpl());

  // Data Sources
  getIt.registerSingleton<LocalDataSource>(LocalDataSourceImpl());
  getIt.registerSingleton<RemoteDataSource>(RemoteDataSourceImpl());

  // Repositories
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(
      remoteDataSource: getIt<RemoteDataSource>(),
      localDataSource: getIt<LocalDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  // Use Cases
  getIt.registerSingleton<UserUseCases>(
    UserUseCases(userRepository: getIt<UserRepository>()),
  );

  AppLogger.info('Service Locator initialized successfully');
}