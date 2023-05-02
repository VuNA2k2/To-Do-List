
import 'package:data/src/data_source/shared_data/storage_service.dart';

export 'src/remote/dto/login/login_input_dto.dart';
export 'src/remote/dto/login/login_output_dto.dart';
export 'src/repositories/auth/auth_repository_impl.dart';
export 'src/remote/auth_remote.dart';
export 'src/data_source/api/api_service.dart';
export 'src/remote/task_remote.dart';
export 'src/repositories/task/task_repository_impl.dart';
export 'src/repositories/note/note_repository_impl.dart';
export 'src/remote/note_remote.dart';

initDataLayer() {
  StorageService().init();
}