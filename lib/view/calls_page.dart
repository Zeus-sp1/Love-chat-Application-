import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_icons/line_icons.dart';
import 'package:love_chat/constants.dart';
import 'package:sizer/sizer.dart';

class CallPage extends StatefulWidget {
  static String id = 'CallPage';

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.pink,
        appBar: getAppBar(),
        body: getBody(),
      );
    });
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black45,
      centerTitle: true,
      leading: IconButton(
        icon: Text(
          'Edit',
          style: TextStyle(
              fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w500),
        ),
        onPressed: null,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.call,
            color: Wcolor,
          ),
          onPressed: null,
        ),
      ],
      title: Container(
        width: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeMenu = 0;
                  });
                },
                child: Container(
                  width: 75,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: activeMenu == 0
                          ? Colors.white.withOpacity(0.3)
                          : Colors.transparent),
                  child: Center(
                    child: Text(
                      'All',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeMenu = 1;
                  });
                },
                child: Container(
                  width: 75,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: activeMenu == 1
                          ? Colors.white.withOpacity(0.3)
                          : Colors.transparent),
                  child: Center(
                    child: Text(
                      'Missed',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Calls',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: 38,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white.withOpacity(0.2),
                      decoration: InputDecoration(
                        prefixIcon: Icon(LineIcons.search,
                            color: Colors.white.withOpacity(0.3)),
                        border: InputBorder.none,
                        hintText: 'search',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.3), fontSize: 17),
                      ),
                    )),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: Center(
                          child: Icon(
                        Icons.video_call,
                        color: Colors.blue,
                        size: 25,
                      )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Create a room',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Divider(color: Colors.white.withOpacity(0.3)),
        ),
        activeMenu == 0 ? getAll() : getMissed()
      ],
    );
  }

  Widget getAll() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          width: 88.w,
          height: 10.h,
          child: Row(children: [
            Container(
                width: 20.w,
                height: 10.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          "images/myimg.jpg",
                        ),
                        fit: BoxFit.cover))),
            SizedBox(
              width: 2.w,
            ),
            Container(
              width: 35.w,
              height: 10.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sunday',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        size: 17,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Incoming',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w400)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 20),
            Container(
                width: 23.w,
                height: 8.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('10/8/20',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w500)),
                    Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                    )
                  ],
                )),
            Divider(color: Colors.white)
          ]),
        ),
      )
    ]);
  }

  Widget getMissed() {
    return Container();
  }
}
