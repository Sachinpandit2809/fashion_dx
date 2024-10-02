import 'package:fashion_dx/const/resource.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPictureSize: Size(75, 75),
                decoration: BoxDecoration(color: Colors.white),
                margin: EdgeInsets.symmetric(horizontal: 20),
                arrowColor: Colors.black,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    R.ASSETS_IMAGES_PNG_SPLASH3_PNG,
                  ),
                  radius: 25,
                ),
                accountName: Text("user name",
                    style: KTextStyle.k_12.copyWith(color: Colors.black)),
                accountEmail: Text("user-email@gmail.com ",
                    style: KTextStyle.k_12.copyWith(color: Colors.black))),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      "Home Page ",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text(
                      "Discover ",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text(
                      "My Orders ",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    leading: Icon(Icons.person),
                    title: Text(
                      " Profile ",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      "Setting ",
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
