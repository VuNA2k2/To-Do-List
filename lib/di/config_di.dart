import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

class ConfigDI {
  static final ConfigDI _singleton = ConfigDI._internal();

  factory ConfigDI() {
    return _singleton;
  }

  ConfigDI._internal() {
    injector.registerSingleton<ApiService>(ApiService());
    injector.registerSingleton<AuthRemote>(AuthRemote(injector.get()));
    injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(injector.get()));
    injector.registerLazySingleton<LoginUseCase>(() => LoginUseCase(injector.get()));
    injector.registerSingleton<TaskRemote>(TaskRemote(injector.get()));
    injector.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(injector.get()));
    injector.registerLazySingleton<GetTaskUseCase>(() => GetTaskUseCase(injector.get()));
    injector.registerSingleton<NoteRemote>(NoteRemote(injector.get()));
    injector.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(injector.get()));
    injector.registerLazySingleton<GetNoteUseCase>(() => GetNoteUseCase(injector.get()));
    injector.registerSingleton<ProjectRemote>(ProjectRemote(injector.get()));
    injector.registerLazySingleton<ProjectRepository>(() => ProjectRepositoryImpl(injector.get()));
    injector.registerLazySingleton<GetProjectUseCase>(() => GetProjectUseCase(injector.get()));
  }
  GetIt injector = GetIt.instance;

}