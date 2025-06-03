import '/domain/core/entities/user_entities/user_entity.dart';

abstract class UserManagementRepository {
  Future<List<UserEntity>?> getAllUsers();
  Future<void> deleteUser(String userId);
  Future<void> checkAccountDeletion();
}
