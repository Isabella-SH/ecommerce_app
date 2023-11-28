import 'dart:convert';
import 'dart:io';                               //importar .io
import 'package:http/http.dart' as http;

class UserService{

  //https://plain-marbled-muskox.glitch.me/users?username=isa&password=123

  final String _baseUrl="https://plain-marbled-muskox.glitch.me/users?";
  final String _username = 'username=';
  final String _password = '&password=';


  //devuelve en algun momento una lista
  Future<bool> authenticate(String username, String password) async{

    //concatena un dato a la ruta
    final url='$_baseUrl$_username$username$_password$password';

    http.Response response=await http.get(Uri.parse(url));

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){

      //es la respuesta de tod el json
      final jsonResponse=response.body;
      //convertir la respuesta en un arreglo
      final users=json.decode(jsonResponse);

      return users.isNotEmpty;
    }
    return false;
  }
}


