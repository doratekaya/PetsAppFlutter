
import 'package:flutter/widgets.dart';
import 'package:flutter_pets_app/Screens/breeds_screen.dart';
import 'package:flutter_pets_app/Screens/sub_breeds_screen.dart';

Map<String, WidgetBuilder> routes = {
  BreedsScreen.routeName : (context) => const BreedsScreen(),
  SubBreedScreen.routeName:(context) => const SubBreedScreen(),

};