import 'package:blogapp/NetworkHelper/network_helper_casestudy.dart';

class FetchAuthorDetailsList {
  Future<dynamic> getAuthorDetailsList(String actionid, String authorid) async {
    var map = new Map<String, dynamic>();
    if (actionid == "0") {
      map['actionId'] = actionid;
      map['Authorid'] = authorid;
    }

    String apifile = 'Fetch_Author_Detais.php';
    NetworkHelpercasestudy networkHelper =
        new NetworkHelpercasestudy(apiname: apifile, data: map);
    var fetchauthordetailslist = await networkHelper.getData();
    return fetchauthordetailslist;
  }
}
