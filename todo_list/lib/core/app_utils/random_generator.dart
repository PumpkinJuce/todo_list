import 'package:uuid/uuid.dart';

class RandomGenerator {
  static getRandomUId() => const Uuid().v4();
}
