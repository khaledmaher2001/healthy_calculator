import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/cubit/cubit.dart';
import 'package:gym/cubit/states.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Result"),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You Need That :-",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      // color: Colors.red.withOpacity(0.7)
                    ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Calories : ${AppCubit.get(context).calories.round()} cal/day",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    // color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Carb : ${AppCubit.get(context).carb.round()} gm/day",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    // color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Protein : ${AppCubit.get(context).protein.round()} gm/day",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    // color: Colors.orangeAccent,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Fat : ${AppCubit.get(context).fats.round()} gm/day",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      // color: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Your Perfect Weight Must be ${AppCubit.get(context).perfectWeight} kg",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  cubit.perfectWeight == cubit.weight
                      ? "Your Weight is perfect"
                      : cubit.perfectWeight < cubit.weight
                          ? "You should do a Diet"
                          : "You Must Increase Your Weight",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "For Bulk : ${(cubit.calories + 500).round()} cal/day",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "For Diet : ${(cubit.calories - 500).round()} cal/day",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
