
import 'package:intl/intl.dart';

class NumberFormatService{

  static final priceFormat= NumberFormat('\u20B9###,###.00',"en_US");
  static String convertNumber(String num,) {
    String newNum;
    String _numberDecimalDivider;
    String _numberFullDivider;

    _numberDecimalDivider = '.';
    _numberFullDivider = ',';

    final List<String> stringCommaList = num.split(RegExp(r'[,|.]'));
    final String afterCommaString = stringCommaList.length == 2 ? stringCommaList.last : '';

    newNum = stringCommaList.first;
    if ((newNum.isEmpty)) newNum = '0';
    newNum = _convertNewNum(newNum, _numberFullDivider);

    switch (afterCommaString.length) {
      case 0:

        return newNum += '${_numberDecimalDivider}00';
      case 1:

        return newNum += _numberDecimalDivider + stringCommaList.last[0] + '0';
      case 2:

        return newNum += _numberDecimalDivider + stringCommaList.last;
      default:

        return newNum += _numberDecimalDivider + stringCommaList.last.substring(0, 2);
    }
  }
  static String _convertNewNum(String newNum, String _numberFullDivider){

    switch (newNum.length) {
      case 4:
        return newNum[0] + _numberFullDivider + newNum.substring(1, newNum.length);
      case 5:
        return newNum.substring(0, 1) + _numberFullDivider + newNum.substring(2, newNum.length);
      case 6:
        return newNum.substring(0, 2) + _numberFullDivider + newNum.substring(3, newNum.length);
      case 7:
        return newNum.substring(0, 3) + _numberFullDivider + newNum.substring(4, newNum.length);
      case 8:
        return newNum[0] +
            _numberFullDivider +
            newNum.substring(1, 4) +
            _numberFullDivider +
            newNum.substring(5, newNum.length);
      default: return newNum;
    }
  }
}