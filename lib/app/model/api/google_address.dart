
class GoogleAddress{
  String? addressLine;
  String? state;
  String? pinCode;
  String? country;
  String? city;
  GoogleAddress({this.pinCode,this.state,this.addressLine,this.city,this.country});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressLine'] =
        this.addressLine;
    data['state'] = this.state;
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}