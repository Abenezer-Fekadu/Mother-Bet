class Food {
  final String foodId;
  final String motherId;
  final String name;
  final String description;
  final int price;
  final String image;
  final List<dynamic> ingridient;

  Food(this.foodId, this.motherId, this.name, this.description, this.price,
      this.image, this.ingridient);

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      json['food_id'] as String,
      json['mother_id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['price'] as int,
      json['image'] as String,
      json['ingridient'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food_id': foodId,
      'mother_id': motherId,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'ingridient': ingridient,
    };
  }
}

List<Food> demoFoods = [
  Food(
      "wbjqw2-21s22d",
      "cm90wdw-wcncjq-12918w",
      'Mina',
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.",
      30,
      'images/shiro1.jpeg',
      ['mosh', "loga"]),
  Food(
      "wbjqw2-21s22d",
      "cm90wdw-wcncjq-12918w",
      'Maed',
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.",
      30,
      'images/shiro2.jpeg',
      ['mosh', "loga"]),
  Food(
      "wbjqw2-21s22d",
      "cm90wdw-wcncjq-12918w",
      'Minab',
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.",
      30,
      'images/shiro3.jpg',
      ['mosh', "loga"]),
  Food(
      "wbjqw2-21s22d",
      "cm90wdw-wcncjq-12918w",
      'Saron',
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.",
      30,
      'images/shiro4.jpg',
      ['mosh', "loga"]),
  Food(
      "wbjqw2-21s22d",
      "cm90wdw-wcncjq-12918w",
      'Nahom',
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.",
      30,
      'images/shiro5.jpeg',
      ['mosh', "loga"]),
];
