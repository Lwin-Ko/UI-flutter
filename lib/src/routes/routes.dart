import 'package:chat_app/src/pages/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/src/pages/calendar.dart';
import 'package:chat_app/src/pages/news.dart';
import 'package:chat_app/src/pages/notifications.dart';
import 'package:chat_app/src/pages/router_page.dart';
import 'package:chat_app/src/pages/search_page.dart';
import 'package:chat_app/src/pages/setting.dart';

import 'package:chat_app/src/pages/login.dart';
import 'package:chat_app/src/pages/index.dart';
import 'package:chat_app/src/pages/home.dart';
import 'package:chat_app/src/pages/profile.dart';

Map<String, WidgetBuilder> getRoutesApp() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'login': (BuildContext context) => LoginPage(),
    'Profile': (BuildContext context) => ProfilePage(),
    'Chat': (BuildContext context) => IndexPage(),
    'Calendar': (BuildContext context) => CalendarPage(),
    'Search': (BuildContext context) => SearchPage(),
    'Notifications': (BuildContext context) => ChatListPage(),
    'News': (BuildContext context) => NewsPage(),
    'Settings': (BuildContext context) => SettingsPage(),
    '/' :  (BuildContext context) => RouterPage(),
  };
}
