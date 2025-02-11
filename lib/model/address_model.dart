class AddressModel {
  String Housename;
  String Roadname;
  String city;
  String pincode;
  String state;
  String radioValue;
  String id;
  AddressModel(
      {required this.Housename,
      required this.Roadname,
      required this.state,
      required this.city,
      required this.pincode,
      required this.id,
      required this.radioValue});

  Map<String, dynamic> tomap() {
    return <String, dynamic>{
      "Housename": Housename,
      "Roadname": Roadname,
      "state": state,
      "city": city,
      "pincode": pincode,
      "radioValue": radioValue,
      "id": id,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
        Housename: map["Housename"] as String,
        Roadname: map["Roadname"] as String,
        state: map["state"] as String,
        city: map["city"] as String,
        pincode: map["pincode"] as String,
        id: map["id"] as String,
        radioValue: map["radioValue"] as String);
  }
}
