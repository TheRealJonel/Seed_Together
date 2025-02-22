class UserModel {
  final String username;
  final String? location;
  final String? gardenType;
  final String? preferredPlants;
  final String? gardeningStyle;

  UserModel({
    required this.username,
    this.location,
    this.gardenType,
    this.preferredPlants,
    this.gardeningStyle,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json['username'] as String,
        location: json['location'] as String?,
        gardenType: json['gardenType'] as String?,
        preferredPlants: json['preferredPlants'] as String?,
        gardeningStyle: json['gardeningStyle'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'location': location,
        'gardenType': gardenType,
        'preferredPlants': preferredPlants,
        'gardeningStyle': gardeningStyle,
      };
}