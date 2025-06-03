import '/domain/core/entities/user_entities/user_entity.dart';
import '/domain/core/interfaces/user_management_interface/user_management_repository.dart';

class GetUsersUsecase {
  final UserManagementRepository _userManagementRepository;
  GetUsersUsecase(this._userManagementRepository);

  Future<List<UserEntity>?> execute() {
    return _userManagementRepository.getAllUsers();
  }
}
