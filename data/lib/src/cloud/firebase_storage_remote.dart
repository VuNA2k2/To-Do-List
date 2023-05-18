import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRemote {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> uploadFile(File file) async {
    Reference ref = _storage.ref().child('images/${DateTime.now().millisecondsSinceEpoch}_${file.path}');
    UploadTask uploadTask = ref.putFile(file);
    await uploadTask;
    return await ref.getDownloadURL();
  }
}