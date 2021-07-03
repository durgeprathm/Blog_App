class FeedBackQuestion {
  String _Feedback_ID;
  String _Feedback_Question;
  String _Feedback_option;

  FeedBackQuestion(
    this._Feedback_ID,
    this._Feedback_Question,
    this._Feedback_option,
  );

  String get Feedback_ID => _Feedback_ID;

  set Feedback_ID(String value) {
    _Feedback_ID = value;
  }

  String get Feedback_Question => _Feedback_Question;

  String get Feedback_option => _Feedback_option;

  set Feedback_option(String value) {
    _Feedback_option = value;
  }

  set Feedback_Question(String value) {
    _Feedback_Question = value;
  }
}
