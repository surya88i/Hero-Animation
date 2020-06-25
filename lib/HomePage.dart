import 'package:flutter/material.dart';
import 'package:sun/theme/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top: 50,left:10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.amberAccent,
                backgroundImage: AssetImage('assets/images/tuxedo.png'),
                foregroundColor: Colors.transparent,
              ),
              SizedBox(width: 10),
              Column(
                children: <Widget>[
                  Text(
                    "Sunil Shedge",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Active Status",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Column(
            children: drawerItems
                .map((e) => Card(
                  child: ListTile(
                      leading: Icon(e['icon'], color:primaryGreen),
                      title: Text(
                        e['title'],
                        style: TextStyle(
                          color: primaryGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {},
                    ),
                ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..rotateZ(isDrawerOpen ? 0 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 4 : 0),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      isDrawerOpen
                          ? Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: shadowList,
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                  ),
                                  color: Colors.teal,
                                  onPressed: () {
                                    setState(() {
                                      xOffset = 0;
                                      yOffset = 0;
                                      isDrawerOpen = false;
                                    });
                                  },
                                ),
                              ),
                            )
                          : Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: shadowList,
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: IconButton(
                                  color: Colors.teal,
                                  icon: Icon(Icons.menu, size: 20),
                                  onPressed: () {
                                    setState(() {
                                      xOffset = 200;
                                      yOffset = 25;
                                      isDrawerOpen = true;
                                    });
                                  },
                                ),
                              ),
                            ),
                      Text(
                        "Food Delivery",
                        style: TextStyle(
                          color: primaryGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/tuxedo.png'),
                        foregroundColor: Colors.transparent,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 210,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 175,
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            boxShadow: shadowList,
                            color: Colors.amber[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                            categories[index]['iconPath'],
                                            width: 20,
                                            height: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                    bottom: 30,
                                    child: Text(categories[index]['name'],
                                    style: TextStyle(
                                      color: primaryGreen,
                                      fontSize: 20,
                                  ))),
                              ]),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
