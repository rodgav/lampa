import 'package:flutter/material.dart';
import 'package:lampa/models/atractivos.dart';
import 'package:lampa/pages/atractivoDetail.dart';
import 'package:lampa/pages/atractivos.dart';
import 'package:lampa/pages/ciudades.dart';
import 'package:lampa/pages/distritos.dart';
import 'package:lampa/pages/gastronomia.dart';
import 'package:lampa/pages/home.dart';
import 'package:lampa/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => SplashPage(),
        '/home': (_) => HompePage(),
        '/atractivos': (context) {
          if (ModalRoute.of(context).settings.arguments != null) {
            int index = ModalRoute.of(context).settings.arguments;
            return AtractivosPage(index: index);
          } else {
            return HompePage();
          }
        },
        '/ciudades.json': (context) {
          if (ModalRoute.of(context).settings.arguments != null) {
            int index = ModalRoute.of(context).settings.arguments;
            return CiudadesPage(index: index);
          } else {
            return HompePage();
          }
        },
        '/distritos.json': (context) {
          if (ModalRoute.of(context).settings.arguments != null) {
            int index = ModalRoute.of(context).settings.arguments;
            return DistritosPage(index: index);
          } else {
            return HompePage();
          }
        },
        '/gastronomia': (context) {
          if (ModalRoute.of(context).settings.arguments != null) {
            int index = ModalRoute.of(context).settings.arguments;
            return GastronomiaPage(index: index);
          } else {
            return HompePage();
          }
        },
        '/atractivoDetail': (context) {
          if (ModalRoute.of(context).settings.arguments != null) {
            Atractivos atractivo = ModalRoute.of(context).settings.arguments;
            return AtractivoDetailPage(atractivo: atractivo);
          } else {
            return HompePage();
          }
        },
      },
    );
  }
}
