class User {
  final String username;
  final String district;
  final String age;
  final String photo;

  const User({
    required this.username,
    required this.district,
    required this.age,
    required this.photo,

  });
  static User fromJson(json) => User
  (username: json['name'],
   district: json['district'],
   age: json['age'],
   photo: json['image']
   );
}
