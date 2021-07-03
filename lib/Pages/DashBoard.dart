import 'package:blogapp/Pages/Home_Page.dart';
import 'package:blogapp/Pages/Search_Page.dart';
import 'package:blogapp/Pages/WelcomePage.dart';
import 'package:blogapp/Pages/blogPage.dart';
import 'package:blogapp/Pages/favorite_Page.dart';
import 'package:blogapp/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  int _selectedIndex = 0;
  bool showproducts = false;
  String _title = "";
  String userName = "";
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BlogPage(),
    FavoraitePage(),
  ];

  @override
  initState() {
    _title = 'Case Study';
    _IsSearching = false;
    //getUserdata();
  }

  // getUserdata() async {
  //   var tempUsernameName = await SharedPreferencesConstants.instance
  //       .getStringValue(SharedPreferencesConstants.USERNAME);
  //   setState(() {
  //     userName = tempUsernameName;
  //     print('userfullName:${userName}');
  //   });
  // }

  Widget appBarTitle = Text('Montly Case Study');
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Montly Case Study';
            Widget appBarTitle = Text('Case Study');
          }
          break;
        case 1:
          {
            _title = 'Previous Case Study';
            Widget appBarTitle = Text('Recent Case Study');
          }
          break;
        case 2:
          {
            _title = 'Favourite Case Study';
            Widget appBarTitle = Text('Recent Case Study');
          }
          break;
      }
    });
  }

  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );

  TextEditingController searchController = TextEditingController();
  bool _IsSearching;
  String _searchText = "";
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();

  Widget build(BuildContext context) {
    void _handleSearchStart() {
      setState(() {
        _IsSearching = true;
      });
    }

    void _handleSearchEnd() {
      setState(() {
        this.actionIcon = new Icon(
          Icons.search,
          color: Colors.white,
        );
        this.appBarTitle = new Text(
          "Search Sample",
          style: new TextStyle(color: Colors.white),
        );
        _IsSearching = false;
        _searchQuery.clear();
      });
    }

    Widget buildBar(BuildContext context) {
      return new AppBar(
          centerTitle: true,
          title: appBarTitle,
          actions: <Widget>[
            new IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = new Icon(
                      Icons.close,
                      color: Colors.white,
                    );
                    this.appBarTitle = new TextField(
                      controller: _searchQuery,
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                      decoration: new InputDecoration(
                          prefixIcon:
                              new Icon(Icons.search, color: Colors.white),
                          hintText: "Search...",
                          hintStyle: new TextStyle(color: Colors.white)),
                    );
                    _handleSearchStart();
                  } else {
                    _handleSearchEnd();
                  }
                });
              },
            ),
          ]);
    }

    return Scaffold(
      key: key,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text(
          _title,
          style: AppbarStyle,
        ),
        actions: [
          IconButton(
            icon: actionIcon,
            onPressed: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return SearchListView();
              }));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.0),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/Userimage.jpg'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '${userName}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("assets/images/house.png")),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("assets/images/programmer.png")),
              title: Text(
                'View Profile',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: primaryColor,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("assets/images/call-center.png")),
              title: Text(
                'Support',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: primaryColor,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("assets/images/feedback.png")),
              title: Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: primaryColor,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
                leading: Container(
                    width: MediaQuery.of(context).size.width / 15,
                    child: Image.asset("assets/images/logout.png")),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: primaryColor,
                  ),
                ),
                onTap: () async {
                  //await SharedPreferencesConstants.instance.removeAll();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) {
                      return WelcomePage();
                    }),
                  );
                }),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
              // color: primarywhiteColor,
            ),
            label: 'Home',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.backspace,
              //color:primarywhiteColor,
            ),
            label: 'Previous',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.heart,
              //color:primarywhiteColor,
            ),
            label: 'Favourite',
            backgroundColor: primaryColor,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: primaryColor,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 25),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
