import 'package:get/get.dart';

import 'as_in.dart';
import 'en_us.dart';

class AppTranslations extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US':EnUsTranslationData.data,
    "as_IN":AsInTranslationData.data
  };

}