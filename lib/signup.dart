import 'dart:convert';

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;


void main(){
  runApp(const Signup());
}

TextEditingController name = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class Signup extends StatelessWidget{
  const Signup({super.key});




  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: SignupPage(),
   );
  }
}

class SignupPage extends StatelessWidget{
  const SignupPage({super.key});


  Future<void> insertrecord() async
  {
    if(name.text!=""||email.text!=""||password.text!=""||phone.text!=""){
      try{
        print(name.text);
        print(email.text);
        print(password.text);
        print(phone.text);

       String uri = "http://10.0.2.2/practice_api/insert_record.php";

        var res = await http.post(Uri.parse(uri),body: {

          "name":name.text,
          "password":password.text,
          "phone":phone.text,
          "email":email.text

          }
        );

        var response=jsonDecode(res.body);

        if(response["success"] == "true"){
          print("Record insert successfully");
        }else{
          print("some problem");
        }
      }

      catch(e){
        print(e);
      }
      }else{
      print("please fill alll fields");
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor("#121212"),
      body: Container(
                child: Center(
          child: Column(
              children: [SizedBox(
                height: 200,
                width: 200,
                child: IconButton(onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Funcationality to be added"),
                        duration:Duration(seconds: 2),));
                },
                    icon: Image.asset("assets/user.png")),
              ),
              const SizedBox(height: 20,),
                signupInfo(),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  insertrecord();
                }, child: const Text("Create Account"),
                style: ElevatedButton.styleFrom(backgroundColor: hexToColor("#1E847F"),
                fixedSize: const Size(130, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )),)
            ],
          ),
        ),
      ),
    );
  }
}

Widget signupInfo(){
  return Container(
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.symmetric(horizontal: 40),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: hexToColor('#1e1e1e')
    ),
    child: Column(
    children: [
      const Align(
        alignment: Alignment.centerLeft,
          child: Text("Full Name",
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
      )
      ),
      TextField(
        controller: name,
          decoration: textfieldstyle("Enter Full Name"),
      ),
      const SizedBox(height: 20,),
      Align(
        alignment: Alignment.centerLeft,
        child: Text("Phone Number",
        style: textstyle(),
        ),
      ),
      TextField(
        controller: phone,
        decoration: textfieldstyle("Enter Phone Number"),),
      const SizedBox(height: 20,),
      Align(
          alignment: Alignment.centerLeft,
          child: Text("Email",style: textstyle(),)
      ),
      TextField(
          controller: email,
          decoration: textfieldstyle("Enter Email")
      ),
      const SizedBox(height: 20,),
      Align(alignment: Alignment.centerLeft,
      child: Text("Password",style: textstyle(),
      ),
      ),
      TextField(
          controller: password,
          decoration: textfieldstyle("Enter Password")),
      const SizedBox(height: 20,),
      Align(
          alignment: Alignment.centerLeft,
          child: Text("Confirm Password",style: textstyle(),)
      ),
      TextField(decoration: textfieldstyle("Confirm Password"),
      )
    ],
  ),
  );
}

TextStyle textstyle(){
  return const TextStyle(color: Colors.white,fontWeight: FontWeight.bold);
}

InputDecoration textfieldstyle(String abc){
  return InputDecoration(
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 3)),hintText: abc,
      hintStyle: TextStyle(color: hexToColor("#777777"))
    );
}