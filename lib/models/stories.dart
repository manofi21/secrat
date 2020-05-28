class Stories{
  String _authorImageUrl;

  Stories(this._authorImageUrl);

  set authorImageUrl(String authorImageUrl){
    this._authorImageUrl = authorImageUrl;
  }

  String get authorImageUrl => this._authorImageUrl;
}