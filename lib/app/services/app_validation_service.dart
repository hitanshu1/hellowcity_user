
class AppValidationService{
  static String? stringValidator(String value, String controllerName) {
    if (value.isEmpty) {
      return "Please enter $controllerName";
    }
    return null;
  }
  static String? stringYearValidator(String value, String controllerName) {
    if (value.isEmpty) {
      return "Please enter $controllerName";
    }else if(value.length!=4){
      return 'Invalid year';
    }
    return null;
  }
  static String? stringPhoneValidator(String value, String controllerName) {
    if (value.isEmpty) {
      return "Please enter $controllerName";
    }else if(value.length!=10){
      return 'Invalid year';
    }
    return null;
  }
}