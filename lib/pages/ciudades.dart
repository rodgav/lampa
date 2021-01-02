import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lampa/models/ciudades.dart';
import 'package:lampa/widgets/bottomBarWid.dart';
import 'package:lampa/widgets/itemAtractivo.dart';

class CiudadesPage extends StatefulWidget {
  int index;

  CiudadesPage({@required this.index});

  @override
  _CiudadesPageState createState() => _CiudadesPageState();
}

class _CiudadesPageState extends State<CiudadesPage> {
  List<Ciudades> ciudades = [];
  List<bool> actIndbottom = [false, false, false, false, false];

  _createList() async {
    CiudadesModel my_data =
        CiudadesModel.fromJson(json.decode(await getJson()));
    ciudades = my_data.ciudades;
    setState(() {});
  }

  Future<String> getJson() {
    return rootBundle.loadString('assets/jsons/ciudades.json');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Ciudades',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            ciudades.length > 0
                ? GridView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ItemAtractivo(
                          asset: ciudades[index].imagen,
                          nombre: ciudades[index].nombre,
                          distancia: ciudades[index].distancia,
                          onTap: () => null);
                    },
                    itemCount: ciudades.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.5),
                  )
                : Container(
                    child: Center(
                      child: Text('No hay datos'),
                    ),
                  ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomBarWid(onTap: onTapB, actIndbottom: actIndbottom),
            )
          ],
        ),
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    _createList();
    _activateBar(widget.index);
  }

  _activateBar(int index) {
    actIndbottom[index] = true;
  }

  onTapB(int index) {
    //print('index $index');
    actIndbottom[0] = false;
    actIndbottom[1] = false;
    actIndbottom[2] = false;
    actIndbottom[3] = false;
    actIndbottom[4] = false;
    actIndbottom[index] = true;
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed('/atractivos', arguments: 0);
        break;
      case 1:
        Navigator.of(context)
            .pushReplacementNamed('/ciudades.json', arguments: 1);
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed('/home', arguments: 2);
        break;
      case 3:
        Navigator.of(context)
            .pushReplacementNamed('/distritos.json', arguments: 3);
        break;
      case 4:
        Navigator.of(context)
            .pushReplacementNamed('/gastronomia', arguments: 4);
        break;
    }
    setState(() {});
  }
}
