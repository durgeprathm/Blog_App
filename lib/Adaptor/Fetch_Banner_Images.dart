import 'package:blogapp/NetworkHelper/network_helper_casestudy.dart';

class FetchBannerImage {
  Future<dynamic> getFetchBannerImage(String actionid) async {
    var map = new Map<String, dynamic>();
    if (actionid == "0") {
      map['actionId'] = actionid;
    }

    String apifile = 'Fetch_Banner_Images.php';
    NetworkHelpercasestudy networkHelper =
        new NetworkHelpercasestudy(apiname: apifile, data: map);
    var fetchbannerimage = await networkHelper.getData();
    return fetchbannerimage;
  }
}
