import 'package:flutter_wallpaper/model/categories_model.dart';

String apiKey = 'YOUR_API_KEY';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      'https://cdn.pixabay.com/photo/2015/11/16/14/43/cat-1045782__340.jpg';
  categoriesModel.categoryName = 'Cats';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      'https://cdn.pixabay.com/photo/2016/07/15/15/55/dachshund-1519374__340.jpg';
  categoriesModel.categoryName = 'Dogs';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      'https://cdn.pixabay.com/photo/2017/09/01/20/23/ford-2705402__340.jpg';
  categoriesModel.categoryName = 'Cars';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      'https://cdn.pixabay.com/photo/2015/11/16/14/43/cat-1045782__340.jpg';
  categoriesModel.categoryName = 'Cats';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      'https://cdn.pixabay.com/photo/2016/04/07/06/53/bmw-1313343__340.jpg';
  categoriesModel.categoryName = 'Bikes';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      'https://cdn.pixabay.com/photo/2017/06/07/10/47/elephant-2380009__340.jpg';
  categoriesModel.categoryName = 'Animals';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      'https://cdn.pixabay.com/photo/2016/11/08/05/11/children-1807511__480.jpg';
  categoriesModel.categoryName = 'Culture';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      'https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072__340.jpg';
  categoriesModel.categoryName = 'Islands';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      'https://cdn.pixabay.com/photo/2016/10/14/19/21/canyon-1740973__340.jpg';
  categoriesModel.categoryName = 'Mountain';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      'https://cdn.pixabay.com/photo/2012/03/01/00/55/garden-19830__340.jpg';
  categoriesModel.categoryName = 'Garden';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  return categories;
}
