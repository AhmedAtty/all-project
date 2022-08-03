import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sex_smart/local/cash_hlper.dart';
import 'package:sex_smart/pages/screenbottom/catgory_screen.dart';
import 'package:sex_smart/pages/screenbottom/favorit.dart';
import 'package:sex_smart/pages/screenbottom/home_screen.dart';
import 'package:sex_smart/pages/screenbottom/setting_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class BottomProvedr extends ChangeNotifier {
  Position? position2;
  String? currentAddress;

  void getLoctionCurint() async {
    Position position = await _determinePosition();
    position2 = position;

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position2!.latitude,
      position2!.longitude,
    );
    Placemark place = await placemarks[0];
    currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}, ${place.street}";
    notifyListeners();
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  int curintIndex = 1;
  var context;

  void ChingIndex(index) {
    curintIndex = index;
    notifyListeners();
  }

  int currintIndex = 1;
  List<Widget> listScreen = [
    FavoritScreen(),
    HomeScreen(),
    CatgoryScreen(),
    SettingScreen(),
  ];
  List<String> listTitle = [
    'HomeScreen',
    'CatgoryScreen',
    'FavoriteScreen',
    'SettingsScreen',
  ];

  List<Widget> lisBottom = [
    Icon(
      Icons.add_shopping_cart_outlined,
      size: 25,
    ),
    Icon(
      CupertinoIcons.home,
      size: 33,
      color: Colors.redAccent,
    ),
    Icon(
      Icons.favorite,
      size: 25,
    ),
    Icon(
      Icons.settings,
      size: 25,
    ),
  ];

  bool isdark = false;

  void checkisdark({@required bool? fromshard}) {
    if (fromshard != null) {
      isdark = fromshard;
      notifyListeners();
    } else
      isdark = !isdark;
    Cash_Hlper.putBoolean(key: 'isDark', value: isdark).then((value) {
      notifyListeners();
    });
  }

  bool iseye = false;

  checkeye(eyepass) {
    iseye = !eyepass;
    notifyListeners();
  }

  checkshow(context) {
    showModalBottomSheet(context: context, builder: (context) => Show());

    notifyListeners();
  }


  BottomProvedr(){
    getLoctionCurint();
    notifyListeners();
  }
}
