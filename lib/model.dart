class User {
  final String username;
  final String district;
  final String age;
  final String urlAvatar;

  const User({
    required this.username,
    required this.district,
    required this.age,
    required this.urlAvatar,

  });
  static User fromJson(json) => User
  (username: json['username'],
   district: json['district'],
   age: json['age'],
   urlAvatar: json['urlAvatar']
   );
}
