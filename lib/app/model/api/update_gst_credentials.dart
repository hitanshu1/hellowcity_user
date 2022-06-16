
class UpdateGstCredentials{
  String? gstPercentage,storeResId;
  UpdateGstCredentials({this.gstPercentage,this.storeResId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gst_percentage'] = this.gstPercentage;
    data['id'] = this.storeResId;
    return data;
  }
}