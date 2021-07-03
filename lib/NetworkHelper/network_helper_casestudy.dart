import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelpercasestudy {
  var  apiname;
  var data;
  NetworkHelpercasestudy({this.apiname, this.data});
  final String baseurl = "https://www.ehotelmanagement.com//CaseStudy/Case_Study_Api/";
  Future getData() async {
    var  url= Uri.parse(baseurl + apiname) ;
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("Inside Helper : //////$data");
      return data;
    } else {
      print(response.statusCode);
      print("Inside Helper else: //////$data");
    }
  }
}
