import 'package:flutter/material.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/animated_container.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/'                 : (context) => HomePage(),
    'avatar'            : (context) => AvatarPage(),
    'alert'             : (context) => AlertPage(),
    'card'              : (context) => CardPage(),
    'animatedContainer' : (context) => AnimatedContainerPage(),
    'inputs'            : (context) => InputPage(),
  };
}
