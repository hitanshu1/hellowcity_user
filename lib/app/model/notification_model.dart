
import 'usermodel.dart';

class NotificationModel{
  String? id;
  String? notificationType;
  String? title;
  bool seen;
  UserModel? sendTo;
  var value;
  UserModel? sendBy;
  String? created;
  NotificationModel({this.value,this.notificationType,this.sendTo,
    this.seen:false,this.sendBy,this.id,this.created,this.title});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(id!=null){
      data['id']=this.id;
    }
    data['notificationType']=this.notificationType;
    data['seen']=this.seen;
    data['sendBy']=this.sendBy?.toJson();
    data['value'] = this.value?.toJson();
    data['sendTo']=this.sendTo?.toJson();
    data['title']=this.title;
    data['created']=this.created??DateTime.now().millisecondsSinceEpoch.toString();
    return data;
  }
  factory NotificationModel.fromMap(Map<dynamic, dynamic> data) {

    final String id = data['id'];
    final String notificationType = data['notificationType']??"";
    final bool seen = data['seen']??false;
    final UserModel? sendBy = data['sendBy']!=null?UserModel.fromJson(data['sendBy'],):null;
    final UserModel? sendTo=data['sendTo']!=null?UserModel.fromJson(data['sendTo'],):null;
    final String created=data['created']??'';
    final String title=data['title']??'';
    var value;
    // if(data['notificationType']==NotificationType.proposalNotification||data['notificationType']==NotificationType.updateJobStatus){
    //   value =BidJobModel.fromMap(data['value']);
    // }else if(data['notificationType']==NotificationType.bidNotification){
    //   value=BidJobModel.fromMap(data['value']);
    // }


    return NotificationModel(
        id: id,
        notificationType: notificationType,
        seen: seen,
        value: value,
        title: title,
        created: created,
        sendBy:sendBy,
        sendTo:sendTo
    );
  }
}