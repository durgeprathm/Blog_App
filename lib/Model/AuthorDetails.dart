class AuthorDetails {
  String _CaseStudy_Id;
  String _CaseStudy_Name;
  String _CaseStudy_Author_Name;
  String _CaseStudy_Author_Image;
  String _casestudy_Auther_id;
  String _casestudy_Seen_Status;

  AuthorDetails(
    this._CaseStudy_Id,
    this._CaseStudy_Name,
    this._CaseStudy_Author_Name,
    this._CaseStudy_Author_Image,
    this._casestudy_Auther_id,
    this._casestudy_Seen_Status,
  );

  String get CaseStudy_Id => _CaseStudy_Id;

  set CaseStudy_Id(String value) {
    _CaseStudy_Id = value;
  }

  String get CaseStudy_Name => _CaseStudy_Name;

  String get CaseStudy_Author_Image => _CaseStudy_Author_Image;

  set CaseStudy_Author_Image(String value) {
    _CaseStudy_Author_Image = value;
  }

  String get CaseStudy_Author_Name => _CaseStudy_Author_Name;

  set CaseStudy_Author_Name(String value) {
    _CaseStudy_Author_Name = value;
  }

  set CaseStudy_Name(String value) {
    _CaseStudy_Name = value;
  }

  String get casestudy_Auther_id => _casestudy_Auther_id;

  set casestudy_Auther_id(String value) {
    _casestudy_Auther_id = value;
  }

  String get casestudy_Seen_Status => _casestudy_Seen_Status;

  set casestudy_Seen_Status(String value) {
    _casestudy_Seen_Status = value;
  }
}
