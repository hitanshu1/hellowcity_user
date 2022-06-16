class AddressModel{

  int? id;
  String? userID;
  String? name;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? country;
  String? phone;
  String? state;
  String? houseNumber;
  String? pinCode;
  String? landmark;
  bool defaultAddress;
  String ?district;
  AddressModel({this.landmark,this.district,this.name,this.userID,this.houseNumber,this.phone,this.country,this.state,this.city,this.addressLine1,this.addressLine2,this.id,this.pinCode,this.defaultAddress=false});

  String get fullAddress =>(addressLine1??'')+((addressLine2??''))+'\n'+(district??'')+',${state??''}'+'\n'+'${country??''}, '+(pinCode??'');
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(id!=null){
      data['id']=this.id.toString();
    }
    data['address_line_1']=this.addressLine1??'';
    data['address_line_2']=this.addressLine2??'';
    data['name']=this.name??'';
    data['user_id']=this.userID??'';
    data['city'] = this.city??'';
    data['country'] = this.country??'';
    data['state'] = this.state??'';
    data['phone']=this.phone??'';
    data['district']=this.district??'';
    data['is_default']=this.defaultAddress.toString();
    data['pincode'] = this.pinCode??'';
    data['landmark']=this.landmark??'';
    return data;
  }
  factory AddressModel.fromMap(Map<dynamic, dynamic> data) {

    final int id = data['id'];
    final String addressLine1 = data['address_line_1']??"";
    final String addressLine2 = data['address_line_2']??"";
    final String city = data['city']??"";
    final String  country=data['country']??'';
    final String state=data['state']??'';
    final String phone=data['phone']??'';
    final String name=data['name']??'';
    final String houseNumber=data['houseNumber']??'';
    final String district=data['district']??'';
    final String pinCode=data['pincode']??'';
    final String userID=data['user_id']??'';
    final String landmark=data['landmark']??'';
    final bool defaultAddress=data['is_default']=='true'?true:false;

    return AddressModel(
      id: id,
        userID: userID,
        landmark:landmark,

        addressLine1: addressLine1,
        addressLine2: addressLine2,
        city: city,
        country: country,
        district: district,
        state: state,
        phone: phone,
        name: name,
        houseNumber: houseNumber,
        pinCode: pinCode,
      defaultAddress: defaultAddress
    );
  }

}