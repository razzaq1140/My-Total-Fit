class User {
  final String imageUrl;
  final String username;
  final String email;

  User({
    required this.imageUrl,
    required this.username,
    required this.email,
  });
}

final dummyUser = User(
  imageUrl:
      'https://img.lovepik.com/photo/48013/9719.jpg_wh860.jpg', // Replace with a valid image URL
  username: 'Jack Johan',
  email: 'jackjohan@gmail.com',
);
