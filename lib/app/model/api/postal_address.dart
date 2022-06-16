class PostalAddress {
  String? name;
  String? description;
  String? branchType;
  String? deliveryStatus;
  String? taluk;
  String? circle;
  String? district;
  String? division;
  String? region;
  String? state;
  String? country;

  PostalAddress(
      {this.name,
        this.description,
        this.branchType,
        this.deliveryStatus,
        this.taluk,
        this.circle,
        this.district,
        this.division,
        this.region,
        this.state,
        this.country});

  PostalAddress.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    description = json['Description'];
    branchType = json['BranchType'];
    deliveryStatus = json['DeliveryStatus'];
    taluk = json['Taluk'];
    circle = json['Circle'];
    district = json['District'];
    division = json['Division'];
    region = json['Region'];
    state = json['State'];
    country = json['Country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['BranchType'] = this.branchType;
    data['DeliveryStatus'] = this.deliveryStatus;
    data['Taluk'] = this.taluk;
    data['Circle'] = this.circle;
    data['District'] = this.district;
    data['Division'] = this.division;
    data['Region'] = this.region;
    data['State'] = this.state;
    data['Country'] = this.country;
    return data;
  }
}