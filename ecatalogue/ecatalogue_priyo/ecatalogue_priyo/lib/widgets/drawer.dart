import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://scontent.frdp4-1.fna.fbcdn.net/v/t39.30808-6/274003940_5105562129496153_5110215183453031415_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=174925&_nc_ohc=yMRTMf3SsUcAX9SDizz&_nc_ht=scontent.frdp4-1.fna&oh=00_AT_POdOgMqlGNYma9tn5L9BzZjg8W4TX0MOimTcNUCYsng&oe=6237E4EA";
    return Drawer(
      child: Container(
        color: Colors.orangeAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 238, 127, 94)),
                accountName: Text("Aarunya Naga"),
                accountEmail: Text("priyonaga@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
                  color: Color.fromARGB(255, 3, 3, 3)),
              title: Text(
                "profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Color.fromARGB(255, 247, 245, 245),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail,
                  color: Color.fromARGB(255, 207, 6, 6)),
              title: Text(
                "E-mail Me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
