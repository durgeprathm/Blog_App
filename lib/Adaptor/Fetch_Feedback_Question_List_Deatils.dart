import 'package:blogapp/NetworkHelper/network_helper_casestudy.dart';

class FetchFeedBackQuestionList {
  Future<dynamic> getFeedBackQuestionList(
      String actionid) async {
    var map = new Map<String, dynamic>();
    if (actionid == "0") {
      map['actionId'] = actionid;
    }

    String apifile = 'Fetch_Feedback_questions.php';
    NetworkHelpercasestudy networkHelper =
        new NetworkHelpercasestudy(apiname: apifile, data: map);
    var fetchfeedbackquestionlist = await networkHelper.getData();
    return fetchfeedbackquestionlist;
  }
}
