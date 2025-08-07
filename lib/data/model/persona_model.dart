class PersonaModel {
  final int id;
  final String name;
  final String species;
  final String status;
  final String image;

  PersonaModel({
    required this.id,
    required this.name,
    required this.species,
    required this.status,
    required this.image,
  });
  factory PersonaModel.fromJson(Map<String, dynamic> json) {
    return PersonaModel(
      id: json['id'] as int,
      name: json['name'] as String,
      species: json['species'] as String,
      status: json['status'] as String,
      image: json['image'] as String,
    );
  }
  @override
  String toString() {
    return 'PersonaModel(name: $name, species: $species, status: $status, image: $image)';
  }
}
