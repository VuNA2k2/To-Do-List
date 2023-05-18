import 'dart:io';

import 'package:domain/domain.dart';

class UploadImageUseCase {
  final StorageRepository _storageRepository;
  UploadImageUseCase(this._storageRepository);
  Future<String> call(File file) async {
    return await _storageRepository.uploadFile(file);
  }
}