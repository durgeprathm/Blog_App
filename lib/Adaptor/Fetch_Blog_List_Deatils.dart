import 'package:blogapp/NetworkHelper/network_helper_casestudy.dart';


class FetchBlogList {
  Future<dynamic> getFetchBlogList(String actionid) async {
    var map = new Map<String, dynamic>();

    // var USERID = await SharedPreferencesConstants.instance
    //     .getStringValue(SharedPreferencesConstants.USERID);
    // print("User ID ////////////////${USERID}");

    if (actionid == "0") {
      map['actionId'] = actionid;
      map['userid'] = "1";
    }

    String apifile = 'Fetch_blog_list.php';
    NetworkHelpercasestudy networkHelper =
        new NetworkHelpercasestudy(apiname: apifile, data: map);
    var fetchbloglist = await networkHelper.getData();
    return fetchbloglist;
  }
}
