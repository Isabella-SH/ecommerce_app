
import 'package:ecommerce_app/screens/Home.dart';
import 'package:ecommerce_app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _usernameController= TextEditingController();
  final _passwordController= TextEditingController();

  //para reconocer al ultimo usiuario registrado
  initialize() async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();

    //crea una variable que alacena el username y la iguala a lo que gusrado sharedprefereces
    String? username= prefs.getString('username');

    if(username !=null){  //si la variable tiene algun valor
      _usernameController.text=username; //la caja de texto toma ese valor
    }
  }

  @override
  void initState(){
    super.initState();
    initialize();
  }

  //navegacion hacia home()
  navigateTo(){
    //pushReplacement->para no retroceder la vista
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      //si el logueo es true pasa a home, sino sigue en login
      return const Home();
    }));
  }

  authenticate()async{
    final isLogged=await UserService().authenticate(_usernameController.text, _passwordController.text);

    if (isLogged){ //si ingreso las credenciales correctas

      //crea una instancia de sharedPreferences
      final SharedPreferences prefs= await SharedPreferences.getInstance();
      //guarda el valor de _usernameController en la variable username
      await prefs.setString('username', _usernameController.text);
      //gusrda el valor de true en una variable isLogged
      await prefs.setBool('isLogged',true);

      //despues de autenticar puedo pasar al home
      navigateTo();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
            ),
            TextField(
              controller: _passwordController,
            ),
            
            OutlinedButton(
                onPressed: (){
                  authenticate();               //lama al metodo que tiene al servicio de login
                },
                child: const Text("Ingresar")
            )
          ],
        ),
      ),
    );
  }
}

