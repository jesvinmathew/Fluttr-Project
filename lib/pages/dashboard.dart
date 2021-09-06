import 'package:flutter/material.dart';
import 'package:ellie_fe/routes/routeNames.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

final appLogo = Text('SAASH Magna');
final appNotifications = Icon(Icons.notifications);
final menuIcon = Icon(Icons.menu);

final appHeader = Row(
  children: [appLogo, appNotifications, menuIcon],
);

const List gridItems = [
  'Inspections Due',
  'Inspections Due',
  'Inspections Due',
  'Inspections Due',
  'Inspections Due',
  'Inspections Due',
  'Inspections Due',
  'Inspections Due',
  'Inspections Due',
];

final navigationGrids = GridView.count(
  crossAxisCount: 3,
  padding: EdgeInsets.all(10),
  shrinkWrap: true,
  mainAxisSpacing: 0,
  crossAxisSpacing: 0,
  children: List.generate(gridItems.length, (index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Center(
        child: Text(gridItems[index]),
      ),
    );
  }),
);

final navigationGridsContainer = Container(
  child: navigationGrids,
  // height: 500,
  width: 200,
  padding: EdgeInsets.all(10),
  margin: EdgeInsets.all(10),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12), color: Colors.white),
  constraints: BoxConstraints(maxWidth: 100),
);

final infoGrids = ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 4,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: AssetImage('images/top-banner.jpg'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Text(
              'INR 52,00,000',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      );
    });

final infoGridsContainer = Container(
  child: infoGrids,
  height: 200,
);

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    void navigateFromBottom(int index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, SettingsViewRoute);
          break;
        case 1:
          Navigator.pushNamed(context, SettingsViewRoute);
          break;
        case 2:
          Navigator.pushNamed(context, LoginViewRoute);
          break;
        default:
          break;
      }
    }

    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff005ba2), Color(0xff053251)]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.grey,
            leading: appLogo,
            actions: [appNotifications, menuIcon],
          ),
          body: Center(
            child: ListView(
              // shrinkWrap: true,
              children: [
                // appHeader,
                infoGridsContainer,
                navigationGridsContainer
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
              BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout')
            ],
            onTap: navigateFromBottom,
          ),
        ));
  }
}
