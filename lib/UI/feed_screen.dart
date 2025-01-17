import 'package:fl_instagram/Bloc/storiesBloc.dart';
import 'package:fl_instagram/UI/post_screen.dart';
import 'package:fl_instagram/models/post.dart';
import 'package:fl_instagram/models/stories.dart';
import 'package:flutter/material.dart';
import 'package:fl_instagram/Bloc/commentBloc.dart';
import 'package:fl_instagram/Bloc/postBloc.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final PostBloc _postBloc = PostBloc();

  Widget _buildPost() {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              width: double.infinity,
              // height: 560.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: StreamBuilder<List<Post>>(
        stream: _postBloc.postListStream,
        builder: (context, snapshot) {
          return Column(
            children: snapshot.data.map((e){
              return Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image(
                                  height: 50.0,
                                  width: 50.0,
                                  image:
                                      AssetImage(e.authorImageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            e.authorName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(e.timeAgo),
                          trailing: IconButton(
                            icon: Icon(Icons.more_horiz),
                            color: Colors.black,
                            onPressed: () => print('More'),
                          ),
                        ),
                        InkWell(
                          onDoubleTap: () => print('Like post'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ViewPostScreen(
                                  post: e,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 400.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0, 5),
                                  blurRadius: 8.0,
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(e.imageUrl),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.favorite_border),
                                        iconSize: 30.0,
                                        onPressed: () => print('Like post'),
                                      ),
                                      Text(
                                        '1,000',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20.0),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.chat),
                                        iconSize: 30.0,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ViewPostScreen(
                                                post: e,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Text(
                                        '100',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.bookmark_border),
                                iconSize: 30.0,
                                onPressed: () => print('Save post'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
          );
            }).toList(),
          );
        })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        // header 1 : "instagram" "TV Logo" "Send Logo"
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Instagram',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 32.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.live_tv),
                      iconSize: 30.0,
                      onPressed: () => print('IGTV'),
                    ),
                    SizedBox(width: 16.0),
                    Container(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(Icons.send),
                        iconSize: 30.0,
                        onPressed: () => print('Direct Messages'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          //header 2: "Logo an foto bulet"
          Container(
            width: double.infinity,
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(width: 10.0);
                }
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image(
                        height: 60.0,
                        width: 60.0,
                        image: AssetImage(stories[index - 1]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildPost(),
          // _buildPost(1),
        ],
      ),
      // Bottom Navigator Bar
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 30.0,
                color: Colors.black,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.grey,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Color(0xFF23B66F),
                  onPressed: () => print('Upload photo'),
                  child: Icon(
                    Icons.add,
                    size: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 30.0,
                color: Colors.grey,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 30.0,
                color: Colors.grey,
              ),
              title: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> stories = [
  'assets/images/komandro.png',
  'assets/images/alfi.jpg',
  'assets/images/gipey.JPG',
  'assets/images/yopii.JPG',
  'assets/images/nico.JPG',
  'assets/images/anas.JPG',
  'assets/images/nata.JPG',
];
