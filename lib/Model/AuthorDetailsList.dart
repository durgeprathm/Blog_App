class AuthorDetailsList {
  String _Author_id;
  String _Author_name;
  String _Author_image;
  String _Author_bio;
  String _Author_birth_day;

  AuthorDetailsList(
    this._Author_id,
    this._Author_name,
    this._Author_image,
    this._Author_bio,
    this._Author_birth_day,
  );

  String get Author_id => _Author_id;

  set Author_id(String value) {
    _Author_id = value;
  }

  String get Author_name => _Author_name;

  String get Author_birth_day => _Author_birth_day;

  set Author_birth_day(String value) {
    _Author_birth_day = value;
  }

  String get Author_bio => _Author_bio;

  set Author_bio(String value) {
    _Author_bio = value;
  }

  String get Author_image => _Author_image;

  set Author_image(String value) {
    _Author_image = value;
  }

  set Author_name(String value) {
    _Author_name = value;
  }
}
