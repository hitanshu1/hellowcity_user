class DeliveryPinCodeModel {
  int? id;
  String? pinCode;
  String? status;

  DeliveryPinCodeModel(
      {this.id,
        this.pinCode,
        this.status,});

  DeliveryPinCodeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pinCode = json['pincode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pincode'] = this.pinCode;
    return data;
  }
}