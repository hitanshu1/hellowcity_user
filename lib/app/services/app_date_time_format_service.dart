
import 'package:intl/intl.dart';

class AppDateTimeFormatService{
  static String dateWithTime(val) => val!=null?(DateFormat('dd-MM-yyyy – KK:mm aa').format(val)):'';

  static String getDateMonthYear(String? val){
    if(val!=null){
      DateTime? _date=DateTime.parse(val);
      if(_date!=null){
        var formatTime = DateFormat("dd/MM/yyyy").format(_date);
        return formatTime.toString();
      }else{
        return '';
      }

    }else{
      return '';
    }

  }
  static String getTime(String? val){
    if(val!=null){
      DateTime? _date=DateTime.parse(val);
      if(_date!=null){
        var formatTime = DateFormat("KK:mm aa").format(_date);
        return formatTime.toString();
      }else{
        return '';
      }

    }else{
      return '';
    }

  }
  static String getMonthYear(String? val){
    if(val!=null){
      DateTime? _date=DateTime.parse(val);
      if(_date!=null){
        var formatTime = DateFormat("MM/yyyy").format(_date);
        return formatTime.toString();
      }else{
        return '';
      }

    }else{
      return '';
    }

  }
  static String getYear(String? val){
    if(val!=null){
      DateTime? _date=DateTime.parse(val);
      if(_date!=null){
        var formatTime = DateFormat("yyyy").format(_date);
        return formatTime.toString();
      }else{
        return '';
      }

    }else{
      return '';
    }

  }
  static String getTodayDay(){
    String _day=DateFormat('EEEE').format(DateTime.now());
    return _day;

  }
}