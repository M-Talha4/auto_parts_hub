import 'package:auto_parts_hub/domain/core/interfaces/user_management_interface/user_management_repository.dart';

class CheckAccountDeletionUsecase {
  final UserManagementRepository _userManagementRepository;
  CheckAccountDeletionUsecase(this._userManagementRepository);

  Future<void> execute(String userId) {
    return _userManagementRepository.checkAccountDeletion(userId);
  }
}
