part of 'game_bloc.dart';

@Freezed()
class GameState with _$GameState {
  const GameState._();

  const factory GameState.idle({
    required List<Stratagem> availableStratagems,
    required Queue<Stratagem> stratagemQueue,
    // TODO: rename
    required List<ActionKey> currentCombo,
  }) = _IdleState;

  const factory GameState.wrongKey({
    required List<Stratagem> availableStratagems,
    required Queue<Stratagem> stratagemQueue,
    // TODO: rename
    required List<ActionKey> currentCombo,
  }) = _WrongKeyState;

  const factory GameState.completedStratagem({
    required List<Stratagem> availableStratagems,
    required Queue<Stratagem> stratagemQueue,
    // TODO: rename
    required List<ActionKey> currentCombo,
  }) = _CompletedStratagemState;

  const factory GameState.failedStratagem({
    required List<Stratagem> availableStratagems,
    required Queue<Stratagem> stratagemQueue,
    // TODO: rename
    required List<ActionKey> currentCombo,
  }) = _FailedStratagemState;

  const factory GameState.win({
    required List<Stratagem> availableStratagems,
    required Queue<Stratagem> stratagemQueue,
    // TODO: rename
    required List<ActionKey> currentCombo,
  }) = _WinState;

  const factory GameState.startingNewGame({
    required List<Stratagem> availableStratagems,
    required Queue<Stratagem> stratagemQueue,
    // TODO: rename
    required List<ActionKey> currentCombo,
  }) = _StartingNewGameState;

  const factory GameState.failure({
    required List<Stratagem> availableStratagems,
    required Queue<Stratagem> stratagemQueue,
    // TODO: rename
    required List<ActionKey> currentCombo,
  }) = _FailureState;
}
