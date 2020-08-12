import 'package:flutter/material.dart';

class ImageFit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage('assets/images/003.jpg');
    
    return Scaffold(
      appBar: AppBar(
        title: Text('图片Fit属性'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Image>[
            Image(
              image: img,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.fitWidth,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.fitHeight,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.scaleDown,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.none,
            ),
            Image(
              image: img,
              width: 100,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              height: 50,
              width: 300,
              repeat: ImageRepeat.repeatX,
            ),
          ].map((e) {
            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 100,
                    child: e,
                  ),
                ),
                Text(e.fit.toString() + (e.colorBlendMode == null ? '' : ' --- ' + e.colorBlendMode.toString())),
              ],
            );
          }).toList(),
        ),
      ),
    );
  } 
}