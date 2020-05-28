import 'dart:async';

import 'package:fl_instagram/models/stories.dart';

class StoriesBloc {
  final List<Stories> _stories = [
    Stories('assets/images/komandro.png'),
    Stories('assets/images/alfi.jpg'),
    Stories('assets/images/gipey.JPG'),
  ];

  //Stream Controller List
  final _storiesStreamController = StreamController<List<Stories>>();

  //Stream For Function

  //Stream sink getter
  Stream<List<Stories>> get storiesStream =>
      _storiesStreamController.stream;

  StreamSink<List<Stories>> get storiesListSink =>
      _storiesStreamController.sink;

  //Constructor - listen to data ; listen changes
  StoriesBloc() {
    _storiesStreamController.add(_stories);
  }

  //dispose
  void dispose() {
    _storiesStreamController.close();
  }
}
