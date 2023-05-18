import 'dart:io';

import 'package:data/src/cloud/firebase_storage_remote.dart';
import 'package:domain/domain.dart';

class StorageRepositoryImpl implements StorageRepository {
  final FirebaseStorageRemote _firebaseStorageRemote;
  StorageRepositoryImpl(this._firebaseStorageRemote);
  @override
  Future<String> uploadFile(File file) => _firebaseStorageRemote.uploadFile(file);

}