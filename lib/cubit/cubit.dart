import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var ageController = TextEditingController();
  var hourController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  double calories = 0;
  double carb = 0;
  double protein = 0;
  double fats = 0;
  var perfectWeight;
  double weight;
  double height;
  double hours;

  void result() {
    height = double.parse(heightController.text);
    weight = double.parse(weightController.text);
    hours = double.parse(hourController.text);
    perfectWeight = height - 100;

    calories = (1.3 * weight * 24) + (8.5 * weight * hours);
    carb = (calories * 65 / 100) / 4;
    protein = (calories * 25 / 100) / 4;
    fats = (calories * 10 / 100) / 9;
  }
}
