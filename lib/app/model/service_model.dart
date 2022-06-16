

class ServiceModel {
  int? id;
  String? companyName;
  String? category;
  String? startYear;
  String? phone;
  String? addressLine1;
  String? addressLine2;
  String? pincode;
  String? gstNumber;
  String? logoUrl;
  String? gstDocUrl;
  String? createdAt;
  String? updatedAt;
  String? status;
  String?createdBy;
  String?description;
  String ?userType;
  var logoImage,gstDoc;

  ServiceModel(
      {this.id,
        this.companyName,
        this.category,
        this.startYear,
        this.phone,
        this.addressLine1,
        this.addressLine2,
        this.pincode,
        this.gstNumber,
        this.logoUrl,
        this.gstDocUrl,
        this.createdAt,
        this.updatedAt,
        this.status,this.gstDoc,this.logoImage,this.createdBy,this.description,this.userType});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    category = json['category'];
    startYear = json['start_year'];
    phone = json['phone'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    pincode = json['pincode'];
    gstNumber = json['gst_number'];
    logoUrl = json['logo_url'];
    gstDocUrl = json['gst_doc_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy=json['created_by'];
    status = json['status'];
    description=json['description'];
    userType=json['user_type'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    if(this.id!=null){
      data['id'] = this.id.toString();
    }
    data['company_name'] = this.companyName??'';
    data['category'] = this.category??'';
    data['start_year'] = this.startYear??'';
    data['phone'] = this.phone??'';
    data['address_line_1'] = this.addressLine1??'';
    data['address_line_2'] = this.addressLine2??'';
    data['pincode'] = this.pincode??'';
    data['gst_number'] = this.gstNumber??'';
    data['created_at'] = this.createdAt??'';
    data['updated_at'] = this.updatedAt??'';
    data['created_by']=this.createdBy??'';
    data['status'] = this.status??'';
    data['description']=this.description??'';
    return data;
  }
}