

import 'package:blogapp/NetworkHelper/network_helper_casestudy.dart';
import 'package:blogapp/constant/shared_preference_constants.dart';

class FetchSeenCaseStudy {
  Future<dynamic> getFetchSeenCaseStudy(String actionid) async {
    var map = new Map<String, dynamic>();

    var USERID = await SharedPreferencesConstants.instance
        .getStringValue(SharedPreferencesConstants.USERID);
    print("User ID ////////////////${USERID}");

    if (actionid == "0") {
      map['actionId'] = actionid;
      map['userid'] = "1";
    }

    String apifile = 'Fetch_seen_Case_Study.php';
    NetworkHelpercasestudy networkHelper =
        new NetworkHelpercasestudy(apiname: apifile, data: map);
    var fetchseencasestudy = await networkHelper.getData();
    return fetchseencasestudy;
  }
}
