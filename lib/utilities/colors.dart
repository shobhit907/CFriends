import 'package:CFriends/index.dart';
import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class NameColor{
    static Color getNameColor(String rank){
        String _color="#FFFFFF";
        if(rank=="newbie"){
          _color="#7F828F";
        }else if(rank=="pupil"){
          _color="#358441";
        }else if(rank=="specialist"){
          _color="#37A99E";
        }else if(rank=="expert"){
          _color="#3766FC";
        }else if(rank=="candidate master"){
          _color="#AC4FAB";
        }else if(rank=="master"){
          _color="#FB8C28";
        }else if(rank=="international master"){
          _color="#FB8C28";
        }else if(rank=="grandmaster"){
          _color="#F64225";
        }else if(rank=="international grandmaster"){
          _color="#F64225";
        }else if(rank=="legendary grandmaster"){
          _color="#F64225";
        }
        return HexColor(_color);
    }
    NameColor();
}

