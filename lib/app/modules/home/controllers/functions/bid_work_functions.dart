
import 'package:hellowcity/app/model/usermodel.dart';

class BidWorkFunctions{
  final Function update;
  final UserModel? userDetails;
  BidWorkFunctions({required this.update, this.userDetails});

  bool isLoading=false;
}