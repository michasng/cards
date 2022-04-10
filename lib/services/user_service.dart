import 'package:cards/models/user.dart';
import 'package:cards/services/model_service.dart';

class UserService extends ModelService<User> {
  UserService() : super(collectionName: 'users', fromJson: User.fromJson);
}
