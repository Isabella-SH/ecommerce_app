import 'dart:convert';
import 'dart:io';                               //importar .io
import 'package:http/http.dart' as http;

class UserService{

  //https://plain-marbled-muskox.glitch.me/users?username=jmayta&password=1234

  /*
  array
  [1]
  0
  {5}
  username:   : "jmayta"
  last_name   : "Mayta"
  first_name  : "Jorge"
  password    : "1234"
  id          :  1
*/

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


  Future<bool> createUser(String username, String password, String firstName, String lastName) async {

    final url = 'https://plain-marbled-muskox.glitch.me/users';

    Map<String, String> body = {
      'username': username,
      'last_name': lastName,
      'first_name': firstName,
      'password': password,
    };

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );

    if (response.statusCode == HttpStatus.created) {
      return true;
    }
    return false;
  }

}


