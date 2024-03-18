import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stratagem_trainer/model/action_key.dart';
import 'package:stratagem_trainer/model/stratagem.dart';
import 'package:stratagem_trainer/model/stratagem_combinations.dart';
import 'package:stratagem_trainer/model/stratagem_type.dart';

part 'game_bloc.freezed.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(
          GameState.idle(
            availableStratagems: [],
            stratagemQueue: Queue<Stratagem>()
              ..addAll([
                Stratagem(
                  code: StratagemCombination.hellbomb.actions,
                  name: 'aboba1',
                  previewImage: '',
                  type: StratagemType.mission,
                ),
                Stratagem(
                  code: StratagemCombination.airbustStrike.actions,
                  name: 'aboba2',
                  previewImage: '',
                  type: StratagemType.offensive,
                ),
                Stratagem(
                  code: StratagemCombination.gasStrike.actions,
                  name: 'aboba3',
                  previewImage: '',
                  type: StratagemType.defensive,
                ),
              ]),
            currentCombo: [],
          ),
        ) {
    on<_Started>(_onStarted);
    on<_KeyPressed>(_onKeyPressed);
    on<_TimerExpired>(_onTimerExpired);
  }

  void _onStarted(_Started event, Emitter<GameState> emit) {}

  void _onTimerExpired(_TimerExpired event, Emitter<GameState> emit) {
    emit(
      GameState.failure(
        availableStratagems: state.availableStratagems,
        stratagemQueue: state.stratagemQueue,
        currentCombo: state.currentCombo,
      ),
    );
  }

  void _onKeyPressed(_KeyPressed event, Emitter<GameState> emit) {
    final currentIndex = state.currentCombo.length;
    if (state.stratagemQueue.first.code[currentIndex] == event.actionKey) {
      emit(
        GameState.idle(
          availableStratagems: state.availableStratagems,
          stratagemQueue: state.stratagemQueue,
          currentCombo: state.currentCombo.toList()..add(event.actionKey),
        ),
      );
      if (state.stratagemQueue.first.code.length == state.currentCombo.length) {
        final newQueue = Queue<Stratagem>()
          ..addAll(state.stratagemQueue)
          ..removeFirst();
        if (newQueue.isEmpty) {
          emit(
            GameState.win(
              availableStratagems: state.availableStratagems,
              stratagemQueue: newQueue,
              currentCombo: [],
            ),
          );
        } else {
          emit(
            GameState.completedStratagem(
              availableStratagems: state.availableStratagems,
              stratagemQueue: newQueue,
              currentCombo: [],
            ),
          );
        }
      }
    } else {
      emit(
        GameState.wrongKey(
          availableStratagems: state.availableStratagems,
          stratagemQueue: state.stratagemQueue,
          currentCombo: [],
        ),
      );
    }
  }
}
