import 'dart:math';

class UIMeta {
  String color1 = "#11254A";
  String color2 = "#FFFFFF";
  String hideOrderId = "false";

  static String getRandomNo() {
    var rng =  Random();
    return 'order ${rng.nextInt(1000000)}';
  }

  Map<String, dynamic> toMap() {
    return {"color1": color1, "color2": color2};
  }

  String toString() {
    return " \ncolor1 $color1 \ncolor1  $color2  \nhideOrderId $hideOrderId";
  }
}