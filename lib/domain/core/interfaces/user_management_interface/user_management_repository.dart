import 'package:auto_parts_hub/domain/core/entities/user_entities/user.dart';

abstract class UserManagementRepository {
  Future<List<User>?> getAllUsers();
  Future<void> deleteUser(String userId);
  Future<void> checkAccountDeletion(String userId);
}
