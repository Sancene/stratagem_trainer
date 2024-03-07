part of 'game_bloc.dart';

@Freezed()
class GameState with _$GameState {
  const GameState._();

  const factory GameState.idle({
    List<Stratagem> availableStratagems,
    Stratagem currentStratagem,
    List<Stratagem> stratagemQueue,
    // TODO: rename
    List<String> currentCombo,
  }) = _IdleState;

  const factory GameState.wrongKey() = _WrongKeyState;

  const factory GameState.completedStratagem() = _CompletedStratagemState;

  const factory GameState.failedStratagem() = _FailedStratagemState;

  const factory GameState.win() = _WinState;

  const factory GameState.failure() = _FailureState;
}
