class Contact {
  String id;
  String name;
  String phone;

  Contact({this.id,this.name,this.phone});

  Contact.fromMap(Map snapshot,String id) :
    id = id ?? '',
    name = snapshot['name'] ?? '',
    phone = snapshot['phone'] ?? '';


  toJson(){
    return {
      "phone": phone,
      "name": name,
    };
  }
}