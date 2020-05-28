//import
import 'dart:async';
import 'package:fl_instagram/models/comment.dart';

class CommentBloc {
  //List of comment
  List<Comment> _commentList = [
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
  ];

  //Stream Controller List
  final _commentListStreamController = StreamController<List<Comment>>();

  //Stream For Function

  //Stream sink getter
  Stream<List<Comment>> get commentListStream =>
      _commentListStreamController.stream;

  StreamSink<List<Comment>> get commentListSink =>
      _commentListStreamController.sink;

  //Constructor - listen to data ; listen changes
  CommentBloc() {
    _commentListStreamController.add(_commentList);
  }

  //dispose
  void dispose() {
    _commentListStreamController.close();
  }
}
