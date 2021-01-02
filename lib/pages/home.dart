import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lampa/widgets/bottomBarWid.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HompePage extends StatefulWidget {
  @override
  _HompePageState createState() => _HompePageState();
}

class _HompePageState extends State<HompePage> {
  List<bool> actIndbottom = [false, false, true, false, false];
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
  }

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'dVfmHhDs-80',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      'Lampa',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'La provincia de Lampa se encuentra localizada en el departamento y '
                      'región de Puno. Esta es asimismo conocida con los nombres de '
                      '“La ciudad rosada” o “La ciudad de las siete maravillas”. '
                      'Su creación como provincia se remonta al 21 de Junio de 1825,'
                      ' aunque esta ya existía desde tiempos preincaicos cuando era '
                      'habitado por el grupo de los aimaras. En Lampa existen diferentes'
                      ' atractivos turísticos que atraen día a día a una amplia gama de '
                      'turistas. Su turismo relevante es predominantemente arqueológico,'
                      ' ya que en el lugar se encuentran diferentes restos en la '
                      'manifestación de pinturas rupestres, aunque tambi én existen '
                      'distintos puntos clave para la práctica del turismo ecológico.'
                      'Entre los puntos turísticos de interés de la provincia se encuentran:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    /*Image.asset(
                      'assets/images/lampa.png',
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),*/
                    YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.amber,
                      progressColors: ProgressBarColors(
                        playedColor: Colors.amber,
                        handleColor: Colors.amberAccent,
                      ),
                      onReady: () {
                        _controller.addListener(listener);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Las cuevas de Toro',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' Esta es conocida con dicho nombre a causa de la '
                                  'curiosa formación que presenta el montículo en el que '
                                  'se encuentra asentada. También es llamada con el nombre '
                                  'de cueva de Lenzora. Presenta una antigüedad aproximada '
                                  'de 3,000 años y en ella se pueden apreciar pinturas de '
                                  'tonalidades rojizas, predominantemente zoomorfas.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Fortaleza de Pucarani',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  ' Es uno de los legados arqueológicos más antiguos en '
                                  'su género. La muralla que circunda la fortaleza presenta '
                                  'una extensión de mil metros de largo y posiblemente fuera '
                                  'construida por algún grupo cultural preincaico. Existen además de '
                                  'los anteriores otros atractivos arqueológicos como  las cuevas '
                                  'de Coyllata en la cual también se han hallado pinturas rupestres,'
                                  ' así como también otras ciudades.json y ruinas preincaicas como la '
                                  'fortaleza de Lamparaquen, las chullpas de Tacara, entre otras, '
                                  'que vienen siendo preparadas para recibir visitas turísticas '
                                  'masivas. Junto con los anteriores, Lampa también como ciudad'
                                  ' resulta atractiva por la abundancia de queñuales que se encuentran'
                                  ' distribuidos en su territorio, además de esto por la arquitectura '
                                  'colonial de sus plazas, casonas  y templos. Esta provincia puneña '
                                  'también atraela atención del turista por las fiestas que se realizan '
                                  'en sárea, entre las que se reconoce a:',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Fiesta de la cruz',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  ' Que se realiza cada 3 de Mayo en honor a esta imagen '
                                  'religiosa, pero que también se ve mezclada con las '
                                  'celebraciones tradicionales del pueblo donde se '
                                  'incluyen bailes sociales y presentación de bandas locales. ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Aniversario de Lampa',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  ' Este es celebrado cada 21 de Junio en medio de un '
                                  'programa en el que se realizan actividades cívicas '
                                  'tradicionales, así como también aquellas que incentiven '
                                  'el turismo en la zona y resalten la riqueza gastronómica '
                                  'y artesanal del pueblo. ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Ceremonia del Hatun Ñakac o el Degollador',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  ' El día 24 de Julio cuando se realiza la representación '
                                  'escénica del ritual al dios conocido como el Degollador. ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'VIDEOS',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ), SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        'https://www.raptravel.org/images01/danzas-del-peru/danza-ayarachi.jpg',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
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
                              onTap: () => _launchURL(context,
                                  'https://www.youtube.com/watch?v=AUBSy34nRwI')),
                        ), SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        'https://www.losandes.com.pe/file/wp-content/uploads/2019/12/virgen.png',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
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
                              onTap: () => _launchURL(context,
                                  'https://www.facebook.com/MunicipioLampa/videos/932380646926269')),
                        ), SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        'https://i.ytimg.com/vi/jqOmusFmwyE/maxresdefault.jpg',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
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
                              onTap: () => _launchURL(context,
                                  'https://www.youtube.com/watch?v=HfQwskuhacQ')),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    )
                  ],
                ),
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

  listener() {}

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
}
