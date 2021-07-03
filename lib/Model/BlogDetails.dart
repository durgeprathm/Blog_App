class BlogDetails {
  String _blog_Id;
  String _blog_Name;
  String _blog_Author_Name;
  String _blog_Author_Image;
  String _blog_Details;
  String _blog_image;
  String _blog_Author_id;
  String _blog_seenstatus;
  String _blog_Likestatus;

  BlogDetails(
      this._blog_Id,
      this._blog_Name,
      this._blog_Author_Name,
      this._blog_Author_Image,
      this._blog_Details,
      this._blog_image,
      this._blog_Author_id,
      this._blog_seenstatus,
      this._blog_Likestatus);

  String get blog_Id => _blog_Id;

  set blog_Id(String value) {
    _blog_Id = value;
  }

  String get blog_Name => _blog_Name;

  String get blog_image => _blog_image;

  set blog_image(String value) {
    _blog_image = value;
  }

  String get blog_Details => _blog_Details;

  set blog_Details(String value) {
    _blog_Details = value;
  }

  String get blog_Author_Image => _blog_Author_Image;

  set blog_Author_Image(String value) {
    _blog_Author_Image = value;
  }

  String get blog_Author_Name => _blog_Author_Name;

  set blog_Author_Name(String value) {
    _blog_Author_Name = value;
  }

  set blog_Name(String value) {
    _blog_Name = value;
  }

  String get blog_Author_id => _blog_Author_id;

  set blog_Author_id(String value) {
    _blog_Author_id = value;
  }

  String get blog_Likestatus => _blog_Likestatus;

  set blog_Likestatus(String value) {
    _blog_Likestatus = value;
  }

  String get blog_seenstatus => _blog_seenstatus;

  set blog_seenstatus(String value) {
    _blog_seenstatus = value;
  }
}
