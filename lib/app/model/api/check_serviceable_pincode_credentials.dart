
class CheckServiceablePinCodeCredentials{
  String? useId,pinCode;
  CheckServiceablePinCodeCredentials({this.pinCode,this.useId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.useId;
    data['pincode'] = this.pinCode;
    return data;
  }
}