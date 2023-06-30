class Animal {
  int id;
  String name;

  Animal({required this.id, required this.name});
  // サーバー側とやりとりして、データを取得するときに使う
  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'] ?? 0,// 0を入れておかないとエラーになる
      name: json['name'] ?? '',// ''を入れておかないとエラーになる
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
