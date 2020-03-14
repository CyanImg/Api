import 'package:dio/dio.dart';
import 'dart:convert';

Future<Response> login(String username, String password) async {
  String url = "http://localhost:8000/api/user/login?username=${username}&password=${password}";
  Response response = await Dio().get(url);
  return response;
}

Future<Response> register(String username, String password, String schoolname, String email) async {
  String url = "http://localhost:8000/api/user/register?username=${username}&password=${password}&schoolname=${schoolname}&email=${email}";
  Response response = await Dio().get(url);
  return response;
}

// doLogin is a sample for using login api
doLogin(){
  login("prj", "admin").then((result){
    var decoded = json.decode(result.toString());
    if(decoded["message"]=="success"){
      print("login ok");
    }
    else{
      print("login failed");
    }
  });
}
//doRegister is a sample for using register api
doRegister(){
  register("icbm", "icbm", "SWPU", "1@abc.com").then((result){
    var decoded = json.decode(result.toString());
    if(decoded["message"]=="user created"){
      print("register ok");
    }
    else{
      print("register failed");
    }
  });
}
main(){
  doRegister();
}