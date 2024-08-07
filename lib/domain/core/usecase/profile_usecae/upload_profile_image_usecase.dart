import 'dart:io';
import 'package:auto_parts_hub/domain/core/interfaces/profile_interface/profile_repository.dart';

class UploadProfileImageUsecase {
  final ProfileRepository _profileRepository;
  UploadProfileImageUsecase(this._profileRepository);

  Future<String?> execute(File file) {
    return _profileRepository.uploadImage(file);
  }
}
