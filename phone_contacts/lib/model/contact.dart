class Contact {
  String name;
  String phoneNumber;
  String? avatar;
  static List<Contact> contacts = [
    Contact(name: "Dali", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Jorge", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Jesus", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Szalai", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Martial", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Marcus", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Stewie", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Peter", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Louis", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Chris", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Brian", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Pepe", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "David", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Lucas", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Mark", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Martin", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Zey", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Mehmet", phoneNumber: "0555 555 55 55", avatar: ""),
    Contact(name: "Salvador", phoneNumber: "0555 555 55 55", avatar: ""),
  ];

  Contact({required this.name, required this.phoneNumber, this.avatar});

  /*Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["phone_number"] = phoneNumber;
    map["avatar"] = avatar;
    return map;
  }

  Contact.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    phoneNumber = map["phone_number"];
    avatar = map["avatar"];
  }*/
}
