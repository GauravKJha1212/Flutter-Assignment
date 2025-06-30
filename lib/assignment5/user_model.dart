class Address {
  final String address;
  final String city;
  final String state;

  Address({required this.address, required this.city, required this.state});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json['address'] ?? '',
        city: json['city'] ?? '',
        state: json['state'] ?? '',
      );
}

class Company {
  final String name;
  final String department;
  final String title;
  final Address? address;

  Company({
    required this.name,
    required this.department,
    required this.title,
    this.address,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json['name'] ?? '',
        department: json['department'] ?? '',
        title: json['title'] ?? '',
        address:
            json['address'] != null ? Address.fromJson(json['address']) : null,
      );
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final Address? address;
  final Company? company;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    this.address,
    this.company,
  });

  String get fullName => '$firstName $lastName';

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        email: json['email'] ?? '',
        image: json['image'] ?? '',
        address:
            json['address'] != null ? Address.fromJson(json['address']) : null,
        company:
            json['company'] != null ? Company.fromJson(json['company']) : null,
      );
}

