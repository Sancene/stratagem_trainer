import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stratagem_trainer/model/stratagem.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(
          GameState.idle(
            availableStratagems: [],
            currentStratagem: Stratagem(code: [], name: '', previewImage: '', type: ''),
            stratagemQueue: [],
            currentCombo: [],
          ),
        ) {
    on<_Started>(_onStarted);
  }

  void _onStarted(_Started event, Emitter<GameState> emit) {}
}
