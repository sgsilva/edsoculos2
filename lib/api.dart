import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.1.26:3000/api";
//const baseUrl = "http://34.95.159.89:3000/api";

// 192.168.43.163:3000/api/questions
class API {
  static Future getUsers() async{
    var url = baseUrl + "/questions";
    return http.get(url);
  }
}

