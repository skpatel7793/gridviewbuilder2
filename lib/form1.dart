import 'package:flutter/material.dart';

import 'form2.dart';
class form1 extends StatefulWidget {
  const form1({Key? key}) : super(key: key);

  @override
  State<form1> createState() => _form1State();
}

class _form1State extends State<form1> {
  final formkey = GlobalKey<FormState>();
  final name = TextEditingController();
  final Phonenumber = TextEditingController();
  final email =  TextEditingController();
  final Password = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff9BD1E5),
      body:Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 200.0,left: 20.0),
                child: RichText(
                  text:const TextSpan(text: "Hello ",style: TextStyle(fontSize: 30,color: Colors.black87),
                      children: [
                        TextSpan(text: 'there',style: TextStyle(color: Colors.blue))
                      ]
                  ),


                ),
              ),
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: TextFormField(
                  controller: name,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'enter name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(


                      hintText: 'Name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none

                      )

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: TextFormField(
                  controller: Phonenumber,
                  validator: (value){
                    if(value == null || value.isEmpty || value.length != 10){
                      return 'enter Phonenumber ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(

                      hintText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none

                      )

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: TextFormField(
                  controller: email,
                  validator: (value){

                    if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.') ){
                      return 'invalid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,

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
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: TextFormField(
                  controller: Password,
                  validator: (value){
                    if(value == null || value.isEmpty  ){
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
              SizedBox(height: 30,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
                  Container(
                    alignment: Alignment.centerLeft,
                     padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: ElevatedButton(onPressed: (){
                      if(formkey.currentState!.validate()){
                        print('form is valid');
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return form2();
                        }));
                      }
                      else {
                        print ('form not valid');
                      }
                    },
                      child: const Text("Sign up"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(370, 40),
                          textStyle: const TextStyle(fontSize: 20),
                          primary: Color(0xff495867),
                          shape: StadiumBorder()
                      ),
                    ),
                  ),
              //   ],
              // ),
              // Container(
              //   child: IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context){
              //       return form2();
              //     }));
              //   },),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
