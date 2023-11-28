import 'package:ecommerce_app/screens/Home.dart';
import 'package:ecommerce_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //variable para saber si alguien se logeo
  bool isLogged=false;

  //navegacion hacia home()
  navigateTo(){
    //pushReplacement->para no retroceder la vista
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      //si el logueo es true pasa a home, sino sigue en login
      return isLogged?const Home() : const Login();
    }));
  }

  initialize() async{

    //crea una instancia de shared_preferences
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    //si el logueo es diferente null
    if(prefs.getBool('isLogged')!=null){
      //la variable es true
      setState(() {
        isLogged=true;
      });
    }
    navigateTo();
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}



