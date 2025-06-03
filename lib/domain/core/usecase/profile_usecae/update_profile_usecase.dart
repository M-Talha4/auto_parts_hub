import '/domain/core/interfaces/profile_interface/profile_repository.dart';
import '/infrastructure/dal/models/user_models/user_model.dart';

class UpdateProfileUsecase {
  final ProfileRepository _profileRepository;
  UpdateProfileUsecase(this._profileRepository);

  Future<void> execute(UserModel user) {
    return _profileRepository.updateProfile(user);
  }
}
