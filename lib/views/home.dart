import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/data/data.dart';
import 'package:flutter_wallpaper/model/categories_model.dart';
import 'package:flutter_wallpaper/model/wallpaper_model.dart';
import 'package:flutter_wallpaper/views/category.dart';
import 'package:flutter_wallpaper/views/image_view.dart';
import 'package:flutter_wallpaper/views/search.dart';
import 'package:flutter_wallpaper/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];

  TextEditingController _searchController = TextEditingController();

  getTrendingWallpapers() async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?per_page=15&page=1'),
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
    getTrendingWallpapers();
    categories = getCategories();
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
        physics: ClampingScrollPhysics(),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Search(
                                searchQuery: _searchController.text,
                              ),
                            ),
                          );
                        },
                        child: Icon(Icons.search)),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) {
                    return CategoryTile(
                        imgUrl: categories[index].imgUrl,
                        title: categories[index].categoryName);
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                ),
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imgUrl, title;

  CategoryTile({required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Category(
                      categoryName: title.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              height: 50,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
