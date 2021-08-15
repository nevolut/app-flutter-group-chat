
import 'package:flutter/material.dart';

ImageProvider getDisplayImage(image, {type = 0}){
    if(checkIsNullValue(image)){
      if(type==1)
        return AssetImage("assets/images/user.png");
      return AssetImage("assets/images/default.jpg");
    }
    return NetworkImage(image);
  }

bool checkIsNullValue(dynamic value) {
  return [null, "null", 0, "0", ""].contains(value);
}

String getArrayString(List arr){
  String res = "";
  for (var i=0; i<arr.length; i++) {
      res += (i < arr.length-1) ? arr[i] + ", " : arr[i];
  }
  return res;
}