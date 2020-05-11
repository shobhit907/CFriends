import 'dart:convert';

import 'package:CFriends/index.dart';
import 'package:CFriends/models/cf_submission.dart';
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

  Future<Pair<bool,String>> userExists(String handle) async {
    var _baseUrl = "https://codeforces.com/api/user.info?handles=";
    _baseUrl += handle;
    var _response = await http.get(_baseUrl);
    var _decode = json.decode(_response.body);
    if (_decode['status'] == "OK") {
      return Pair<bool,String>(true,_decode['result'].cast<Map<String,dynamic>>()[0]['handle']);
    } else {
      return Pair<bool,String>(false,"");
    }
  }

  Future<List<Submission>> fetchSubmissions(String handle,{int start=1,int count=10})async{
    var _baseUrl="https://codeforces.com/api/user.status?handle=$handle&from=$start&count=$count";
    var _response = await http.get(_baseUrl);
    var _decode = json.decode(_response.body);
    // print(_decode);
    if(_decode['status']=="OK"){
      List _result = _decode['result'].cast<Map<String, dynamic>>();
      //Isolate
      List<Submission> _ret = [];
      _result.forEach((_res) {
        _ret.add(Submission.fromJson(_res));
      });
      return _ret;
    }else{
      return List();
    }
  }
}
