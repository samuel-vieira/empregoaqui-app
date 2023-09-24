import 'package:uuid/uuid.dart';

class UniqueId {
  String generateUuid() {
    const uuid = Uuid();
    return uuid.v4();
  }
}
