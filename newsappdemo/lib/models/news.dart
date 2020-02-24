class News {
  String _title;
  String _desc;
  String _imageUrl;
  News(this._title, this._desc, this._imageUrl);

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  String get desc => _desc;

  set desc(String value) {
    _desc = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  @override
  String toString() {
    return 'News{_title: $_title, _desc: $_desc, _imageUrl: $_imageUrl}\n';
  }
}
