class product {
  final String title;
  // final String price;
  // final String rating;
  final String image;
  final String description;
  final String category;

  product({
    required this.title,
    // required this.price,
    // required this.rating,
    required this.image,
    required this.description,
    required this.category
  });

  factory product.fromJson(Map<String, dynamic> json) {
    return product(
      title: json['title'] as String,
      // price: json['price'] as String,
      // rating: json['rating'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
    );

  }
}
