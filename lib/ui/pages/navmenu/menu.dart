import 'package:learncoding/theme/box_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learncoding/ui/widgets/topBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../help.dart';
import '../profile.dart';
import '../setting.dart';

String? name;
String? image;

class Menu extends StatefulWidget {
  final Animation<Offset>? slideAnimation;
  final Animation<double>? menuAnimation;
  final int? selectedIndex;
  final Function onMenuItemClicked;
  final onMenuTap;

  const Menu({
    Key? key,
    required this.onMenuTap,
    this.slideAnimation,
    this.menuAnimation,
    this.selectedIndex,
    required this.onMenuItemClicked,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void initState() {
    super.initState();
    getValue();
  }

  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    name = prefs.getString('name');
    image = prefs.getString('image');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.33,
            height: MediaQuery.of(context).size.height * 0.67,
            decoration: BoxDecoration(
              color: Color(0x80FFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 135,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/navwave.png"),
                  fit: BoxFit.fitWidth),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 28, 10, 0),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: widget.onMenuTap,
              ),
            )),
        SlideTransition(
          position: widget.slideAnimation!,
          child: ScaleTransition(
            scale: widget.menuAnimation!,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Help page when the user taps the widget
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(image!),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontFamily: "Red Hat Display",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  "Student",
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontFamily: "Red Hat Display",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            BoxIcons.bx_home_circle,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Home",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            BoxIcons.bx_edit,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Todo",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            BoxIcons.bx_book_alt,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Subjects",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            BoxIcons.bx_chat,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Forum",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            BoxIcons.bx_calendar,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Schedule",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                    SizedBox(
                      height: 1,
                      width: 200,
                      child: Container(
                        color: Colors.white54,
                      ),
                    ),
                    Spacer(flex: 2),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Help page when the user taps the widget
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              BoxIcons.bx_cog,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Settings",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontFamily: "Red Hat Display",
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 2),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Help page when the user taps the widget
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Help()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              BoxIcons.bx_help_circle,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Help",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
