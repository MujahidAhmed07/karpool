import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor("#121212"),
      body: Container(
        color: hexToColor('#121212'),
        alignment: Alignment.centerLeft,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset('assets/logo.png', width: 200, height: 200),
              Text("KARPOOL",style: TextStyle(color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold),),
              loginBox(),
              Container(
                margin: EdgeInsets.all(20),
                child: const Text("OR",style: TextStyle(color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: hexToColor("#1E847F"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  fixedSize: Size(180, 40)
                ),
                  onPressed: (){},
                  child:Text("SIGN UP"))
            ],
          ),
        ),
      ),
    );
  }

  Color hexToColor(String hexColor) {
    return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Widget loginBox() {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 30, 40, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: hexToColor('#1e1e1e'),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Phone Number",style:
          TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),),
          TextField(  decoration: InputDecoration(hintText: "Enter Phone Number",
              hintStyle: TextStyle(color: hexToColor("#777777")),
              border: const UnderlineInputBorder( borderSide: BorderSide(color: Colors.black))
          )
          ),
          const SizedBox(height: 20,),
          const Text("Password",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,),
          ),
          TextField(  decoration: InputDecoration(hintText: "Enter Password",
              hintStyle: TextStyle(color: hexToColor('#777777')),
              border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,))
          ),
          ),
          Container(
            alignment: Alignment.center,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: rememberMe,
                onChanged: (newValue) {
                  setState(() {
                    rememberMe = newValue ?? false;
                  });
                },
                activeColor: hexToColor("#1e847f"),
              ),
              const Text("Remember Me",style: TextStyle(color: Colors.white,
                  fontSize: 18,
              fontWeight: FontWeight.bold)),
            ],
          ),
          ),
          ElevatedButton(onPressed: () {  },
          child: const Text("LOGIN"),
            style: ElevatedButton.styleFrom(
              backgroundColor: hexToColor("#1E847F"),
                fixedSize: Size(130, 40),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
              )
            ),
          ),
        ],
      ),
    );
  }
}