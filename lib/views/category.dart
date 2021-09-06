import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/model/wallpaper_model.dart';
import 'package:flutter_wallpaper/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_wallpaper/data/data.dart';

class Category extends StatefulWidget {
  final String? categoryName;
  Category({this.categoryName});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<WallpaperModel> wallpapers = [];
  getSearchWallpapers(String query) async {
    var response = await http.get(
        Uri.parse(
            'https://api.pexels.com/v1/search?query=$query&per_page=15&page=1'),
        headers: {'Authorization': apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categoryName!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 16),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
