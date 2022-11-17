import 'package:basketball_counter_app/cubit/states/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit(): super(TeamAIncreamentState());
  //counter Cubit  Logic::
  int teamAPoints = 0;

  int teamBPoints = 0;
  int teamReset = 0;

  void teamIncreament({required String team ,required int buttonNumber})
{
  if(team == 'A')
  {
    teamAPoints += buttonNumber;
    emit(TeamAIncreamentState());
  } if(team == 'B')
  {
    teamBPoints += buttonNumber;
    emit(TeamBIncreamentState());
  }

}
void teamPointsReset()
{
 teamAPoints = 0;
 teamBPoints = 0;
 emit(TeamResetState());

}

}