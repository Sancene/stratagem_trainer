part of 'game_bloc.dart';

@Freezed()
class GameState with _$GameState {
  const GameState._();

  const factory GameState.idle({
    required List<Stratagem> availableStratagems,
    required Stratagem currentStratagem,
    required List<Stratagem> stratagemQueue,
    // TODO: rename
    required List<String> currentCombo,
  }) = _IdleState;

  const factory GameState.wrongKey() = _WrongKeyState;

  const factory GameState.completedStratagem() = _CompletedStratagemState;

  const factory GameState.failedStratagem() = _FailedStratagemState;

  const factory GameState.win() = _WinState;

  const factory GameState.failure() = _FailureState;
}
