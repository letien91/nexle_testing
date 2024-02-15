import 'package:nexle_testing/models/category.dart';

class CategoriesResponse {
  const CategoriesResponse({
    this.categories = const <TCategory>[],
  });

  factory CategoriesResponse.fromArray(List<dynamic> list) {
    return CategoriesResponse(
      categories: list
          .map((dynamic e) => TCategory.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<TCategory> categories;
}
