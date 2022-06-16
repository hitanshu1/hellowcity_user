class Cabin {
  int? id;
  String? name;
  String? type;
  String? status;
  String? subType;
  String? capacity;
  String?createdBy;
  String? storeResId;
  String? lastAssignOrderId;

  Cabin(
      {this.id,
        this.name,
        this.type,
        this.status,
        this.subType,
        this.capacity,this.createdBy,this.storeResId,this.lastAssignOrderId});

  Cabin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    subType = json['subtype'];
    storeResId=json['store_res_id'];
    capacity = json['capacity'];
    lastAssignOrderId=json['last_assign_order_id'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['subtype'] = this.subType;
    data['store_res_id']=this.storeResId;
    data['capacity']=this.capacity;
    data['created_by']=this.createdBy;
    data['last_assign_order_id']=this.lastAssignOrderId;
    return data;
  }
}