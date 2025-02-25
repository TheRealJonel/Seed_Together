class UserModel {
  final String? aboutMe; // 🆕 Neues Feld: "Über mich"
  final String username;
  final String? location;
  final String? gardenType;
  final String? preferredPlants;
  final String? gardeningStyle;

  UserModel({
    this.aboutMe,
    required this.username,
    this.location,
    this.gardenType,
    this.preferredPlants,
    this.gardeningStyle,
  });

  // Factory-Methode zum Erstellen eines UserModel aus JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    aboutMe: json['aboutMe'] as String?, // 🆕 Hinzugefügt
    username: json['username'] as String,
    location: json['location'] as String?,
    gardenType: json['gardenType'] as String?,
    preferredPlants: json['preferredPlants'] as String?,
    gardeningStyle: json['gardeningStyle'] as String?,
  );

  // Methode zum Konvertieren eines UserModel in JSON
  Map<String, dynamic> toJson() => {
    'aboutMe': aboutMe, // 🆕 Hinzugefügt
    'username': username,
    'location': location,
    'gardenType': gardenType,
    'preferredPlants': preferredPlants,
    'gardeningStyle': gardeningStyle,
  };
}
