class Comment {
  String _authorName;
  String _authorImageUrl;
  String _text;

  Comment(this._authorName, this._authorImageUrl, this._text);

  //setter
  set authorName(String authorName){
    this._authorName = authorName;
  }
  set authorImageUrl(String authorImageUrl){
    this._authorImageUrl = authorImageUrl;
  }
  set text(String text){
    this._text = text;
  }

  //getter
  String get authorName => this._authorName;
  String get authorImageUrl => this._authorImageUrl;
  String get text => this._text;

}

final List<Comment> comments = [
  Comment(
    '_alfi',
    'assets/images/alfi.jpg',
    'Waaw seru sekaliiii',
  ),
  Comment(
    'gipey',
    'assets/images/gipey.JPG',
    'Kok gua ngga ada :(',
  ),
  Comment(
    'natasha',
    'assets/images/nata.JPG',
    'Nice Gan',
  ),
  Comment(
    'anas',
    'assets/images/anas.JPG',
    'wawww',
  ),
  Comment(
    'yopi',
    'assets/images/yopii.JPG',
    'wawww',
  ),

];
