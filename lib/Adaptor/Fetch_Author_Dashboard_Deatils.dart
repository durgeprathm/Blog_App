
import 'package:blogapp/NetworkHelper/network_helper_casestudy.dart';
import 'package:blogapp/constant/shared_preference_constants.dart';

class FetchDashboardAuthorList {
  Future<dynamic> getFetchDashboardAuthorList(
      String actionid, String blogid) async {
    var map = new Map<String, dynamic>();

    var USERID = await SharedPreferencesConstants.instance
        .getStringValue(SharedPreferencesConstants.USERID);
    print("User ID ////////////////${USERID}");

    if (actionid == "0") {
      map['actionId'] = actionid;
    } else if (actionid == "1") {
      map['actionId'] = actionid;
      map['casestudyid'] = blogid;
      map['userid'] = "1";
    }

    String apifile = 'Fetch_Dashboard_Author_Details.php';
    NetworkHelpercasestudy networkHelper =
        new NetworkHelpercasestudy(apiname: apifile, data: map);
    var fetchdashboardauthorlist = await networkHelper.getData();
    return fetchdashboardauthorlist;
  }
}
