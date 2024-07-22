import 'dart:io';
import 'package:auto_parts_hub/domain/core/interfaces/profile_interface/profile_repository.dart';

class UploadImageUsecase {
  final ProfileRepository _profileRepository;
  UploadImageUsecase(this._profileRepository);

  Future<String?> execute(File file) {
    return _profileRepository.uploadImage(file);
  }
}
