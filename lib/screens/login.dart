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

  authenticate()async{
    final isLogged=await UserService().authenticate(_usernameController.text, _passwordController.text);

    if (isLogged){ //si ingreso las credenciales correctas

      //crea una instancia de sharedPreferences
      final SharedPreferences prefs= await SharedPreferences.getInstance();
      //guarda el valor de _usernameController en la variable username
      await prefs.setString('username', _usernameController.text);
      //gusrda el valor de true en una variable isLogged
      await prefs.setBool('isLogged',true);
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

