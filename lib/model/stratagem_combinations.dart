import 'package:stratagem_trainer/model/action_key.dart';

enum StratagemCombination {
  resupply(actions: [ActionKey.down, ActionKey.down, ActionKey.up, ActionKey.right]),
  reinforce(actions: [ActionKey.up, ActionKey.down, ActionKey.right, ActionKey.left, ActionKey.up]),
  hellbomb(
    actions: [
      ActionKey.down,
      ActionKey.up,
      ActionKey.left,
      ActionKey.down,
      ActionKey.up,
      ActionKey.right,
      ActionKey.down,
      ActionKey.up,
    ],
  ),
  eagleRearm(actions: [ActionKey.up, ActionKey.up, ActionKey.left, ActionKey.up, ActionKey.right]),
  axLas5(actions: [ActionKey.down, ActionKey.up, ActionKey.left, ActionKey.up, ActionKey.right, ActionKey.right]),
  axAr23(actions: [ActionKey.down, ActionKey.up, ActionKey.left, ActionKey.up, ActionKey.right, ActionKey.down]),
  lift850(actions: [ActionKey.down, ActionKey.up, ActionKey.up, ActionKey.down, ActionKey.up]),
  b1(actions: [ActionKey.down, ActionKey.left, ActionKey.down, ActionKey.up, ActionKey.up, ActionKey.down]),
  sh32(actions: [ActionKey.down, ActionKey.up, ActionKey.left, ActionKey.right, ActionKey.left, ActionKey.right]),
  sh20(actions: [ActionKey.down, ActionKey.left, ActionKey.down, ActionKey.down, ActionKey.up, ActionKey.left]),
  mg43(actions: [ActionKey.down, ActionKey.left, ActionKey.down, ActionKey.up, ActionKey.right]),
  apw1(actions: [ActionKey.down, ActionKey.left, ActionKey.right, ActionKey.up, ActionKey.down]),
  m105(actions: [ActionKey.down, ActionKey.left, ActionKey.down, ActionKey.up, ActionKey.up, ActionKey.left]),
  eat17(actions: [ActionKey.down, ActionKey.down, ActionKey.left, ActionKey.up, ActionKey.right]),
  gr8(actions: [ActionKey.down, ActionKey.left, ActionKey.right, ActionKey.right, ActionKey.left]),
  flam40(actions: [ActionKey.down, ActionKey.left, ActionKey.up, ActionKey.down, ActionKey.up]),
  ac8(actions: [ActionKey.down, ActionKey.left, ActionKey.down, ActionKey.up, ActionKey.up, ActionKey.right]),
  rs422(actions: [ActionKey.down, ActionKey.right, ActionKey.down, ActionKey.up, ActionKey.left, ActionKey.right]),
  faf14(actions: [ActionKey.down, ActionKey.down, ActionKey.up, ActionKey.down, ActionKey.down]),
  gl21(actions: [ActionKey.down, ActionKey.left, ActionKey.up, ActionKey.left, ActionKey.down]),
  las98(actions: [ActionKey.down, ActionKey.left, ActionKey.down, ActionKey.up, ActionKey.left]),
  arc3(actions: [ActionKey.down, ActionKey.right, ActionKey.down, ActionKey.up, ActionKey.left, ActionKey.left]),
  emg101(actions: [ActionKey.down, ActionKey.up, ActionKey.left, ActionKey.right, ActionKey.right, ActionKey.left]),
  fx12(actions: [ActionKey.down, ActionKey.down, ActionKey.left, ActionKey.right, ActionKey.left, ActionKey.right]),
  aarc3(actions: [ActionKey.down, ActionKey.up, ActionKey.right, ActionKey.up, ActionKey.left, ActionKey.right]),
  md6(actions: [ActionKey.down, ActionKey.left, ActionKey.up, ActionKey.right]),
  md14(actions: [ActionKey.down, ActionKey.left, ActionKey.left, ActionKey.down]),
  amg43(actions: [ActionKey.down, ActionKey.up, ActionKey.right, ActionKey.right, ActionKey.up]),
  ag16(actions: [ActionKey.down, ActionKey.up, ActionKey.right, ActionKey.left]),
  am12(actions: [ActionKey.down, ActionKey.up, ActionKey.right, ActionKey.right, ActionKey.down]),
  aac8(actions: [ActionKey.down, ActionKey.up, ActionKey.right, ActionKey.up, ActionKey.left, ActionKey.up]),
  amls4x(actions: [ActionKey.down, ActionKey.up, ActionKey.right, ActionKey.right, ActionKey.left]),
  am23(actions: [ActionKey.down, ActionKey.up, ActionKey.right, ActionKey.down, ActionKey.right]),
  gatlingBarrage(actions: [ActionKey.right, ActionKey.down, ActionKey.left, ActionKey.up, ActionKey.up]),
  airbustStrike(actions: [ActionKey.right, ActionKey.right, ActionKey.right]),
  orbital120MMHeBarrage(
    actions: [
      ActionKey.right,
      ActionKey.right,
      ActionKey.down,
      ActionKey.left,
      ActionKey.right,
      ActionKey.down,
    ],
  ),
  orbital380MMHEBarrage(
    actions: [
      ActionKey.right,
      ActionKey.down,
      ActionKey.up,
      ActionKey.up,
      ActionKey.left,
      ActionKey.down,
      ActionKey.down,
    ],
  ),
  walkingBarrage(
    actions: [
      ActionKey.right,
      ActionKey.down,
      ActionKey.right,
      ActionKey.down,
      ActionKey.right,
      ActionKey.down,
    ],
  ),
  orbitalLaser(actions: [ActionKey.right, ActionKey.down, ActionKey.up, ActionKey.right, ActionKey.down]),
  railcannonStrike(actions: [ActionKey.right, ActionKey.up, ActionKey.down, ActionKey.down, ActionKey.right]),
  precisionStrike(actions: [ActionKey.right, ActionKey.right, ActionKey.up]),
  gasStrike(actions: [ActionKey.right, ActionKey.right, ActionKey.down, ActionKey.right]),
  emsStrike(actions: [ActionKey.right, ActionKey.right, ActionKey.left, ActionKey.down]),
  orbitalSmokeStrike(actions: [ActionKey.right, ActionKey.right, ActionKey.down, ActionKey.up]),
  strafingRun(actions: [ActionKey.up, ActionKey.right, ActionKey.right]),
  airstrike(actions: [ActionKey.up, ActionKey.right, ActionKey.down, ActionKey.right]),
  clusterBomb(actions: [ActionKey.up, ActionKey.right, ActionKey.down, ActionKey.down, ActionKey.right]),
  napalmAirstrike(actions: [ActionKey.up, ActionKey.right, ActionKey.down, ActionKey.up]),
  eagleSmokeStrike(actions: [ActionKey.up, ActionKey.right, ActionKey.up, ActionKey.down]),
  eagle110mmRocketPods(actions: [ActionKey.up, ActionKey.right, ActionKey.up, ActionKey.left]),
  eagle500kgBomb(actions: [ActionKey.up, ActionKey.right, ActionKey.down, ActionKey.down, ActionKey.down]);

  const StratagemCombination({required this.actions});

  final List<ActionKey> actions;
}