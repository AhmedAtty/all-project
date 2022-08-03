import 'package:flutter/material.dart';
import 'package:sex_smart/provider/bottom_pro/bottom_prov.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class CardGetMap extends StatefulWidget {

  @override
  State<CardGetMap> createState() => _CardGetMapState();
}

class _CardGetMapState extends State<CardGetMap> {


  @override
  Widget build(BuildContext context) {
    BottomProvedr provedr=Provider.of<BottomProvedr>(context);
    return Scaffold(
      body: Center(
        child: provedr.position2 !=null ? Text('curint Lociton :'+
            provedr.currentAddress!):Text('No Loction Data'),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: (){
          provedr.getLoctionCurint();

        },
      ),
    );
  }
}
