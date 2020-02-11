import 'package:fluttercontact/core/services/api.dart';
import 'package:fluttercontact/core/viewmodels/CRUDModel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => Api('contact'));
  locator.registerLazySingleton(() => CRUDModel());
}