class Post {
  String _authorName;
  String _authorImageUrl;
  String _timeAgo;
  String _imageUrl;

  Post(this._authorName, this._authorImageUrl, this._timeAgo, this._imageUrl);

  //setter
  set authorName(String authorName){
    this._authorName = authorName;
  }
  set authorImageUrl(String authorImageUrl){
    this._authorImageUrl = authorImageUrl;
  }
  set timeAgo(String timeAgo){
    this._timeAgo = timeAgo;
  }
  set imageUrl(String imageUrl){
    this._imageUrl = imageUrl;
  }

  //getter
  String get authorName => this._authorName;
  String get authorImageUrl => this._authorImageUrl;
  String get timeAgo => this._timeAgo;
  String get imageUrl => this._imageUrl;

}