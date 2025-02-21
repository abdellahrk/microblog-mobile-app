import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:microblog_app/screen/dashboard/new_blog_post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final SharedPreferencesAsync _sharedPref = SharedPreferencesAsync();
  String? username;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setUsername();
  }

  void setUsername() async {
    username = await _sharedPref.getString("fullName");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.deepPurple,
        surfaceTintColor: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(20.0, 18.0),
          ),
        ),
        title: Text("Dashboard"),
        leading: IconButton(
          onPressed: () {
            print("clicked");
          },
          icon: Icon(Icons.add),
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Hello $username",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      context.go('/my-blog-posts');
                    },
                    child: Text(
                      "Blog Posts",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/new-post');
                    },
                    child: Container(
                      child: Text(
                        "Add Blog Post",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: null,
                    child: Container(
                      child: Text(
                        "Profile",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewBlogPost()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
