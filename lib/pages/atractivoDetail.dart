import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lampa/models/atractivos.dart';
import 'package:url_launcher/url_launcher.dart';

class AtractivoDetailPage extends StatelessWidget {
  Atractivos atractivo;

  AtractivoDetailPage({@required this.atractivo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 200.00,
              elevation: 0.0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImage(
                imageUrl: atractivo.imagen,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      atractivo.nombre,
                      style: TextStyle(
                          fontSize: 25.00, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(atractivo.descripcion),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: atractivo.imagen,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            Positioned(
                              top: 25,
                              left: 25,
                              right: 25,
                              bottom: 25,
                              child: Image.asset(
                                'assets/images/play.png',
                                color: Colors.red,
                                height: 30,
                              ),
                            )
                          ],
                        ),
                        onTap: () => _launchURL(context, atractivo.video)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _AbrirMaps(atractivo.latitud, atractivo.longitud);
                          }),
                      Column(
                        children: [
                          Text(
                            'Latitud: ${atractivo.latitud}',
                            style: TextStyle(
                                fontSize: 18.0, fontStyle: FontStyle.italic),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                          ),
                          Text(
                            'Longitud: ${atractivo.longitud}',
                            style: TextStyle(
                                fontSize: 18.0, fontStyle: FontStyle.italic),
                          )
                        ],
                      )
                    ],
                  ),)
                ],
              ),
            )
          ],
        ));
  }

  _launchURL(BuildContext context, String url) async {
    if (url != '') {
      if (await canLaunch(url)) {
        await launch(url);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('URL no encontrada'),
        duration: const Duration(seconds: 5),
      ));
    }
  }

  Future _AbrirMaps(latitud, longitud) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitud,$longitud';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puedo abrir';
    }
  }
}
