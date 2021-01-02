import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lampa/models/atractivos.dart';
import 'package:lampa/widgets/bottomBarWid.dart';
import 'package:lampa/widgets/itemAtractivo.dart';

class AtractivosPage extends StatefulWidget {
  int index;

  AtractivosPage({@required this.index});

  @override
  _AtractivosPageState createState() => _AtractivosPageState();
}

class _AtractivosPageState extends State<AtractivosPage> {
  List<Atractivos> atractivos = [];
  List<bool> actIndbottom = [false, false, false, false, false];

  _createList() async {
    AtractivosModel my_data =
        AtractivosModel.fromJson(json.decode(await getJson()));
    atractivos = my_data.atractivos;
    setState(() {});
  }

  Future<String> getJson() {
    return rootBundle.loadString('assets/jsons/atractivos.json');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold( backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Atractivos',
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
            atractivos.length > 0
                ? GridView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ItemAtractivo(
                          asset: atractivos[index].imagen,
                          nombre: atractivos[index].nombre,
                          distancia: atractivos[index].distancia,
                          onTap: () => onTap(context, atractivos[index]));
                    },
                    itemCount: atractivos.length,
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
        Navigator.of(context).pushReplacementNamed('/ciudades.json', arguments: 1);
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed('/home', arguments: 2);
        break;
      case 3:
        Navigator.of(context).pushReplacementNamed('/distritos.json', arguments: 3);
        break;
      case 4:
        Navigator.of(context)
            .pushReplacementNamed('/gastronomia', arguments: 4);
        break;
    }
    setState(() {});
  }

  onTap(BuildContext context, Atractivos atractivo) {
    Navigator.of(context).pushNamed('/atractivoDetail', arguments: atractivo);
  }
}
