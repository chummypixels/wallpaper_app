import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/data/data.dart';
import 'package:flutter_wallpaper/model/wallpaper_model.dart';
import 'package:flutter_wallpaper/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String? searchQuery;

  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
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
    getSearchWallpapers(widget.searchQuery!);
    super.initState();
    _searchController.text = widget.searchQuery!;
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Color(0XFFF5F8FD),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                            hintText: 'Search wallpapers',
                            border: InputBorder.none),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          getSearchWallpapers(_searchController.text);
                        },
                        child: Icon(Icons.search)),
                  ],
                ),
              ),
              SizedBox(height: 16),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
