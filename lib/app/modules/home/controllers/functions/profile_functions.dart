
import 'package:hellowcity/app/model/usermodel.dart';

class ProfileFunctions{
  final Function update;
  final UserModel? userDetails;
  ProfileFunctions({required this.update, this.userDetails});
  bool isLoading=false;
}