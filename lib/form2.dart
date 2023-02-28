import 'package:flutter/material.dart';
import 'package:jaydipform1/form1.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';
class form2 extends StatefulWidget {
  const form2({Key? key}) : super(key: key);

  @override
  State<form2> createState() => _form2State();
}

class _form2State extends State<form2> {
  _launchURL() async {
    String url = 'https://www.google.com/';
    final uri = Uri.parse(url);
   // log('data1: $uri');
    if (!await canLaunchUrl(uri)) {
       log('data2: $canLaunchUrl(uri)');
      await launchUrl(uri);
    } else {
      // log('data3: $uri');
      throw 'Could not launch $url';
    }


  }




  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9BD1E5),
      body:
         Form(
           key: formkey,
           child: SingleChildScrollView(
             child: Column(

              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 200.0,left: 20.0),
                  child: RichText(
                    text:const TextSpan(text: "Welcome ",style: TextStyle(fontSize: 30,color: Colors.black87),
                    children: [
                      TextSpan(text: 'Back',style: TextStyle(color: Colors.blue))
                    ]
                    ),


                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: TextFormField(
                    controller: email,
                    validator: (value){
                      if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                        return 'enter valid type email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none

                        )

                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: TextFormField(


                    controller: Password,
                    validator: (value){
                      if(value == null || value.isEmpty ){
                        return 'enter Password';
                      }
                      else if(value.length < 8){
                        return 'password must be 8 charactar';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none

                        )

                    ),
                  ),
                ),
                SizedBox(height: 40),

                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                      child: ElevatedButton(onPressed: (){
                        if(formkey.currentState!.validate()){
                          print('form is valid');
                         Navigator.pop(context) ;                     }
                        else {
                          print ('form not valid');
                        }
                      },
                        child: const Text("Login"),
                        style: ElevatedButton.styleFrom(
                        fixedSize: Size(370, 40),
                        textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          primary: Color(0xff495867),
                          shape: StadiumBorder()
                      ),
                      ),
                    ),

                Container(
                  child: TextButton(onPressed: null,child: Text('Forgot Password?'),
                    style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  ),
                ),
              Container(child: const Text("or",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 120,
                    height: 5,
                    color: Colors.white,
                  ),
                  Container(
                    child: Text('Sign up with',style: TextStyle(fontSize: 20),),
                  ),
                  Container(
                    width: 120,
                    height: 5,
                    color: Colors.white,
                  ),
                ],
              ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child:ElevatedButton(onPressed: (){
                        _launchURL();
                      },child: const Text("Google"),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(120, 50),
                            textStyle: const TextStyle(fontSize: 15),
                            // primary: Color(0xff495867),
                            shape: StadiumBorder()
                        ),
                      ),
                    ),
                    Container(
                      child:OutlinedButton(
                        onPressed: (){},
                        child: const Text("Facebook"),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 50),
                            textStyle: const TextStyle(fontSize: 15),
                             side: BorderSide(color: Colors.blue,width: 1),
                            onPrimary: Colors.black87,
                            shape:const  StadiumBorder()
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   child: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
                //     Navigator.pop(context);
                //   },),
                // )
              ],
        ),
           ),
         ),
    );
  }
}
