
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class Encrypt{

  static String MD5(String s){
    var content = new Utf8Encoder().convert(s);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}