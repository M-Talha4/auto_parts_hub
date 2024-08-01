import 'package:auto_parts_hub/domain/core/entities/user_entities/user.dart';
import 'package:auto_parts_hub/domain/core/interfaces/user_management_interface/user_management_repository.dart';

class GetUsersUsecase {
  final UserManagementRepository _userManagementRepository;
  GetUsersUsecase(this._userManagementRepository);

  Future<List<User>?> execute() {
    return _userManagementRepository.getAllUsers();
  }
}
