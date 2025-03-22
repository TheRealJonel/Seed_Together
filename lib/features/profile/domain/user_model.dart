class UserModel {
  final String username;
  final String? aboutMe;
  final String? location;
  final String? gardenType;
  final String? preferredPlants;
  final String? gardeningStyle;

  UserModel({
    required this.username,
    this.aboutMe,
    this.location,
    this.gardenType,
    this.preferredPlants,
    this.gardeningStyle,
  });
}
