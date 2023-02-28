import 'package:flutter/material.dart';
import 'package:jaydipform1/form2.dart';
import 'form1.dart';
 void main() =>runApp(myapp());

 class myapp extends StatelessWidget {
   const myapp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'login form',
       debugShowCheckedModeBanner: false,
       home:form2() ,
     );
   }
 }
