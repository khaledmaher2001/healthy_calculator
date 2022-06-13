
import 'package:flutter/material.dart';

Widget defaultTextField({
   String title,
  @required String hintText,
  @required TextInputType type,
  TextEditingController controller,
  String suffixTitle,
  @required Function validator
}){

  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    child: TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        suffixText: suffixTitle,
        filled: true,
        fillColor: Colors.white,
        labelText: title,
        labelStyle: TextStyle(
          fontSize: 20.0
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
Widget defaultText({
  @required String text,

}){
  return Text(text,style: TextStyle(
    fontWeight:FontWeight.bold,
    fontSize: 22.0,
    color: Colors.white
  ),);

}