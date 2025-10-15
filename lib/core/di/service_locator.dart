import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';

// auth
import 'package:cookora/features/auth/data/datasources/auth_data_source.dart';
import 'package:cookora/features/auth/data/datasources/auth_data_source_impl.dart';
import 'package:cookora/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:cookora/features/auth/domain/repositories/auth_repository.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_bloc.dart';

// suggestion
import 'package:cookora/features/suggestion/data/datasources/suggestion_data_source.dart';
import 'package:cookora/features/suggestion/data/datasources/suggestion_data_source_impl.dart';
import 'package:cookora/features/suggestion/data/repositories_impl/suggestion_repository_impl.dart';
import 'package:cookora/features/suggestion/domain/usecases/get_suggestions_usecase.dart';
import 'package:cookora/features/suggestion/domain/repositories/suggestion_repository.dart';
import 'package:cookora/features/suggestion/presentation/bloc/suggestion_bloc.dart';
import 'package:cookora/features/kitchen_log/data/datasources/kitchen_log_data_source.dart';
import 'package:cookora/features/kitchen_log/data/datasources/kitchen_log_data_source_impl.dart';
import 'package:cookora/features/kitchen_log/data/repositories_impl/kitchen_log_repository_impl.dart';
import 'package:cookora/features/kitchen_log/domain/repository/kitchen_log_repository.dart';
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_bloc.dart';

// pantry
import 'package:cookora/features/pantry/data/datasources/pantry_data_source.dart';
import 'package:cookora/features/pantry/data/datasources/pantry_data_source_impl.dart';
import 'package:cookora/features/pantry/data/repositories_impl/pantry_repository_impl.dart';
import 'package:cookora/features/pantry/domain/repositories/pantry_repository.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/data/datasources/ingredient_data_source.dart';
import 'package:cookora/features/pantry/domain/repositories/ingredient_repository.dart';
import 'package:cookora/features/pantry/presentation/bloc/ingredient_management/ingredient_bloc.dart';

// scan
import 'package:cookora/features/scan/data/datasources/scan_data_source.dart';
import 'package:cookora/features/scan/data/datasources/scan_data_source_impl.dart';
import 'package:cookora/features/scan/domain/repositories/scan_repository.dart';
import 'package:cookora/features/scan/data/repositories_impl/scan_repository_impl.dart';
import 'package:cookora/features/scan/presentation/bloc/scan/scan_bloc.dart';
import 'package:cookora/features/scan/presentation/bloc/camera/camera_bloc.dart';

// community
import 'package:cookora/features/community/data/datasources/community_data_source.dart';
import 'package:cookora/features/community/data/datasources/community_data_source_impl.dart';
import 'package:cookora/features/community/data/repositories_impl/community_repository_impl.dart';
import 'package:cookora/features/community/domain/repositories/community_repository.dart';
import 'package:cookora/features/community/presentation/bloc/community_bloc.dart';

// user
import 'package:cookora/features/user/data/datasources/user_data_source.dart';
import 'package:cookora/features/user/data/datasources/user_data_source_impl.dart';
import 'package:cookora/features/user/data/repositories_impl/user_repository_impl.dart';
import 'package:cookora/features/user/domain/repositories/user_repository.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';

// Instance toàn cục của GetIt
final locator = GetIt.instance;

// Hàm khởi tạo các dependency
Future<void> initializeDependencies() async {
  // --- External ---
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  locator.registerLazySingleton<FirebaseFunctions>(
    () => FirebaseFunctions.instance,
  );
  locator.registerLazySingleton<FirebaseStorage>(
    () => FirebaseStorage.instance,
  );

  // --- DataSources ---
  locator.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(firebaseAuth: locator(), functions: locator()),
  );
  locator.registerLazySingleton<PantryDataSource>(
    () => PantryDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<IngredientDataSource>(
    () => IngredientDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<SuggestionDataSource>(
    () => SuggestionDataSourceImpl(firestore: locator()),
  );
  locator.registerLazySingleton<KitchenLogDataSource>(
    () => KitchenLogDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<ScanDataSource>(
    () => ScanDataSourceImpl(functions: locator()),
  );
  locator.registerLazySingleton<CommunityDataSource>(
    () => CommunityDataSourceImpl(locator(), locator()),
  );
  locator.registerLazySingleton<UserDataSource>(
    () => UserDataSourceImpl(locator(), locator()),
  );

  // --- Repositories ---
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<PantryRepository>(
    () => PantryRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<IngredientRepository>(
    () => IngredientRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<SuggestionRepository>(
    () => SuggestionRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<KitchenLogRepository>(
    () => KitchenLogRepositoryImpl(dataSource: locator()),
  );
  locator.registerLazySingleton<ScanRepository>(
    () => ScanRepositoryImpl(dataSource: locator()),
  );
  locator.registerLazySingleton<CommunityRepository>(
    () => CommunityRepositoryImpl(locator(), locator()),
  );
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(locator()),
  );
  // --- UseCases ---
  locator.registerLazySingleton(
    () => GetSuggestionsUsecase(
      pantryRepository: locator(),
      suggestionRepository: locator(),
    ),
  );

  // --- Blocs ---
  locator.registerSingleton<AuthBloc>(AuthBloc(authRepository: locator()));
  locator.registerSingleton<UserBloc>(
    UserBloc(
      userRepository: locator(),
      communityRepository: locator(),
      authBloc: locator(),
    ),
  );
  locator.registerLazySingleton<PantryBloc>(
    () => PantryBloc(pantryRepository: locator(), userBloc: locator()),
  );
  locator.registerLazySingleton<IngredientBloc>(
    () => IngredientBloc(locator()),
  );
  locator.registerLazySingleton<SuggestionBloc>(
    () => SuggestionBloc(getSuggestionUseCase: locator()),
  );
  locator.registerLazySingleton<KitchenLogBloc>(
    () => KitchenLogBloc(kitchenLogRepository: locator(), userBloc: locator()),
  );
  locator.registerFactory<ScanBloc>(() => ScanBloc(scanRepository: locator()));
  locator.registerFactory<CameraBloc>(() => CameraBloc());
  locator.registerLazySingleton<CommunityBloc>(
    () => CommunityBloc(communityRepository: locator(), userBloc: locator()),
  );
}
