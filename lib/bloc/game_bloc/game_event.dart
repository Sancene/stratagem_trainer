part of 'game_bloc.dart';

@Freezed(map: FreezedMapOptions.none)
class GameEvent with _$GameEvent {
  const factory GameEvent.started() = _Started;
}
