import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/components/components.dart';
import 'package:gym/cubit/cubit.dart';
import 'package:gym/cubit/states.dart';
import 'package:gym/result_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(
              "HEALTHY CALCULATOR",
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/mousa.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: SafeArea(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 70.0,
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height - 200,
                            width: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                defaultText(text: "Height"),
                                defaultTextField(
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return "This Must not be empty";
                                      }
                                    },
                                    suffixTitle: "Cm",
                                    controller: cubit.heightController,
                                    hintText: "Enter Your Height",
                                    type: TextInputType.number),
                                defaultText(text: "Weight"),
                                defaultTextField(
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return "This Must not be empty";
                                      }
                                    },
                                    controller: cubit.weightController,
                                    hintText: "Enter Your Weight",
                                    suffixTitle: "Kg",
                                    type: TextInputType.number),
                                defaultText(text: "Age"),
                                defaultTextField(
                                    suffixTitle: "Y",
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return "This Must not be empty";
                                      }
                                    },
                                    controller: cubit.ageController,
                                    hintText: "Enter Your Age",
                                    type: TextInputType.number),
                                defaultText(text: "Hours"),
                                defaultTextField(
                                    suffixTitle: "H",
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return "This Must not be empty";
                                      }
                                    },
                                    controller: cubit.hourController,
                                    hintText: "Enter Your Training Hours",
                                    type: TextInputType.number),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  // width: MediaQuery.of(context).size.width-30,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (cubit.formKey.currentState
                                          .validate()) {
                                        cubit.result();
                                        cubit.weightController.clear();
                                        cubit.heightController.clear();
                                        cubit.ageController.clear();
                                        cubit.hourController.clear();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultScreen()));
                                        print("Button is Pressed");
                                      }
                                    },
                                    child: Text(
                                      "Calculate",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
