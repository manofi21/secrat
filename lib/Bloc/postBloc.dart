//import
import 'dart:async';
import 'package:fl_instagram/UI/post_screen.dart';
import 'package:fl_instagram/models/post.dart';
import 'package:flutter/material.dart';

class PostBloc {
  List<Post> _postList = [
    Post(
      'komandro_ccit',
      'assets/images/komandro.png',
      '5 min',
      'assets/images/pendidikan.PNG',
    ),
    Post(
      '_alfinaufal',
      'assets/images/alfi.jpg',
      '10 min',
      'assets/images/alfi.jpg',
    ),
  ];

  //Stream Controller List
  final _postListStreamController = StreamController<List<Post>>();

  //Stream For Function

  final _postViewSteamController = StreamController<Post>();

  //Stream sink getter
  Stream<List<Post>> get postListStream => _postListStreamController.stream;
  StreamSink<List<Post>> get postListSink => _postListStreamController.sink;

  //Stream for changing to Post
  StreamSink<Post> get postView => _postViewSteamController.sink;

  //Constructor - listen to data ; listen changes
  PostBloc() {
    _postListStreamController.add(_postList);
    _postViewSteamController.stream.listen(_postView);
  }

  BuildContext get context => _element;
  StatefulElement _element;

  _postView(Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewPostScreen(),
      ),
    );
  }

  //dispose
  void dispose() {
    _postListStreamController.close();
    _postViewSteamController.close();
  }
}
