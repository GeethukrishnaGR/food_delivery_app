class Food {
  final int id;
  final String title;
  final String image;
  final double price;

  Food({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }
}