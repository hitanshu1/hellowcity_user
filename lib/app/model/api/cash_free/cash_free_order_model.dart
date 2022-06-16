class CashFreeOrderModel {
  String? stage;
  String? orderId ;
  String? orderAmount ;
  String? tokenData;
  String? customerName;
  String? orderNote ;
  String? orderCurrency ;
  String? appId ;
  String? customerPhone ;
  String? customerEmail;
  String? notifyUrl ;

  CashFreeOrderModel({this.customerName,this.orderId,this.customerPhone,this.appId,this.customerEmail,this.notifyUrl,this.orderAmount,
  this.orderCurrency,this.orderNote,this.stage,this.tokenData});


  Map<String, dynamic> toMap() {
    return {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };
  }

  String toString() {
    return " \norderId" +
        (orderId??'') +
        " \norderAmount " +
        (orderAmount??'') +
        " \ncustomerName " +
        (customerName??'') +
        " \norderNote " +
        (orderNote??'') +
        " \norderCurrency " +
        (orderCurrency??'') +
        " \nappId " +
        (appId??'') +
        " \ncustomerPhone " +
        (customerPhone??'') +
        " \ncustomerEmail " +
        (customerEmail??'') +
        " \nstage " +
        (stage??'') +
        " \nnotifyUrl " +
        (notifyUrl??'') +
        " \ntokenData " +
        (tokenData??'');
  }
}

