import 'package:flutter/material.dart';

class BottomBarWid extends StatelessWidget {
  Function(int) onTap;
  List<bool> actIndbottom;

  BottomBarWid({@required this.onTap, @required this.actIndbottom});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(54)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  'Atractivos',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Container(
                  width: 44.1,
                  height: 4.12,
                  decoration: BoxDecoration(
                      color: actIndbottom[0] ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(54)),
                )
              ],
            ),
            onTap: () => onTap(0),
          ),
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  'Ciudades',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Container(
                  width: 44.1,
                  height: 4.12,
                  decoration: BoxDecoration(
                      color: actIndbottom[1] ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(54)),
                )
              ],
            ),
            onTap: () => onTap(1),
          ),
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  'Principal',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Container(
                  width: 44.1,
                  height: 4.12,
                  decoration: BoxDecoration(
                      color: actIndbottom[2] ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(54)),
                )
              ],
            ),
            onTap: () => onTap(2),
          ),
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  'Distritos',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Container(
                  width: 44.1,
                  height: 4.12,
                  decoration: BoxDecoration(
                      color: actIndbottom[3] ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(54)),
                )
              ],
            ),
            onTap: () => onTap(3),
          ),
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  'Gastronomía',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Container(
                  width: 44.1,
                  height: 4.12,
                  decoration: BoxDecoration(
                      color: actIndbottom[4] ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(54)),
                )
              ],
            ),
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}
