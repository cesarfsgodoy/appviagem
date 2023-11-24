class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;

  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    // print("----------json-----------");
    // print(json);
    // var aux = json["_fieldsProto"];
    // var img = aux["img"];
    // var name = aux["name"];
    // var price = aux["price"];
    // var people = aux["people"];
    // var stars = aux["stars"];
    // var description= aux["description"];
    // var location = aux["location"];

    // print("----------aux------------");
    // print(aux.toString());
    // print("----------atributos------------");
    // print(price["integerValue"]);
    // print(name["stringValue"]);


    return DataModel(
      name: json["name"],
      img: json["img"],
      price: json["price"],
      people: json["people"],
      stars: json["stars"],
      description: json["description"],
      location: json["location"],
    );
  }
}

class DataModelFirebase {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;

  DataModelFirebase({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });
  factory DataModelFirebase.fromJson(Map<String, dynamic> json) {
    print("----------json-----------");
    print(json);
    var aux = json["_fieldsProto"];
    var img = aux["img"];
    var name = aux["name"];
    var price = aux["price"];
    var people = aux["people"];
    var stars = aux["stars"];
    var description= aux["description"];
    var location = aux["location"];

    print("----------aux------------");
    print(aux.toString());
    print("----------atributos------------");
    print(price["integerValue"]);
    print(name["stringValue"]);


    return DataModelFirebase(
      name: name["stringValue"],
      img: img["stringValue"],
      price: price["integerValue"],
      people: people["integerValue"],
      stars: stars["integerValue"],
      description: description["stringValue"],
      location: location["stringValue"],
    );
  }
}




// return DataModel(
//       name: json["name"],
//       img: json["img"],
//       price: json["price"],
//       people: json["people"],
//       stars: json["stars"],
//       description: json["description"],
//       location: json["location"],
//     );