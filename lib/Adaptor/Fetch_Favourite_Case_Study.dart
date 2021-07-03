

import 'package:blogapp/NetworkHelper/network_helper_casestudy.dart';

class FetchFavouriteCaseStudy {
  Future<dynamic> getFetchFavouriteCaseStudy(String actionid) async {
    var map = new Map<String, dynamic>();

  //   var USERID = await SharedPreferencesConstants.instance
  //       .getStringValue(SharedPreferencesConstants.USERID);
  // print("User ID ////////////////${USERID}");

    if (actionid == "0") {
      map['actionId'] = actionid;
      map['userid'] = "1";
    }

    String apifile = 'Fetch_Favourite_Case_Study.php';
    NetworkHelpercasestudy networkHelper =
        new NetworkHelpercasestudy(apiname: apifile, data: map);
    var fetchfavouritecasestudy = await networkHelper.getData();
    return fetchfavouritecasestudy;
  }
}
