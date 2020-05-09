import 'dart:convert';

import 'package:CFriends/index.dart';
import 'package:http/http.dart' as http;

class CodeforcesService {
  var url = "https://codeforces.com/api/user.info?handles=shobhit907;roronoa_;";
  Future fetchData() async {
    var response = await http.get(url);
    return response.body;
  }

  Future<List<CFUser>> fetchUsers(List<String> handles) async {
    var _baseUrl = "https://codeforces.com/api/user.info?handles=";
    // print("In fetch user");
    // print(handles);
    handles.forEach((handle) {
      _baseUrl += handle + ";";
    });
    var _response = await http.get(_baseUrl);
    var _decode = json.decode(_response.body);
    if (_decode['status'] == "OK") {
      List _result = _decode['result'].cast<Map<String, dynamic>>();
      //Isolate
      List<CFUser> _ret = [];
      _result.forEach((_res) {
        _ret.add(CFUser.fromJson(_res));
      });
      return _ret;
    } else {
      return List();
    }
  }

  Future<bool> userExists(String handle) async {
    var _baseUrl = "https://codeforces.com/api/user.info?handles=";
    _baseUrl += handle;
    var _response = await http.get(_baseUrl);
    var _decode = json.decode(_response.body);
    if (_decode['status'] == "OK") {
      return true;
    } else {
      return false;
    }
  }
}
