part of 'game_bloc.dart';

@Freezed(map: FreezedMapOptions.none)
class GameEvent with _$GameEvent {
  const factory GameEvent.setupNewQueue() = _Started;
  const factory GameEvent.keyPressed(ActionKey actionKey) = _KeyPressed;
  const factory GameEvent.timerExpired() = _TimerExpired;
}
