import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String? imgUrl;
  ImageView({required this.imgUrl});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl!,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imgUrl!, fit: BoxFit.cover)),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        color: Color(0XFF1C1B1B).withOpacity(0.8),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white60, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              Color(0X36FFFFFF),
                              Color(0X0FFFFFFF)
                            ])),
                        child: Column(
                          children: [
                            Text(
                              'Set Wallpaper',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.white70),
                            ),
                            Text(
                              'Image will be saved in gallery',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.white70),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
