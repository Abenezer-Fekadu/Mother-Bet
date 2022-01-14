class Food {
  final String foodId;
  final Mother mother;
  final String name;
  final int price;
  final String image;
  final List<dynamic> ingredient;

  Food(this.foodId, this.mother, this.name, this.price, this.image,
      this.ingredient);

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      json['_id'] as String,
      Mother.fromJson(json["mother"]),
      json['name'] as String,
      json['price'] as int,
      json['image'] as String,
      json['ingredient'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': foodId,
      'mother': mother,
      'name': name,
      'price': price,
      'image': image,
      'ingredient': ingredient,
    };
  }
}

class Mother {
  final String name;
  final String motherId;
  Mother(
    this.motherId,
    this.name,
  );
  factory Mother.fromJson(Map<String, dynamic> json) =>
      Mother(json["_id"], json["name"]);

  Map<String, dynamic> toJson() => {
        "_id": motherId,
        "name": name,
      };
}

List<Food> demoFoods = [
  Food("wbjqw2-21s22d", new Mother("26881", "Mina"), 'Mina', 30,
      'images/shiro1.jpeg', ['mosh', "loga"]),
  Food("wbjqw2-21s22d", new Mother("26881", "Mina"), 'Maed', 30,
      'images/shiro2.jpeg', ['mosh', "loga"]),
  Food("wbjqw2-21s22d", new Mother("26881", "Mina"), 'Minab', 30,
      'images/shiro3.jpg', ['mosh', "loga"]),
  Food("wbjqw2-21s22d", new Mother("26881", "Mina"), 'Saron', 30,
      'images/shiro4.jpg', ['mosh', "loga"]),
  Food("wbjqw2-21s22d", new Mother("26881", "Mina"), 'Nahom', 30,
      'images/shiro5.jpeg', ['mosh', "loga"]),
];
