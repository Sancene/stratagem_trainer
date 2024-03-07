class Stratagem {
  // TODO: enums for actions keys: ActionKey.UP, ActionKey.DOWN etc.
  final List<String> code;
  final String name;
  final String previewImage;

  // TODO: enum type: orbital, support weapon etc.
  final String type;

  Stratagem({
    required this.code,
    required this.name,
    required this.previewImage,
    required this.type,
  });
}
