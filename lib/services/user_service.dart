import 'package:cards/models/user.dart';
import 'package:cards/services/service.dart';

class UserService extends Service<User> {
  UserService()
      : super(
          collectionName: 'users',
          fromJson: User.fromJson,
        );
}
