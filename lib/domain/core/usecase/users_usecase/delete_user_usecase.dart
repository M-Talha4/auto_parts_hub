import '/domain/core/interfaces/user_management_interface/user_management_repository.dart';

class DeleteUserUsecase {
  final UserManagementRepository _userManagementRepository;
  DeleteUserUsecase(this._userManagementRepository);

  Future<void> execute(String userId) {
    return _userManagementRepository.deleteUser(userId);
  }
}
