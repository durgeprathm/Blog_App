import 'package:blogapp/NetworkHelper/network_helper_casestudy.dart';

class InsertLikeCaseStudy {
  Future<dynamic> getInsertLikeCaseStudy(
      String actionid, String casestudyID) async {
    var map = new Map<String, dynamic>();

    // var USERID = await SharedPreferencesConstants.instance
    //     .getStringValue(SharedPreferencesConstants.USERID);
    // print("User ID ////////////////${USERID}");

    if (actionid == "0") {
      map['actionId'] = actionid;
      map['userid'] = "1";
      map['caseid'] = casestudyID;
    }else if (actionid == "1") {
      map['actionId'] = actionid;
      map['userid'] = "1";
      map['caseid'] = casestudyID;
    }

    String apifile = 'Insert_Seen_Like_status.php';
    NetworkHelpercasestudy networkHelper =
        new NetworkHelpercasestudy(apiname: apifile, data: map);
    var insertlikecasestudy = await networkHelper.getData();
    return insertlikecasestudy;
  }
}
