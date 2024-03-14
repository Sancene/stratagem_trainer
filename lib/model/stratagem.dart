import 'package:stratagem_trainer/model/action_key.dart';
import 'package:stratagem_trainer/model/stratagem_type.dart';

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
  final StratagemType type;
}
