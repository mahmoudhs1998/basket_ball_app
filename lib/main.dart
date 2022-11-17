import 'package:basketball_counter_app/cubit/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/cubit/states/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( const PointsCounter());
}


class PointsCounter extends StatelessWidget {
  const PointsCounter({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>  CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterCubit cubit = BlocProvider.of<CounterCubit>(context);
    return  BlocConsumer<CounterCubit, CounterStates>(
        builder: (context , state)
        {
          return   Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: const Text('Points Counter'),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children:  [
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(

                          children:  [
                            Text(
                              "Team A",
                              style: TextStyle(
                                fontSize: 32,
                              ),


                            ),
                            const SizedBox(
                              height:140,
                            ),
                            Text(
                              "${BlocProvider.of<CounterCubit>(context).teamAPoints}",
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed:()
                              {
                                cubit.teamIncreament(team: 'A', buttonNumber: 1);
                              },
                              child: Text("Add 1 Point",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                ),

                              ),
                            ),
                           const SizedBox(height: 20,),
                             ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed:()
                              {
                                cubit.teamIncreament(team: 'A', buttonNumber: 2);

                              },
                              child: Text("Add 2 Point",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                ),

                              ),
                            ),
                           const SizedBox(height: 20,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed:()
                              {
                                cubit.teamIncreament(team: 'A', buttonNumber: 3);

                              },
                              child: Text("Add 3 Point",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 500,
       
                        child: VerticalDivider(
                          color: Colors.grey[400],
                          thickness: 1,
                          indent: 40,
                          endIndent: 40,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children:  [
                            Text(
                              "Team B",
                              style: TextStyle(
                                fontSize: 32,
                              ),

                            ),
                           const SizedBox(
                              height:140,
                            ),
                            Text(

                              "${BlocProvider.of<CounterCubit>(context).teamBPoints}",
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(
                              height:40,
                            ),
                             ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed:()
                              {

                                cubit.teamIncreament(team: 'B', buttonNumber:1);

                              },
                              child: Text("Add 1 Point",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                ),

                              ),
                            ),
                            const SizedBox(height: 20,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed:()
                              {
                                cubit.teamIncreament(team: 'B', buttonNumber: 2);

                              },
                              child: Text("Add 2 Point",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                ),

                              ),
                            ),
                           const SizedBox(height: 20,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed:()
                              {
                                cubit.teamIncreament(team: 'B', buttonNumber: 3);

                              },
                              child: Text("Add 3 Point",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      minimumSize: Size(150, 50),
                    ),
                    onPressed:()
                    {
                      cubit.teamPointsReset();
                    },
                    child: const Text("Reset",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black
                      ),

                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener:(context,state)
        {
          // if(state is TeamAIncreamentState)
          // {
          //   cubit.teamAPoints;
          //
          // }else{
          //    cubit.teamBPoints;
          // }

        });
  }
}

