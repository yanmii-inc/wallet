import 'package:yanmii_wallet/src/common/data/models/responses/user_response.dart';
import 'package:yanmii_wallet/src/common/domain/entities/user.dart';

/// Mapper is a class responsible to map raw objects retrieved from the API
/// to models acccording to UI needs
class UserMapper {
  const UserMapper._();

  /// we don't include user's `token` in the `User` entity as it is secret
  static User mapUserResponseToUser(UserResponse data) => User(
        uid: data.uid,
        email: data.email,
      );
}
