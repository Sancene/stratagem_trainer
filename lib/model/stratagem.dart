import 'package:stratagem_trainer/model/action_key.dart';

class Stratagem {
  Stratagem({
    required this.code,
    required this.name,
    required this.previewImage,
    required this.type,
  });
  final List<ActionKey> code;
  final String name;
  final String previewImage;

  // TODO: enum type: orbital, support weapon etc.
  final String type;
}
