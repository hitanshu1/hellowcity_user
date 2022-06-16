
class AppCharge{
  int serviceTax=0;
  int gstPercentage=0;
  AppCharge({required this.gstPercentage,required this.serviceTax});
  factory AppCharge.fromMap(Map<dynamic, dynamic> data) {
    final int serviceTax = int.parse(data['service_tax']??'0');
    final int gstPercentage =  int.parse(data['gst']??'0');
    return AppCharge(

        serviceTax: serviceTax,
        gstPercentage: gstPercentage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'service_tax': serviceTax,
      'gst': gstPercentage,
    };
  }
}