import 'package:flutter/material.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({super.key});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
var currentPage = DrawerSections.setting;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Settings", Icons.settings,
          currentPage == DrawerSections.setting ? true: false),
           menuItem(2, "Contact", Icons.contacts,
          currentPage == DrawerSections.contacts ? true: false),
           menuItem(3, "Send Feedback", Icons.settings,
          currentPage == DrawerSections.send_feedback ? true: false),
           menuItem(4, "Logout", Icons.logout_outlined,
          currentPage == DrawerSections.logout ? true: false),
        ],
      ),
    );
  }

  Widget menuItem( int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if (id == 1){
              currentPage = DrawerSections.setting;}
              else if(id ==2){
                currentPage = DrawerSections.contacts;
              }
              else if(id == 3){
                currentPage = DrawerSections.send_feedback;
              }
                else if(id == 4){
                  currentPage = DrawerSections.logout;
                }
            
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon, 
                  size: 20,
                   color: Colors.black,
                   ),
                   ),
                   Expanded(
                    flex: 1,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black, 
                        fontSize: 16),))
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections{
  setting,
  contacts,
  send_feedback,
  logout,
}